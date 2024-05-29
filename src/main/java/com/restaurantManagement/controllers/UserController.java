package com.restaurantManagement.controllers;

import com.restaurantManagement.models.User;
import com.restaurantManagement.models.UserData;
import com.restaurantManagement.services.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

@Slf4j
@Controller
public class UserController {

    private UserService userService;

    // di --> constructor injection to create bean fo user service class
    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @ModelAttribute("users")
    public List<User> userData() {

        return userService.getData().userData;
    }

    // http://locahost:8080/restaurant-management/users
    @GetMapping("users")
    public String users() {
        log.info("in users mapping");
        return "users";
    }


    // adding user to sql --> (sign up page)
    @ModelAttribute("user")
    public User user() {
        return new User("","","","","","","");
    }
    @GetMapping("signUp")
    public String signUp() {
        return "signUp";
    }
    @PostMapping("addUser")
    public String addUser(@ModelAttribute("user") User addUser) throws SQLException {
        userService.addUser(addUser);

        return "redirect:/signIn";
    }


    // getting user from sql --> (sign in page)
    @GetMapping("signIn")
    public  String signIn() {
        return "signIn";
    }

    @PostMapping("getUser")
    public String getUser(@ModelAttribute("user") User getUser, HttpSession session) {
        User user = userService.getUser(getUser.getPhone(),getUser.getPassword());
        if (user == null) {
            return "redirect:/signIn";
        }
        session.setAttribute("signedInUser",user);
        return "redirect:/restaurants";
    }


}
