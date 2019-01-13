package com.niit.mapper;

import com.niit.bean.Record;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RecordMapper {

    void borrow(Record r);

    int getCount(Integer uid);

    List<Record> queryRecord(Integer uid);

    void back(Record r);

    Record get(Integer id);

    int getAllCount();

    List<Record> queryAllRecord();
}
