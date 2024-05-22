package com.restaurantManagement.models;

import com.restaurantManagement.dao.DatabaseConnection;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.Random;

@Slf4j
public class UserData {

    // make connection to sql
    Connection connection;
    //private static int idValue= 10000;

    // list of all users
    public final List<User> userData = new ArrayList<>();


    // constructor --> get all users at first
    public UserData() {
        try {
            connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select * from users");
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                String fname = resultSet.getString("fname");
                String lname = resultSet.getString("lname");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                userData.add(new User(fname,lname,password,email,phone));
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void addUser(User addUser) throws SQLException {
        // make unique id for each user
        Random random = new Random();
        boolean flag = true;
        PreparedStatement preparedStatement = connection.prepareStatement("select userId from users");
        ResultSet resultSet = preparedStatement.executeQuery();
        int idValue = 10000;
        while(flag) {
            idValue = 10000 + random.nextInt(90000);
            if ((idValue+"") != resultSet.getString("userId")) {
                flag = false;
            }
        }
        resultSet.close();
        preparedStatement.close();
        // creating has been finished here
        // add user to list
        addUser.setUserId(idValue+"");
        userData.add(addUser);
    }

    public void removeUser(String userId) throws SQLException {
        ListIterator<User> itemListIterator = userData.listIterator();
        while (itemListIterator.hasNext()) {
            User item = itemListIterator.next();
            if (item.getUserId() == userId) {
                // delete user in users table
                Statement statement = connection.createStatement();
                statement.execute("delete from userId where userId = ''"+ userId + "''");
                statement.close();
                itemListIterator.remove();
                break;
            }
        }
    }

    public User getUser(String userId) {
        for (User item : userData) {
            if (item.getUserId() == userId) {
                return item;
            }
        }
        return null;
    }

    public void updateUser(@NonNull User updataUser) throws SQLException {
        ListIterator<User> itemListIterator = userData.listIterator();

        while(itemListIterator.hasNext()) {
            User item = itemListIterator.next();

            if (item.equals(updataUser)) {
                // user can update his password
                String password = updataUser.getPassword();
                Statement statement = connection.createStatement();
                statement.execute("update users set password = '" + password + "'");
                statement.close();
                itemListIterator.set(updataUser);
                break;
            }
        }
    }

}
