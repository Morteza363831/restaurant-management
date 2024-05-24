package com.restaurantManagement.models;

import com.restaurantManagement.dao.DatabaseConnection;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;

import java.sql.*;
import java.util.*;

@Slf4j
public class UserData {

    // make connection to sql
    public Connection connection = DatabaseConnection.getConnection();
    //private static int idValue= 10000;

    // list of all users
    public final List<User> userData = new ArrayList<>();

    // constructor --> get all users at first
    public UserData() {
        try {

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
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select userId from users");
        List<String> usersId = new ArrayList<>();
        while(resultSet.next()) {
            usersId.add(resultSet.getString("userId"));
        }
        int idValue = 10000;
        while(flag) {
            for (String userId : usersId) {
                System.out.println("here");
                idValue = 10000 + random.nextInt(90000);
                if (!(idValue+"").equals(userId)) {
                    // add user to sql
                    PreparedStatement preparedStatement = connection.prepareStatement("insert into users (userId,fname,lname,password,email,phone) values (?,?,?,?,?,?)");
                    preparedStatement.setString(1,idValue+"");
                    preparedStatement.setString(2,addUser.getFname());
                    preparedStatement.setString(3,addUser.getLname());
                    preparedStatement.setString(4,addUser.getPassword());
                    preparedStatement.setString(5,addUser.getEmail());
                    preparedStatement.setString(6,addUser.getPhone());
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
                statement.execute("delete from users where userId = ''"+ userId + "''");
                statement.close();
                itemListIterator.remove();
                break;
            }
        }
    }

    public User getUser(String phone,String password) {
        for (User user : userData) {
            if (user.getPhone().equals(phone) && user.getPassword().equals(password)) {
                return user;
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
                String fname = updataUser.getFname();
                String lname = updataUser.getLname();
                String password = updataUser.getPassword();
                String phone = updataUser.getPhone();
                PreparedStatement preparedStatement = connection.prepareStatement("update users set fname = ?, lname = ?, password = ? where phone = ?");
                preparedStatement.setString(1,fname);
                preparedStatement.setString(2,lname);
                preparedStatement.setString(3,password);
                preparedStatement.setString(4,phone);
                preparedStatement.executeUpdate();
                preparedStatement.close();
                itemListIterator.set(updataUser);
                break;
            }
        }
    }

}
