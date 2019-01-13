package com.niit.controller;


import com.niit.bean.Book;
import com.niit.bean.Donate;
import com.niit.service.BookService;
import com.niit.service.DonateService;
import com.niit.util.Page;
import com.niit.util.ResultMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/donate")
public class DonateController {

    @Autowired
    public DonateService donateService;

    @Autowired
    public BookService bookService;

    @RequestMapping("/donate")
    public String addBook(Donate d, @RequestParam("img")MultipartFile f, HttpSession session){
        donateService.donate(d,f,session);
        return "/donate";
    }

    @ResponseBody
    @RequestMapping("/queryDonate")
    public Page<Donate> queryBook(@RequestParam("pageNumber")int pageNumber,
                                  @RequestParam("pageSize")int pageSize,HttpSession session){
        Donate d = new Donate();

        Page<Donate> page = new Page<>();
        page.setPageNumber(pageNumber);
        page.setPageSize(pageSize);
        page.setTotal(donateService.getCount(session));
        List<Donate> list = donateService.queryDonate(pageNumber,pageSize,session);
        page.setRows(list);
        return page;
    }

    @ResponseBody
    @RequestMapping("/queryAllDonate")
    public Page<Donate> queryAllDonate(@RequestParam("pageNumber")int pageNumber,
                                  @RequestParam("pageSize")int pageSize){
        Donate d = new Donate();

        Page<Donate> page = new Page<>();
        page.setPageNumber(pageNumber);
        page.setPageSize(pageSize);
        page.setTotal(donateService.getAllCount());
        List<Donate> list = donateService.queryAllDonate(pageNumber,pageSize);
        page.setRows(list);
        return page;
    }

    @ResponseBody
    @RequestMapping("/pass")
    public ResultMsg pass(@RequestParam("id") int id){
        donateService.pass(id);
        Donate d = donateService.query(id);
        Book b = new Book();
        b.setBookname(d.getName());
        b.setPublish(d.getPublish());
        b.setCaid(d.getCaid());
        b.setPicurl(d.getPicurl());
        b.setAuthor(d.getAuthor());
        b.setNumber(1);
        bookService.addBook1(b);
        return new ResultMsg(200,"");
    }

    @ResponseBody
    @RequestMapping("/refuse")
    public ResultMsg refuse(@RequestParam("id") int id){
        donateService.refuse(id);
        return new ResultMsg(200,"");
    }

}
