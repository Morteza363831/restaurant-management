package com.restaurantManagement.models;

import com.restaurantManagement.dao.DatabaseConnection;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.Random;

public class ShoppingCartData {


    // create connection to sql using dao
    public Connection connection = DatabaseConnection.getConnection();
    // list of all shopping cart
    public final List<ShoppingCart> shoppingCartData = new ArrayList<>();

    // methods
    public ShoppingCartData() {
        try {
            // get shopping cart data and store it in shoppingCartData
            PreparedStatement preparedStatement = connection.prepareStatement("select * from shoppingCart");
            ResultSet resultSet = preparedStatement.executeQuery();
            // store it
            while(resultSet.next()) {
                String transactionId = resultSet.getString("transactionId");
                String userId = resultSet.getString("userId");
                String restId = resultSet.getString("restId");
                String foodId = resultSet.getString("foodId");
                String foodName = resultSet.getString("name");
                int foodPrice = Integer.parseInt(resultSet.getString("price"));
                int foodCount = Integer.parseInt(resultSet.getString("count"));
                String date = resultSet.getString("date");
                String foodImg = resultSet.getString("foodImg");
                shoppingCartData.add(new ShoppingCart(transactionId,userId,restId,foodId,foodName,foodPrice,foodCount,date,foodImg));
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addTransaction(ShoppingCart addTransaction) throws SQLException {
        // make unique id for each transaction
        Random random = new Random();
        boolean flag = true;
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select transactionId from shoppingCart");
        List<String> transactionsId = new ArrayList<>();
        // get all transactionsId from shopping cart table
        while(resultSet.next()) {
            transactionsId.add(resultSet.getString("transactionId"));
        }
        int idValue = 0;
        while(flag) {
            // inserting query
            PreparedStatement preparedStatement = connection.prepareStatement("insert into shoppingCart " +
                    "(transactionId,userId,restId,foodId,name,price,count,date,foodImg) values (?,?,?,?,?,?,?,?,?)");
            // generate random id between 1 and 90000
            idValue = 1 + random.nextInt(90000);
            if (transactionsId.isEmpty()) {
                preparedStatement.setString(1,idValue+"");
                preparedStatement.setString(2, addTransaction.getUserId());
                preparedStatement.setString(3,addTransaction.getRestId());
                preparedStatement.setString(4,addTransaction.getFoodId());
                preparedStatement.setString(5, addTransaction.getFoodName());
                preparedStatement.setString(6,(addTransaction.getFoodPrice()*addTransaction.getFoodCount())+"");
                preparedStatement.setString(7,addTransaction.getFoodCount()+"");
                preparedStatement.setString(8, LocalDate.now()+"");
                preparedStatement.setString(9,addTransaction.getFoodImg());
                preparedStatement.executeUpdate();
                preparedStatement.close();
                flag = false;
                break;
            }
            else {
                for (String transactionId : transactionsId) {

                    if (!(idValue+"").equals(transactionId)) {
                        // add food to sql
                        preparedStatement.setString(1,idValue+"");
                        preparedStatement.setString(2, addTransaction.getUserId());
                        preparedStatement.setString(3,addTransaction.getRestId());
                        preparedStatement.setString(4,addTransaction.getFoodId());
                        preparedStatement.setString(5, addTransaction.getFoodName());
                        preparedStatement.setString(6,(addTransaction.getFoodPrice()*addTransaction.getFoodCount())+"");
                        preparedStatement.setString(7,addTransaction.getFoodCount()+"");
                        preparedStatement.setString(8, LocalDate.now()+"");
                        preparedStatement.setString(9,addTransaction.getFoodImg());
                        preparedStatement.executeUpdate();
                        preparedStatement.close();
                        flag = false;
                        break;
                    }
                }
            }
        }
        // close execute query objects
        resultSet.close();
        statement.close();

        // creating has been finished here
        // add transaction to list
        addTransaction.setTransactionId(idValue+"");
        shoppingCartData.add(addTransaction);
    }

    public void removeTransaction(String transactionId) throws SQLException {
        ListIterator<ShoppingCart> itemListIterator = shoppingCartData.listIterator();
        while (itemListIterator.hasNext()) {
            ShoppingCart item = itemListIterator.next();
            if (item.getTransactionId().equals(transactionId)) {
                // delete transaction from shoppingCart table
                Statement statement = connection.createStatement();
                statement.execute("delete from shoppingCart where transactionId = ''"+ transactionId + "''");
                statement.close();
                itemListIterator.remove();
                break;
            }
        }
    }

    public List<ShoppingCart> getTransactions(String userId) throws SQLException {
        // get a transaction from shoppingCart table
        List<ShoppingCart> items = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from shoppintCart where userId = ?");
        preparedStatement.setString(1,userId);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()) {
            String transactionId = resultSet.getString("transactionId");
            String restId = resultSet.getString("restId");
            String foodId = resultSet.getString("foodId");
            String foodName = resultSet.getString("name");
            int foodPrice = Integer.parseInt(resultSet.getString("price"));
            int foodCount = Integer.parseInt(resultSet.getString("count"));
            String date = resultSet.getString("date");
            String foodImg = resultSet.getString("foodImg");
            items.add(new ShoppingCart(transactionId,userId,restId,foodId,foodName,foodPrice,foodCount,date,foodImg));
        }
        // if transaction couldnt found
        if(items.isEmpty()) {
            return  null;
        }
        return items;
    }
}
