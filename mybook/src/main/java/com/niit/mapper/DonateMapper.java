package com.niit.mapper;

import com.niit.bean.Donate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DonateMapper {

    void donate(Donate d);

    int getCount(Integer id);

    List<Donate> queryDonate(Integer id);

    int getAllCount();

    List<Donate> queryAllDonate();

    void pass(int id);

    void refuse(int id);

    Donate query(int id);
}
