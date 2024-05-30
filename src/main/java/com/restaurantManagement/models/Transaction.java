package com.restaurantManagement.models;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NonNull;

@Data
@EqualsAndHashCode(of = "transactionId")
public class Transaction {

    @NonNull
    private String transactionId;
    @NonNull
    private String userId;
    @NonNull
    private String restId;
    @NonNull
    private String foodId;
    @NonNull
    private String foodName;
    @NonNull
    private int foodPrice;
    @NonNull
    private int foodCount;
    @NonNull
    private String date;

    public Transaction(String transactionId, String userId, String restId, String foodId, String foodName, int foodPrice, int foodCount, String date) {
        this.transactionId = transactionId;
        this.userId = userId;
        this.restId = restId;
        this.foodId = foodId;
        this.foodName = foodName;
        this.foodPrice = foodPrice;
        this.foodCount = foodCount;
        this.date = date;
    }
}
