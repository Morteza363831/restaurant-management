package com.restaurantManagement.models;

import com.restaurantManagement.dao.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.Random;

public class MenuData {

    // jdbc connection
    public Connection connection = DatabaseConnection.getConnection();

    // list of all foods in menu --> menu of all restaurants are here
    // it is better to remove menuData because of laking of memory
    public final List<Menu> menuData = new ArrayList<>();

    public MenuData() {
        try {
            // store all menu in menuData
            PreparedStatement preparedStatement = connection.prepareStatement("select * from menu");
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                String foodId = resultSet.getString("foodId");
                String restId = resultSet.getString("restId");
                String foodName = resultSet.getString("name");
                int foodPrice = Integer.parseInt(resultSet.getString("price"));
                String foodImg = resultSet.getString("foodImg");
                menuData.add(new Menu(foodId,restId,foodName,foodPrice,foodImg));
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
            foodsId.add(resultSet.getString("foodId"));
        }
        int idValue = 0;
        while(flag) {
            PreparedStatement preparedStatement = connection.prepareStatement("insert into menue (foodId,restId,name,price) values (?,?,?,?)");
            idValue = 1 + random.nextInt(90000);
            if (foodsId.isEmpty()) {
                preparedStatement.setString(1,idValue+"");
                preparedStatement.setString(2,restId);
                preparedStatement.setString(3, addFood.getFoodName());
                preparedStatement.setString(4,addFood.getFoodPrice()+"");
                preparedStatement.executeUpdate();
                preparedStatement.close();
                flag = false;
                break;
            }
            else {
                for (String foodId : foodsId) {
                    // generate id for each food between 1 and 90000
                    if (!(idValue+"").equals(foodId)) {
                        // add food to menu table
                        preparedStatement.setString(1,idValue+"");
                        preparedStatement.setString(2,restId);
                        preparedStatement.setString(3, addFood.getFoodName());
                        preparedStatement.setString(4,addFood.getFoodPrice()+"");
                        preparedStatement.executeUpdate();
                        preparedStatement.close();
                         flag = false;
                        break;
                    }
                } // for loop
            } // else
        } // while loop
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
                statement.execute("delete from menu where foodId = '"+ foodId + "'");
                statement.close();
                itemListIterator.remove();
                break;
            }
        }
    }


    public Menu getFood(String foodId) {
        // get special food !
        for (Menu food : menuData) {
            if (food.getFoodId().equals(foodId)) {
                return food;
            }
        }
        return null;
    }

    public List<Menu> getFoods(String restId) throws SQLException {
        // get special menu of a restaurant from menu table --> restId is the key
        List<Menu> items = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from menu where restId = ?");
        preparedStatement.setString(1,restId);
        ResultSet resultSet = preparedStatement.executeQuery();

        while(resultSet.next()) {
            String foodId = resultSet.getString("foodId");
            String foodName = resultSet.getString("name");
            int foodPrice = Integer.parseInt(resultSet.getString("price"));
            String foodImg = resultSet.getString("foodImg");
            items.add(new Menu(foodId,restId,foodName,foodPrice,foodImg));
        }

        // no foods or menu found ...
        if(items.isEmpty()) {
            return  null;
        }
        return items;
    }
}
