package com.restaurantManagement.services;

import com.restaurantManagement.models.Menu;
import com.restaurantManagement.models.MenuData;
import com.restaurantManagement.models.Restaurant;
import com.restaurantManagement.models.RestaurantData;
import lombok.NonNull;

import java.sql.SQLException;
import java.util.List;

public interface MenuService {

    public void addFood(Menu menu,String restId) throws SQLException;

    public void remvoeFood(String foodId) throws SQLException;

    public Menu getFood(String foodId);

    public MenuData getData();

    public List<Menu> getFoods(String restId) throws SQLException;
}
