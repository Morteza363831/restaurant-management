package com.restaurantManagement.services;

import com.restaurantManagement.models.Transaction;
import com.restaurantManagement.models.TransactionData;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class TransactionServiceImpl implements TransactionService{

    private TransactionData transactionData = new TransactionData();
    @Override
    public void addTransaction(String userId, String restId, String address, int foodPrice, int foodCount) throws SQLException {
        transactionData.addTransaction(userId,restId,address,foodPrice,foodCount);
    }

    @Override
    public void removeTransaction(String transactionId) throws SQLException {
        transactionData.removeTransaction(transactionId);
    }

    @Override
    public List<Transaction> getTransactions(String userId, String restId) throws SQLException {
        return transactionData.getTransactions(userId,restId);
    }
}
