package com.restaurantManagement.services;

import com.restaurantManagement.models.Menu;
import com.restaurantManagement.models.MenuData;
import com.restaurantManagement.models.Restaurant;
import com.restaurantManagement.models.RestaurantData;
import lombok.NonNull;

import java.sql.SQLException;

public interface MenuService {

    public void addFood(Menu menu,String restId) throws SQLException;

    public void remvoeFood(@NonNull String foodId) throws SQLException;

    public Menu getFood(@NonNull String foodId);

    public MenuData getData();
}
