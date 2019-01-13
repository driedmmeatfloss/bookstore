package com.niit.mapper;

import com.niit.bean.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {

    Integer addUser(User u);

    User getUserByUsername(String username);


    void updateInfo(User u);

    void pwd(User u);
}
