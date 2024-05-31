package com.restaurantManagement.controllers;

import com.restaurantManagement.models.Restaurant;
import com.restaurantManagement.models.ShoppingCart;
import com.restaurantManagement.models.User;
import com.restaurantManagement.services.ShoppingCartService;
import com.restaurantManagement.services.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

@Controller
public class ShoppingCartController {

    private final ShoppingCartService shoppingCartService;

    @Autowired
    public ShoppingCartController(ShoppingCartService shoppingCartService) {
        this.shoppingCartService = shoppingCartService;
    }

    @ModelAttribute("transactions")
    public List<ShoppingCart> shoppingCartList(HttpSession session) throws SQLException {
        User user = (User) session.getAttribute("signedInUser");
        Restaurant restaurant = (Restaurant) session.getAttribute("selectedRestaurant");
        return shoppingCartService.getTransactions(user.getUserId(), restaurant.getRestId());
    }

    @GetMapping("shoppingCart")
    public String shoppingCart() {
        System.out.println("fuck all of you");
        return "shoppingCart";
    }

    @PostMapping("updateCart")
    @ResponseBody
    public ResponseEntity<String> updateCart(@RequestParam("transactionId") String transactionId, @RequestParam("foodCount") int foodCount, HttpSession session) throws SQLException {
        System.out.println(foodCount + " in updateCart method");
        shoppingCartService.updateShoppingCart(transactionId,foodCount);
        return ResponseEntity.ok("Shopping Cart updated !");
    }

    @PostMapping("removeFromCart")
    @ResponseBody
    public ResponseEntity<String> removeFromCart(@RequestParam("transactionId") String transactionId) throws SQLException {
        shoppingCartService.removeTransaction(transactionId);
        return ResponseEntity.ok("Item removed from cart");
    }

    @PostMapping("checkout")
    public String checkOut() {
        return "purchase";
    }


}
