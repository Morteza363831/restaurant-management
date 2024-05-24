package com.restaurantManagement.services;

import com.restaurantManagement.models.User;
import com.restaurantManagement.models.UserData;
import lombok.NonNull;

import java.sql.SQLException;

public interface UserService {

    public void addUser(@NonNull User user) throws SQLException;

    public void remvoeUser(@NonNull String userId) throws SQLException;

    public User getUser(String phone,String password);

    public void updateUser(@NonNull User user) throws SQLException;

    public UserData getData();
}
