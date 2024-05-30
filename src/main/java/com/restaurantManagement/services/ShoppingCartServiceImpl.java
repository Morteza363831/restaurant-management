package com.restaurantManagement.services;

import com.restaurantManagement.models.Menu;
import com.restaurantManagement.models.ShoppingCart;
import com.restaurantManagement.models.ShoppingCartData;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService{

    private ShoppingCartData shoppingCartData = new ShoppingCartData();
    @Override
    public void addTransaction(ShoppingCart shoppingCart) throws SQLException {
        shoppingCartData.addTransaction(shoppingCart);
    }

    @Override
    public void removeTransaction(String transactionId) throws SQLException {
        shoppingCartData.removeTransaction(transactionId);
    }

    @Override
    public List<ShoppingCart> getTransactions(String userId, String restId) throws SQLException {
        return shoppingCartData.getTransactions(userId,restId);
    }

    @Override
    public void updateShoppingCart(String transactionId, int foodCount) throws SQLException {
         shoppingCartData.updateShoppingCart(transactionId,foodCount);
    }
}
