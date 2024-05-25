package com.restaurantManagement.services;

import com.restaurantManagement.models.Menu;
import com.restaurantManagement.models.MenuData;
import com.restaurantManagement.models.Restaurant;
import com.restaurantManagement.models.RestaurantData;
import lombok.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.sql.SQLException;
import java.util.List;

@Service
public class MenuServiceImpl implements MenuService{

    @NonNull
    MenuData menuData = new MenuData();
    @Override
    public void addFood(Menu menu,String restId) throws SQLException {
        menuData.addFood(menu,restId);
    }

    @Override
    public void remvoeFood(@NonNull String foodId) throws SQLException {
        menuData.removeFood(foodId);
    }

    @Override
    public Menu getFood(@NonNull String foodId) {
        return menuData.getFood(foodId);
    }

    @Override
    public MenuData getData() {
        return menuData;
    }

    @Override
    public List<Menu> getFoods(String restId) throws SQLException {
        return menuData.getFoods(restId);
    }
}
