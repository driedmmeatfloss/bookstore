package com.niit.mapper;

import com.niit.bean.Book;
import com.niit.bean.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookMapper {

    Integer addCa(Category cat);

    List<Category> getAllCas();

    void addBook(Book b);

    List<Book> queryBook(Book b);

    int getCount(Book b);

    void delete(int i);

    void borrow(Integer id);

    void back(Integer bid);

    int getCount1(Book b);

    List<Book> queryBook1(Book b);
}
