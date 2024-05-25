package com.restaurantManagement.controllers;

import com.restaurantManagement.models.Menu;
import com.restaurantManagement.models.Restaurant;
import com.restaurantManagement.models.User;
import com.restaurantManagement.services.MenuService;
import com.restaurantManagement.services.RestaurantService;
import com.restaurantManagement.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

@Controller
public class MenuConroller {
    private final MenuService menuService;

    @Autowired
    public MenuConroller(MenuService menuService) {
        this.menuService = menuService;
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
}
