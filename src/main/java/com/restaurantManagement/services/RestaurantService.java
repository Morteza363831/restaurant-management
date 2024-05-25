package com.restaurantManagement.services;

import com.restaurantManagement.models.Restaurant;
import com.restaurantManagement.models.RestaurantData;
import com.restaurantManagement.models.User;
import com.restaurantManagement.models.UserData;
import lombok.NonNull;

import java.sql.SQLException;

public interface RestaurantService {

    public void addRestaurant(Restaurant restaurant) throws SQLException;

    public void remvoeRestaurant(String restId) throws SQLException;

    public Restaurant getRestaurant(String restId);

    public RestaurantData getData();
}
