package com.restaurantManagement.controllers;

import com.restaurantManagement.models.Restaurant;
import com.restaurantManagement.models.User;
import com.restaurantManagement.services.RestaurantService;
import com.restaurantManagement.services.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

@Slf4j
@Controller
public class RestaurantController {

    private final RestaurantService restaurantService;
    private final UserService userService;

    @Autowired
    public RestaurantController(RestaurantService restaurantService, UserService userService) {
        this.restaurantService = restaurantService;
        this.userService = userService;
    }

    @ModelAttribute("restaurants")
    public List<Restaurant> restaurantList() {
        return restaurantService.getData().restaurantData;
    }


    @GetMapping("restaurant-list")
    public String restaurant_list(Model model, HttpSession session) {

        User user = (User) session.getAttribute("signedInUser");
        model.addAttribute("user",user);

        return "restaurants";
    }

    @PostMapping("getRestaurant")
    public String getRestaurant(@ModelAttribute("restaurant") Restaurant getRestaurant) {
        Restaurant restaurant = restaurantService.getRestaurant(getRestaurant.getRestName());
        return "redirect:/menu";
    }

    @GetMapping("profile")
    public String profile(Model model, HttpSession session) {
        User user = (User) session.getAttribute("signedInUser");
        model.addAttribute("user",user);
        return "profile";
    }

    @GetMapping("update-profile")
    public String updateProfile(Model model, HttpSession session) {
        User user = (User) session.getAttribute("signedInUser");

        model.addAttribute("user",user);
        return "updateProfile";
    }

    @ModelAttribute("updatedUser")
    public User information() {
        return new User("","","","","");
    }


    @PostMapping("getUpdates")
    public String getUpdates(@ModelAttribute("updatedUser") User updatedUser,HttpSession session) throws SQLException {
        User user = (User) session.getAttribute("signedInUser");
        user.setFname(updatedUser.getFname());
        user.setLname(updatedUser.getLname());
        if (!updatedUser.getPassword().equals("") && updatedUser.getPassword() != null) {
            user.setPassword(user.getPassword());
        }
        userService.updateUser(user);
        session.removeAttribute("signedInUser");
        session.setAttribute("signedInUser",user);
        return "redirect:/profile";
    }
}
