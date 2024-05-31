package com.restaurantManagement.models;

import com.restaurantManagement.dao.DatabaseConnection;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.Random;

public class TransactionData {



    // create connection to sql using dao
    public Connection connection = DatabaseConnection.getConnection();
    // list of all transactions
    public final List<Transaction> transactionData = new ArrayList<>();

    // methods
    public TransactionData() {
        try {
            // get transactions data and store it in transactionData
            PreparedStatement preparedStatement = connection.prepareStatement("select * from transactions");
            ResultSet resultSet = preparedStatement.executeQuery();
            // store it
            while(resultSet.next()) {
                String transactionId = resultSet.getString("transactionId");
                String userId = resultSet.getString("userId");
                String restId = resultSet.getString("restId");
                String foodName = resultSet.getString("address");
                int foodPrice = Integer.parseInt(resultSet.getString("price"));
                int foodCount = Integer.parseInt(resultSet.getString("count"));
                String date = resultSet.getString("date");
                transactionData.add(new Transaction(transactionId,userId,restId,foodName,foodPrice,foodCount,date));
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addTransaction(String userId, String restId, String address, int foodPrice, int foodCount) throws SQLException {

        List<String> transactionsId = new ArrayList<>();
        for (Transaction transaction : transactionData) {
            transactionsId.add(transaction.getTransactionId());
        }
        Random random = new Random();
        boolean flag = true;
        int idValue = 0;
        while(flag) {
            // inserting query using ps
            PreparedStatement preparedStatement = connection.prepareStatement("insert into transactions values (?,?,?,?,?,?,?)");
            // generate unique id for each transaction
            idValue = 1 + random.nextInt(90000);
            // add transaction to sql
            if (transactionData.isEmpty()) {
                preparedStatement.setString(1,idValue+"");
                preparedStatement.setString(2,userId);
                preparedStatement.setString(3,restId);
                preparedStatement.setString(4,address);
                preparedStatement.setInt(5,foodPrice);
                preparedStatement.setInt(6,foodCount);
                preparedStatement.setString(7,LocalDate.now()+"");
                preparedStatement.executeUpdate();
                preparedStatement.close();
                flag = false;
                break;
            }
            else {
                for (String transactionId : transactionsId) {
                    if (!(idValue+"").equals(transactionId)) {
                        preparedStatement.setString(1,idValue+"");
                        preparedStatement.setString(2,userId);
                        preparedStatement.setString(3,restId);
                        preparedStatement.setString(4,address);
                        preparedStatement.setInt(5,foodPrice);
                        preparedStatement.setInt(6,foodCount);
                        preparedStatement.setString(7,LocalDate.now()+"");
                        preparedStatement.executeUpdate();
                        preparedStatement.close();
                        flag = false;
                        break;
                    }
                }
            }


        }
    }

    public void removeTransaction(String transactionId) throws SQLException {
        ListIterator<Transaction> itemListIterator = transactionData.listIterator();
        while (itemListIterator.hasNext()) {
            Transaction item = itemListIterator.next();
            if (item.getTransactionId().equals(transactionId)) {
                // delete transaction from transactions table
                Statement statement = connection.createStatement();
                statement.execute("delete from transactions where transactionId = '"+ transactionId + "'");
                statement.close();
                itemListIterator.remove();
                break;
            }
        }
    }

    public List<Transaction> getTransactions(String userId,String restId) throws SQLException {
        // get a transaction from transactions table
        List<Transaction> items = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from transactions where userId = ? and restId = ?");
        preparedStatement.setString(1,userId);
        preparedStatement.setString(2,restId);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()) {
            String transactionId = resultSet.getString("transactionId");
            String foodId = resultSet.getString("foodId");
            String address = resultSet.getString("address");
            int foodPrice = Integer.parseInt(resultSet.getString("price"));
            int foodCount = Integer.parseInt(resultSet.getString("count"));
            String date = resultSet.getString("date");
            items.add(new Transaction(transactionId,userId,restId,address,foodPrice,foodCount,date));
        }
        // if transaction couldnt found
        if(items.isEmpty()) {
            return  null;
        }
        return items;
    }
}
