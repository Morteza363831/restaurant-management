package com.restaurantManagement.models;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NonNull;

@Data
@EqualsAndHashCode(of = "foodId")
public class Menu {


    @NonNull
    private String foodId;
    @NonNull
    private String restId;
    @NonNull
    private String foodName;
    @NonNull
    private int foodPrice;
    @NonNull
    private String foodImg;

    public Menu(String foodId, String restId, String foodName,int foodPrice, String foodImg) {
        this.foodId = foodId;
        this.restId = restId;
        this.foodName = foodName;
        this.foodPrice = foodPrice;
        this.foodImg = foodImg;
    }
}
