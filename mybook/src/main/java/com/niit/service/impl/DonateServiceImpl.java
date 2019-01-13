package com.niit.service.impl;

import com.github.pagehelper.PageHelper;
import com.niit.bean.Donate;
import com.niit.bean.User;
import com.niit.mapper.DonateMapper;
import com.niit.service.DonateService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class DonateServiceImpl implements DonateService {


    @Autowired
    public DonateMapper donateMapper;

    @Override
    public void donate(Donate d, MultipartFile f, HttpSession session) {
        ServletContext sc = session.getServletContext();
        String path = sc.getRealPath("/image");
        //判断上传路径是否存在
        File file = new File(path);
        //不存在创建新的路径
        if(!file.exists()) {
            file.mkdirs();
        }
        //设置随机文件名称
        String uuid = UUID.randomUUID().toString().replaceAll("-","");
        //获取上传文件后缀名称   1.txt txt
        String suffix =
                FilenameUtils.getExtension(f.getOriginalFilename());
        //组装文件名称
        String fileName = uuid + "." + suffix;
        d.setPicurl(fileName);

        try {
            f.transferTo(new File(path,fileName));
        } catch (IllegalStateException ex) {
            ex.getMessage();
        } catch (IOException ex) {
            ex.getMessage();
        }
        User u = (User) session.getAttribute("u");
        d.setUid(u.getId());
        donateMapper.donate(d);
    }

    @Override
    public int getCount(HttpSession session) {
        User u = (User) session.getAttribute("u");
        Integer id = u.getId();
        return donateMapper.getCount(id);
    }

    @Override
    public List<Donate> queryDonate(int pageNumber, int pageSize,HttpSession session) {
        PageHelper.startPage(pageNumber,pageSize);
        User u = (User) session.getAttribute("u");
        Integer id = u.getId();
        return donateMapper.queryDonate(id);
    }

    @Override
    public int getAllCount() {
        return donateMapper.getAllCount();
    }

    @Override
    public List<Donate> queryAllDonate(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        return donateMapper.queryAllDonate();
    }

    @Override
    public void pass(int id) {
        donateMapper.pass(id);
    }

    @Override
    public void refuse(int id) {
        donateMapper.refuse(id);
    }

    @Override
    public Donate query(int id) {
        return donateMapper.query(id);
    }
}
