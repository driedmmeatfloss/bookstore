package com.niit.service.impl;

import com.github.pagehelper.PageHelper;
import com.niit.bean.Book;
import com.niit.bean.Category;
import com.niit.mapper.BookMapper;
import com.niit.service.BookService;
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
public class BookServiceImpl implements BookService {

    @Autowired
    private BookMapper bookMapper;

    @Override
    public Integer addCa(Category ca) {
        return bookMapper.addCa(ca);
    }

    @Override
    public List<Category> getAllCas() {
        return  bookMapper.getAllCas();
    }

    @Override
    public void addBook(Book b, MultipartFile f, HttpSession session) {
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
        b.setPicurl(fileName);
        //上传文件并保存到指定路径信息
        try {
            f.transferTo(new File(path,fileName));
        } catch (IllegalStateException ex) {
            ex.getMessage();
        } catch (IOException ex) {
            ex.getMessage();
        }

        bookMapper.addBook(b);



    }

    @Override
    public List<Book> queryBook(Book b, int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);

        return bookMapper.queryBook(b);
    }

    @Override
    public int getCount(Book b) {
        return bookMapper.getCount(b);
    }

    @Override
    public void delete(int i) {
        bookMapper.delete(i);
    }

    @Override
    public void addBook1(Book b) {
        bookMapper.addBook(b);
    }

    @Override
    public void borrow(Integer id) {
        bookMapper.borrow(id);
    }

    @Override
    public void back(Integer bid) {
        bookMapper.back(bid);
    }

    @Override
    public int getCount1(Book b) {
        return bookMapper.getCount1(b);
    }

    @Override
    public List<Book> queryBook1(Book b, int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        return bookMapper.queryBook1(b);
    }


}
