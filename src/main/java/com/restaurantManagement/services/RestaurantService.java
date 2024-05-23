package com.restaurantManagement.services;

import com.restaurantManagement.models.Restaurant;
import com.restaurantManagement.models.RestaurantData;
import com.restaurantManagement.models.User;
import com.restaurantManagement.models.UserData;

import java.sql.SQLException;

public interface RestaurantService {

    public void addRestaurant(Restaurant restaurant) throws SQLException;

    public void remvoeRestaurant(String restName) throws SQLException;

    public Restaurant getRestaurant(String restName);

    public RestaurantData getData();
}
