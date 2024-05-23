package com.restaurantManagement.models;

import com.restaurantManagement.dao.DatabaseConnection;

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
                String restName = resultSet.getString("restName");
                String restAddress = resultSet.getString("restAddress");
                restaurantData.add(new Restaurant(restName,restAddress));
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
                System.out.println("here");
                idValue = 10000 + random.nextInt(90000);
                if (!(idValue+"").equals(restId)) {
                    // add restaurant to sql
                    PreparedStatement preparedStatement = connection.prepareStatement("insert into restaurants (restId,restName,restAddress) values (?,?,?)");
                    preparedStatement.setString(1,idValue+"");
                    preparedStatement.setString(2,addRestaurant.getRestName());
                    preparedStatement.setString(3,addRestaurant.getRestAddress());
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

    public void removeRestaurant(String restName) throws SQLException {
        ListIterator<Restaurant> itemListIterator = restaurantData.listIterator();
        while (itemListIterator.hasNext()) {
            Restaurant item = itemListIterator.next();
            if (item.getRestName() == restName) {
                // delete user in users table
                Statement statement = connection.createStatement();
                statement.execute("delete from restaurants where restName = ''"+ restName + "''");
                statement.close();
                itemListIterator.remove();
                break;
            }
        }
    }

    public Restaurant getRestaurant(String restName) {
        for (Restaurant restaurant : restaurantData) {
            if (restaurant.getRestName().equals(restName)) {
                return restaurant;
            }
        }
        return null;
    }
}
