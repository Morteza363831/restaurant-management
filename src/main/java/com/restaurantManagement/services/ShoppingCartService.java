package com.restaurantManagement.services;

import com.restaurantManagement.models.Menu;
import com.restaurantManagement.models.ShoppingCart;

import java.sql.SQLException;
import java.util.List;

public interface ShoppingCartService {

    public void addTransaction(ShoppingCart shoppingCart) throws SQLException;

    public void removeTransaction(String transactionId) throws SQLException;

    public List<ShoppingCart> getTransactions(String userId, String restId) throws SQLException;

    public void updateShoppingCart(String transactionId, int foodCount) throws SQLException;
}
