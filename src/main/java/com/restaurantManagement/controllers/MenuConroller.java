package com.restaurantManagement.controllers;

import com.restaurantManagement.models.*;
import com.restaurantManagement.services.MenuService;
import com.restaurantManagement.services.RestaurantService;
import com.restaurantManagement.services.ShoppingCartService;
import com.restaurantManagement.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Controller
public class MenuConroller {
    private final MenuService menuService;
    private final ShoppingCartService shoppingCartService;

    @Autowired
    public MenuConroller(MenuService menuService, ShoppingCartService shoppingCartService) {
        this.menuService = menuService;
        this.shoppingCartService = shoppingCartService;
    }

    @ModelAttribute("foods")
    public List<Menu> foods(HttpSession session) throws SQLException {
        Restaurant restaurant = (Restaurant) session.getAttribute("selectedRestaurant");
        return menuService.getFoods(restaurant.getRestId());
    }

    @ModelAttribute("transactions")
    public List<ShoppingCart> transactions(HttpSession session) throws SQLException {
        User user = (User) session.getAttribute("signedInUser");
        Restaurant restaurant = (Restaurant) session.getAttribute("selectedRestaurant");
        return shoppingCartService.getTransactions(user.getUserId(), restaurant.getRestId());
    }


    @GetMapping("menu")
    public String menu(Model model, HttpSession session) throws SQLException {
        Restaurant restaurant = (Restaurant) session.getAttribute("selectedRestaurant");
        User user = (User) session.getAttribute("signedInUser");
        model.addAttribute("user",user);
        return "menu";
    }


    @ModelAttribute("transaction")
    public ShoppingCart transaction() {
        return new ShoppingCart("","","","","",0,0,"","");
    }
    @PostMapping("addToCart")
    @ResponseBody
    public String addToCart(@RequestParam("foodId") String foodId, @RequestParam("foodCount") String foodCount, HttpSession session) throws SQLException {
        ShoppingCart addTransaction = new ShoppingCart("","","","","",0,0,"","");
        User user = (User) session.getAttribute("signedInUser");
        Menu menu = menuService.getFood(foodId);
        addTransaction.setUserId(user.getUserId());
        addTransaction.setRestId(menu.getRestId());
        addTransaction.setFoodId(foodId);
        addTransaction.setFoodName(menu.getFoodName());
        addTransaction.setFoodPrice(menu.getFoodPrice());
        addTransaction.setFoodCount(Integer.parseInt(foodCount));
        addTransaction.setFoodImg(menu.getFoodImg());
        shoppingCartService.addTransaction(addTransaction);
        System.out.println("added");
        return "added to cart";
    }
}
