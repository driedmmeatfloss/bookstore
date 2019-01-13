package com.niit.service.impl;

import com.niit.bean.User;
import com.niit.mapper.UserMapper;
import com.niit.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public Integer addUser(User u) {

        Integer result = userMapper.addUser(u);
        return result;
    }

    @Override
    public User getUserByUsername(String username) {
        return userMapper.getUserByUsername(username);
    }

    @Override
    public void updateInfo(User u) {
        userMapper.updateInfo(u);
    }

    @Override
    public void pwd(User u) {
        userMapper.pwd(u);
    }


}
