package com.restaurantManagement.services;

import com.restaurantManagement.models.User;
import com.restaurantManagement.models.UserData;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Service
public class UserServiceImpl implements UserService{

    private final UserData userData = new UserData();
    @Override
    public void addUser(User user) throws SQLException {
        userData.addUser(user);
    }

    @Override
    public void remvoeUser(String userId) throws SQLException {
        userData.removeUser(userId);
    }

    @Override
    public User getUser(String phone,String password) {
        return userData.getUser(phone,password);
    }

    @Override
    public void updateUser(User user) throws SQLException {
        userData.updateUser(user);
    }

    @Override
    public UserData getData() {
        return userData;
    }
}
