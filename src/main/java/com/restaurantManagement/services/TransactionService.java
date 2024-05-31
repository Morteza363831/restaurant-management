package com.restaurantManagement.services;

import com.restaurantManagement.models.ShoppingCart;
import com.restaurantManagement.models.Transaction;
import com.restaurantManagement.models.TransactionData;

import java.sql.SQLException;
import java.util.List;

public interface TransactionService {

    public void addTransaction(String userId, String restId, String address, int foodPrice, int foodCount) throws SQLException;

    public void removeTransaction(String transactionId) throws SQLException;

    public List<Transaction> getTransactions(String userId, String restId) throws SQLException;
}
