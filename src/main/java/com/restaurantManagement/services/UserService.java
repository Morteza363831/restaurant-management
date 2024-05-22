package com.restaurantManagement.services;

import com.restaurantManagement.models.User;

import java.sql.SQLException;

public interface UserService {

    public void addItem(User user) throws SQLException;

    public void remvoeUser(String userId) throws SQLException;

    public User getUser(String userId);

    public void updateUser(User user) throws SQLException;


}
