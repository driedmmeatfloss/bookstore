package com.niit.service.impl;

import com.github.pagehelper.PageHelper;
import com.niit.bean.Admin;
import com.niit.bean.User;
import com.niit.mapper.AdminMapper;
import com.niit.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin getAdminByAdminname(String adminname) {
        return adminMapper.getAdmin(adminname);
    }

    @Override
    public int getCount() {
        return adminMapper.getCount();
    }

    @Override
    public List<User> getUser(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);

        return adminMapper.getUser();
    }

    @Override
    public void delete(int i) {
        adminMapper.delete(i);
    }

    @Override
    public int getAdminCount() {
        return adminMapper.getAdminCount();
    }

    @Override
    public List<Admin> queryAdmin(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        return adminMapper.queryAdmin();
    }

    @Override
    public void add(Admin a) {
        adminMapper.add(a);
    }

    @Override
    public void deleteAdmin(Integer id) {
        adminMapper.deleteAdmin(id);
    }
}
