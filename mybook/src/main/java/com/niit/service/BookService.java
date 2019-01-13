package com.niit.service;

import com.niit.bean.Book;
import com.niit.bean.Category;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface BookService {

    Integer addCa(Category ca);

    List<Category> getAllCas();

    void addBook(Book b, MultipartFile f, HttpSession session);

    List<Book> queryBook(Book b,int pageNumber,int pageSize);

    int getCount(Book b);

    void delete(int i);


    void addBook1(Book b);

    void borrow(Integer id);

    void back(Integer bid);

    int getCount1(Book b);

    List<Book> queryBook1(Book b, int pageNumber, int pageSize);
}
