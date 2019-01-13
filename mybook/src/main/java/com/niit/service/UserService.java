package com.niit.service;

import com.niit.bean.User;


public interface UserService {

    Integer addUser(User u);

    User getUserByUsername(String username);


    void updateInfo(User u);

    void pwd(User u);
}
