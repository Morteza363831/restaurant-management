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
            // store data from user table to userData list
            PreparedStatement preparedStatement = connection.prepareStatement("select * from users");
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                String userId = resultSet.getString("userId");
                String fname = resultSet.getString("fname");
                String lname = resultSet.getString("lname");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                String accessLevel = resultSet.getString("access_level");
                userData.add(new User(userId,fname,lname,password,email,phone,accessLevel));
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addUser(@NonNull User addUser) throws SQLException {
        // make unique id for each user
        Random random = new Random();
        boolean flag = true;
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select userId from users");
        List<String> usersId = new ArrayList<>();
        while(resultSet.next()) {
            usersId.add(resultSet.getString("userId"));
        }
        int idValue = 0;
        while(flag) {
            // inserting query using ps
            PreparedStatement preparedStatement = connection.prepareStatement("insert into users (userId,fname,lname,password,email,phone,access_level) values (?,?,?,?,?,?,?)");
            // generate unique id for each user
            idValue = 10000 + random.nextInt(90000);
            // add user to sql
            if (usersId.isEmpty()) {
                preparedStatement.setString(1,idValue+"");
                preparedStatement.setString(2,addUser.getFname());
                preparedStatement.setString(3,addUser.getLname());
                preparedStatement.setString(4,addUser.getPassword());
                preparedStatement.setString(5,addUser.getEmail());
                preparedStatement.setString(6,addUser.getPhone());
                preparedStatement.setString(7,"user");
                preparedStatement.executeUpdate();
                preparedStatement.close();
                flag = false;
                break;
            }
            for (String userId : usersId) {
                if (!(idValue+"").equals(userId)) {

                    preparedStatement.setString(1,idValue+"");
                    preparedStatement.setString(2,addUser.getFname());
                    preparedStatement.setString(3,addUser.getLname());
                    preparedStatement.setString(4,addUser.getPassword());
                    preparedStatement.setString(5,addUser.getEmail());
                    preparedStatement.setString(6,addUser.getPhone());
                    preparedStatement.setString(7,"user");
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
            if (item.getUserId().equals(userId)) {
                // delete user in users table
                PreparedStatement preparedStatement = connection.prepareStatement("delete from users where userId = ?");
                preparedStatement.setString(1,userId);
                preparedStatement.executeUpdate();
                preparedStatement.close();
                itemListIterator.remove();
                break;
            }
        }
    }

    public User getUser(String phone,String password) {
        // get special user from users Tables using phone number and pass
        for (User user : userData) {
            if (user.getPhone().equals(phone) && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }

    public void updateUser(@NonNull User updataUser) throws SQLException {
        // update info of a user
        ListIterator<User> itemListIterator = userData.listIterator();
        while(itemListIterator.hasNext()) {
            User item = itemListIterator.next();

            if (item.equals(updataUser)) {
                // user can update his password,first name,last name --> cant change email,phone
                String fname = updataUser.getFname();
                String lname = updataUser.getLname();
                String password = updataUser.getPassword();
                String userId = updataUser.getUserId();
                PreparedStatement preparedStatement = connection.prepareStatement("update users set fname = ?, lname = ?, password = ? where userId = ?");
                preparedStatement.setString(1,fname);
                preparedStatement.setString(2,lname);
                preparedStatement.setString(3,password);
                preparedStatement.setString(4,userId);
                preparedStatement.executeUpdate();
                preparedStatement.close();
                itemListIterator.set(updataUser);
                break;
            }
        }
    }

}
