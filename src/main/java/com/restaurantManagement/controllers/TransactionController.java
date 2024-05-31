package com.restaurantManagement.controllers;

import com.restaurantManagement.models.Restaurant;
import com.restaurantManagement.models.ShoppingCart;
import com.restaurantManagement.models.Transaction;
import com.restaurantManagement.models.User;
import com.restaurantManagement.services.ShoppingCartService;
import com.restaurantManagement.services.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

@Controller
public class TransactionController {

    private final TransactionService transactionService;
    private final ShoppingCartService shoppingCartService;

    @Autowired
    public TransactionController(TransactionService transactionService,ShoppingCartService shoppingCartService) {
        this.transactionService = transactionService;
        this.shoppingCartService = shoppingCartService;
    }

    @GetMapping("checkout")
    public String checkOut(HttpSession session, Model model) throws SQLException {
        User user = (User) session.getAttribute("signedInUser");
        Restaurant restaurant = (Restaurant) session.getAttribute("selectedRestaurant");
        List<ShoppingCart> items = shoppingCartService.getTransactions(user.getUserId(),restaurant.getRestId());
        int resPrice = 0;
        int resCount = 0;
        for (ShoppingCart item : items) {
            resPrice = resPrice + (item.getFoodPrice() * item.getFoodCount());
            resCount = resCount + item.getFoodCount();
        }
        items.removeAll(items);
        model.addAttribute("resultPrice",resPrice);
        model.addAttribute("resultCount",resCount);
        return "purchase";
    }


    @PostMapping("purchase")
    public void purchase(HttpSession session, @RequestParam("address") String address, @RequestParam("resultPrice") String resPrice,
                           @RequestParam("resultCount") String resCount) throws SQLException {

        User user = (User) session.getAttribute("signedInUser");
        Restaurant restaurant = (Restaurant) session.getAttribute("selectedRestaurant");
        List<ShoppingCart> items = shoppingCartService.getTransactions(user.getUserId(),restaurant.getRestId());
        transactionService.addTransaction(user.getUserId(),restaurant.getRestId(),address,Integer.parseInt(resPrice),Integer.parseInt(resCount));
        for (ShoppingCart item : items) {
            shoppingCartService.removeTransaction(item.getTransactionId());
        }
    }


}
