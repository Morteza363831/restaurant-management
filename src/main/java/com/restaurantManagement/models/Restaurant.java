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

    // constructors
    public Restaurant(String restName, String restAddress) {
        this.restName = restName;
        this.restAddress = restAddress;
    }

}
