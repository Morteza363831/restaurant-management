package com.restaurantManagement.services;

import com.restaurantManagement.models.User;
import com.restaurantManagement.models.UserData;
import lombok.NonNull;

import java.sql.SQLException;

public interface UserService {

    public void addUser(User user) throws SQLException;

    public void remvoeUser(String userId) throws SQLException;

    public User getUser(String phone,String password);

    public void updateUser(User user) throws SQLException;

    public UserData getData();
}
