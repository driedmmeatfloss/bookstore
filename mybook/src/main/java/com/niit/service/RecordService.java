package com.niit.service;

import com.niit.bean.Record;

import java.util.List;

public interface RecordService {

    void borrow(Record r);

    int getCount(Integer uid);

    List<Record> queryRecord(Integer uid,int pageNumber, int pageSize);

    void back(Record r);

    Record get(Integer id);

    int getAllCount();

    List<Record> queryAllRecord(int pageNumber, int pageSize);
}
