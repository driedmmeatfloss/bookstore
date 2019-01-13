package com.niit.service;

import com.niit.bean.Donate;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface DonateService {


    void donate(Donate d, MultipartFile f, HttpSession session);

    int getCount(HttpSession session);

    List<Donate> queryDonate(int pageNumber, int pageSize,HttpSession session);

    int getAllCount();

    List<Donate> queryAllDonate(int pageNumber, int pageSize);

    void pass(int id);

    void refuse(int id);

    Donate query(int id);
}
