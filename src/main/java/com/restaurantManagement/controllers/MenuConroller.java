package com.restaurantManagement.controllers;

import com.restaurantManagement.models.*;
import com.restaurantManagement.services.MenuService;
import com.restaurantManagement.services.RestaurantService;
import com.restaurantManagement.services.ShoppingCartService;
import com.restaurantManagement.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

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
    public void addToCart(@ModelAttribute("transaction") ShoppingCart addTransaction, HttpSession session) throws SQLException {
        User user = (User) session.getAttribute("signedInUser");
        Menu menu = menuService.getFood(addTransaction.getFoodId());
        addTransaction.setUserId(user.getUserId());
        addTransaction.setRestId(menu.getRestId());
        addTransaction.setFoodPrice(menu.getFoodPrice());
        addTransaction.setFoodImg(menu.getFoodImg());
        shoppingCartService.addTransaction(addTransaction);
    }
}
