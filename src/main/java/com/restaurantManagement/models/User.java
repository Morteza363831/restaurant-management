package com.restaurantManagement.models;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NonNull;

@Data
@EqualsAndHashCode(of = "userId")
public class User {

    // constants
    @NonNull
    private String userId;
    @NonNull
    private String fname;
    @NonNull
    private String lname;
    @NonNull
    private String password;
    @NonNull
    private String email;
    @NonNull
    private String phone;

    // constructors
    public User(String userId, String fname, String lname, String password, String email, String phone) {
        this.userId = userId;
        this.fname = fname;
        this.lname = lname;
        this.password = password;
        this.email = email;
        this.phone = phone;
    }
}
