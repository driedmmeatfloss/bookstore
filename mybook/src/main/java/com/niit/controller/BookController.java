package com.niit.controller;

import com.niit.bean.Book;
import com.niit.bean.Category;
import com.niit.service.BookService;
import com.niit.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;


    @RequestMapping("/addca")
    public String addca(Category ca){
        bookService.addCa(ca);
        return "admin/addca";
    }

    @ResponseBody
    @RequestMapping("/getAllCas")
    public List<Category> getAllCas(){

        return bookService.getAllCas();
    }

    @RequestMapping("/addbook")
    public String addBook(Book b, @RequestParam("img")MultipartFile f,HttpSession session){
        bookService.addBook(b,f,session);
        return "/admin/booklist";
    }

    @ResponseBody
    @RequestMapping("/queryBook")
    public Page<Book> queryBook(@RequestParam("pageNumber")int pageNumber,
                                @RequestParam("pageSize")int pageSize,
                                @RequestParam("bookname")String bookname,

                                @RequestParam("category")Integer category){
        Book b = new Book();
        b.setBookname(bookname);

        b.setCaid(category);
        Page<Book> page = new Page<>();
        page.setPageNumber(pageNumber);
        page.setPageSize(pageSize);
        page.setTotal(bookService.getCount(b));
        List<Book> list = bookService.queryBook(b,pageNumber,pageSize);
        page.setRows(list);
        return page;
    }

    @ResponseBody
    @RequestMapping("/queryBook1")
    public Page<Book> queryBook1(@RequestParam("pageNumber")int pageNumber,
                                @RequestParam("pageSize")int pageSize,
                                @RequestParam("bookname")String bookname,
                                @RequestParam("category")Integer category){
        Book b = new Book();
        b.setBookname(bookname);

        b.setCaid(category);
        Page<Book> page = new Page<>();
        page.setPageNumber(pageNumber);
        page.setPageSize(pageSize);
        page.setTotal(bookService.getCount1(b));
        List<Book> list = bookService.queryBook1(b,pageNumber,pageSize);
        page.setRows(list);
        return page;
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("deleteid") String ids){
        String[] data = ids.split(",");
        for(String i:data){
            bookService.delete(Integer.parseInt(i));
        }
        return "admin/booklist";
    }



}
