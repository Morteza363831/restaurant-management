package com.restaurantManagement.models;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NonNull;

@Data
@EqualsAndHashCode(of = "restId")
public class Restaurant {

    @NonNull
    private String restId;
    @NonNull
    private String restName;
    @NonNull
    private String restAddress;
    @NonNull
    private String restDescription;
    @NonNull
    private String restImg;

    // constructors
    public Restaurant(String restId, String restName, String restAddress,String restDescription, String restImg) {
        this.restId = restId;
        this.restName = restName;
        this.restAddress = restAddress;
        this.restDescription = restDescription;
        this.restImg = restImg;
    }

}
