package com.restaurantManagement.models;

import com.restaurantManagement.dao.DatabaseConnection;
import lombok.NonNull;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.Random;

public class RestaurantData {

    // make connection to sql
    public Connection connection = DatabaseConnection.getConnection();

    // list of all restaurants
    public final List<Restaurant> restaurantData = new ArrayList<>();

    public RestaurantData() {
        try {

            PreparedStatement preparedStatement = connection.prepareStatement("select * from restaurants");
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                String restId = resultSet.getString("restId");
                String restName = resultSet.getString("restName");
                String restAddress = resultSet.getString("restAddress");
                String restDescription = resultSet.getString("restDescription");
                String restImg = resultSet.getString("restImg");
                restaurantData.add(new Restaurant(restId,restName,restAddress,restDescription,restImg));
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addRestaurant(Restaurant addRestaurant) throws SQLException {
        // make unique id for each user
        Random random = new Random();
        boolean flag = true;
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select restId from restaurants");
        List<String> restsId = new ArrayList<>();
        while(resultSet.next()) {
            restsId.add(resultSet.getString("restId"));
        }
        int idValue = 10000;
        while(flag) {
            for (String restId : restsId) {
                idValue = 10000 + random.nextInt(90000);
                if (!(idValue+"").equals(restId)) {
                    // add restaurant to sql
                    PreparedStatement preparedStatement = connection.prepareStatement("insert into restaurants (restId,restName,restAddress,restDescription,restImg) values (?,?,?,?,?)");
                    preparedStatement.setString(1,idValue+"");
                    preparedStatement.setString(2,addRestaurant.getRestName());
                    preparedStatement.setString(3,addRestaurant.getRestAddress());
                    preparedStatement.setString(4,addRestaurant.getRestDescription());
                    preparedStatement.setString(5,addRestaurant.getRestImg());
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
        // add user to list
        addRestaurant.setRestId(idValue+"");
        restaurantData.add(addRestaurant);
    }

    public void removeRestaurant(String restId) throws SQLException {
        ListIterator<Restaurant> itemListIterator = restaurantData.listIterator();
        while (itemListIterator.hasNext()) {
            Restaurant item = itemListIterator.next();
            if (item.getRestId().equals(restId)) {
                // delete user in users table
                Statement statement = connection.createStatement();
                statement.execute("delete from restaurants where restId = ''"+ restId + "''");
                statement.close();
                itemListIterator.remove();
                break;
            }
        }
    }

    public Restaurant getRestaurant(String restId) {
        for (Restaurant restaurant : restaurantData) {
            if (restId.equals(restaurant.getRestId())) {
                return restaurant;
            }
        }
        return null;
    }
}
