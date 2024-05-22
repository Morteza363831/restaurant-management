package com.restaurantManagement.controllers;

import com.restaurantManagement.models.UserData;
import com.restaurantManagement.services.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Slf4j
@Controller
public class UserController {

    private final UserService userService;

    // di --> constructor injection to create bean fo user service class
    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @ModelAttribute("userData")
    public UserData userData() {
        return userService.getData();
    }

    // http://locahost:8080/restaurant-management/users
    @GetMapping("users")
    public String users() {
        log.info("in users mapping");
        return "users";
    }


}
