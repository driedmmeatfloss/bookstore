package com.niit.service;

import com.niit.bean.Admin;
import com.niit.bean.User;

import java.util.List;

public interface AdminService {

    Admin getAdminByAdminname(String Adminname);

    int getCount();

    List<User> getUser(int pageNumber, int pageSize);

    void delete(int i);

    int getAdminCount();

    List<Admin> queryAdmin(int pageNumber, int pageSize);

    void add(Admin a);

    void deleteAdmin(Integer id);
}
