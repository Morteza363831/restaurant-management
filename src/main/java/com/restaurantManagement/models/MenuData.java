package com.restaurantManagement.models;

import com.restaurantManagement.dao.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.Random;

public class MenuData {

    public Connection connection = DatabaseConnection.getConnection();

    // list of all restaurants
    public final List<Menu> menuData = new ArrayList<>();

    public MenuData() {
        try {

            PreparedStatement preparedStatement = connection.prepareStatement("select * from menu");
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                String foodId = resultSet.getString("foodId");
                String restId = resultSet.getString("restId");
                String foodName = resultSet.getString("name");
                int foodPrice = Integer.parseInt(resultSet.getString("price"));
                menuData.add(new Menu(foodId,restId,foodName,foodPrice));
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addFood(Menu addFood,String restId) throws SQLException {
        // make unique id for each food
        Random random = new Random();
        boolean flag = true;
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select foodId from menu");
        List<String> foodsId = new ArrayList<>();
        while(resultSet.next()) {
            foodsId.add(resultSet.getString("restId"));
        }
        int idValue = 10000;
        while(flag) {
            for (String foodId : foodsId) {
                idValue = 1 + random.nextInt(90000);
                if (!(idValue+"").equals(foodId)) {
                    // add food to sql
                    PreparedStatement preparedStatement = connection.prepareStatement("insert into menue (foodId,restId,name,price) values (?,?,?,?)");
                    preparedStatement.setString(1,idValue+"");
                    preparedStatement.setString(2,restId);
                    preparedStatement.setString(3, addFood.getFoodName());
                    preparedStatement.setString(4,addFood.getFoodPrice()+"");
                    preparedStatement.executeUpdate();
                    preparedStatement.close();
                    flag = false;
                    break;
                }
            }

        }
        resultSet.close();
        statement.close();
        // creating has been finished here
        // add food to list
        addFood.setFoodId(idValue+"");
        addFood.setRestId(restId);
        menuData.add(addFood);
    }

    public void removeFood(String foodId) throws SQLException {
        ListIterator<Menu> itemListIterator = menuData.listIterator();
        while (itemListIterator.hasNext()) {
            Menu item = itemListIterator.next();
            if (item.getFoodId().equals(foodId)) {
                // delete food from menu table
                Statement statement = connection.createStatement();
                statement.execute("delete from menu where foodId = ''"+ foodId + "''");
                statement.close();
                itemListIterator.remove();
                break;
            }
        }
    }

    public Menu getFood(String foodId) {
        for (Menu food : menuData) {
            if (food.getFoodId().equals(foodId)) {
                return food;
            }
        }
        return null;
    }
}
