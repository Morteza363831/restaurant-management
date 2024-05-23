package com.restaurantManagement.controllers;

import com.restaurantManagement.models.Restaurant;
import com.restaurantManagement.services.RestaurantService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Slf4j
@Controller
public class RestaurantController {

    private final RestaurantService restaurantService;

    @Autowired
    public RestaurantController(RestaurantService restaurantService) {
        this.restaurantService = restaurantService;
    }

    @ModelAttribute("restaurants")
    public List<Restaurant> restaurantList() {
        return restaurantService.getData().restaurantData;
    }

    @GetMapping("restaurant-list")
    public String restaurant_list() {
        return "restaurants";
    }

    @PostMapping("getRestaurant")
    public String getRestaurant(@ModelAttribute("restaurant") Restaurant getRestaurant) {
        Restaurant restaurant = restaurantService.getRestaurant(getRestaurant.getRestName());
        return "redirect:/menu";
    }
}
