package com.niit.service.impl;


import com.github.pagehelper.PageHelper;
import com.niit.bean.Record;
import com.niit.mapper.RecordMapper;
import com.niit.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecordServiceImpl  implements RecordService {

    @Autowired
    public RecordMapper recordMapper;

    @Override
    public void borrow(Record r) {

        recordMapper.borrow(r);

    }

    @Override
    public int getCount(Integer uid) {
        return recordMapper.getCount(uid);
    }

    @Override
    public List<Record> queryRecord(Integer uid,int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        return recordMapper.queryRecord(uid);
    }

    @Override
    public void back(Record r) {
        recordMapper.back(r);
    }

    @Override
    public Record get(Integer id) {
        return recordMapper.get(id);
    }

    @Override
    public int getAllCount() {
        return recordMapper.getAllCount();
    }

    @Override
    public List<Record> queryAllRecord(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        return recordMapper.queryAllRecord();
    }
}
