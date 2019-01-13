package com.niit.controller;

import com.niit.bean.Record;
import com.niit.bean.User;
import com.niit.service.BookService;
import com.niit.service.RecordService;
import com.niit.util.Page;
import com.niit.util.ResultMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/record")
public class RecordController {

    @Autowired
    private RecordService recordService;

    @Autowired
    private BookService bookService;

    @ResponseBody
    @RequestMapping("/borrow")
    public ResultMsg borrwo(Integer id,HttpSession session){
        User u = (User) session.getAttribute("u");
        if(u == null){
            return new ResultMsg(500,"请先登录");
        }
        Record r = new Record();
        r.setIndate(new Date());
        r.setBid(id);
        r.setUid(u.getId());
        r.setStatus(0);


        recordService.borrow(r);
        bookService.borrow(id);
        return new ResultMsg(200,"");
    }

    @ResponseBody
    @RequestMapping("/record")
    public Page<Record> queryRecord(@RequestParam("pageNumber")int pageNumber,
                                       @RequestParam("pageSize")int pageSize, HttpSession session){
        User u = (User) session.getAttribute("u");
        Integer uid = u.getId();
        Page<Record> page = new Page<>();
        page.setPageNumber(pageNumber);
        page.setPageSize(pageSize);
        page.setTotal(recordService.getCount(uid));
        List<Record> list = recordService.queryRecord(uid,pageNumber,pageSize);
        page.setRows(list);
        return page;

    }

    @ResponseBody
    @RequestMapping("/recordAll")
    public Page<Record> queryAllRecord(@RequestParam("pageNumber")int pageNumber,
                                       @RequestParam("pageSize")int pageSize){

        Page<Record> page = new Page<>();
        page.setPageNumber(pageNumber);
        page.setPageSize(pageSize);
        page.setTotal(recordService.getAllCount());
        List<Record> list = recordService.queryAllRecord(pageNumber,pageSize);
        page.setRows(list);
        return page;

    }

    @ResponseBody
    @RequestMapping("/back")
    public ResultMsg back(Integer id){
        Record r = recordService.get(id);
        r.setOutdate(new Date());
        recordService.back(r);
        Integer bid = r.getBid();
        bookService.back(bid);

        return new ResultMsg(200,"");
    }

}
