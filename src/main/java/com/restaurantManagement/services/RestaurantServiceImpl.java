package com.restaurantManagement.services;

import com.restaurantManagement.models.Restaurant;
import com.restaurantManagement.models.RestaurantData;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Service
public class RestaurantServiceImpl implements RestaurantService{

    private final RestaurantData restaurantData = new RestaurantData();
    @Override
    public void addRestaurant(Restaurant restaurant) throws SQLException {
        restaurantData.addRestaurant(restaurant);
    }

    @Override
    public void remvoeRestaurant(String restId) throws SQLException {
        restaurantData.removeRestaurant(restId);
    }

    @Override
    public Restaurant getRestaurant(String restId) {
        return restaurantData.getRestaurant(restId);
    }

    @Override
    public RestaurantData getData() {
        return restaurantData;
    }
}
