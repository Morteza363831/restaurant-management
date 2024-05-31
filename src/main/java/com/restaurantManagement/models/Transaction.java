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
    private String address;
    @NonNull
    private int foodPrice;
    @NonNull
    private int foodCount;
    @NonNull
    private String date;

    public Transaction(String transactionId, String userId, String restId, String address, int foodPrice, int foodCount, String date) {
        this.transactionId = transactionId;
        this.userId = userId;
        this.restId = restId;
        this.address = address;
        this.foodPrice = foodPrice;
        this.foodCount = foodCount;
        this.date = date;
    }
}
