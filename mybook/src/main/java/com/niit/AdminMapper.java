package com.niit.mapper;

import com.niit.bean.Admin;
import com.niit.bean.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper {
    Admin getAdmin(String adminname);

    int getCount();

    List<User> getUser();

    void delete(int i);

    int getAdminCount();

    List<Admin> queryAdmin();

    void add(Admin a);

    void deleteAdmin(Integer id);
}
