package com.niit.controller;

import com.niit.bean.Admin;
import com.niit.bean.User;
import com.niit.service.AdminService;
import com.niit.util.Page;
import com.niit.util.ResultMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/log")
    public String log(){
        return "admin/login";
    }

    @ResponseBody
    @RequestMapping(value = "/login" ,method = RequestMethod.POST)
    public ResultMsg UserLogin(@RequestParam("adminname") String adminname, @RequestParam("password") String password , HttpSession session){
        Admin a = adminService.getAdminByAdminname(adminname);
        if(a==null){
            return new ResultMsg(500,"管理员不存在");
        }else if(!a.getPassword().equals(password)){
            return  new ResultMsg(500,"密码错误");
        }
        session.setAttribute("a",a);
        return new ResultMsg(200,null);

    }
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
    @ResponseBody
    @RequestMapping("/getUser")
    public Page<User> queryUser(@RequestParam("pageNumber")int pageNumber,
                                @RequestParam("pageSize")int pageSize){

        Page<User> page = new Page<>();
        page.setPageNumber(pageNumber);
        page.setPageSize(pageSize);
        page.setTotal(adminService.getCount());
        List<User> list = adminService.getUser(pageNumber,pageSize);
        page.setRows(list);
        return page;
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("deleteid") String ids){
        String[] data = ids.split(",");
        for(String i:data){
            adminService.delete(Integer.parseInt(i));
        }
        return "admin/userlist";
    }

    @ResponseBody
    @RequestMapping("/admin")
    public Page<Admin> queryAdmin(@RequestParam("pageNumber")int pageNumber,
                                @RequestParam("pageSize")int pageSize){

        Page<Admin> page = new Page<>();
        page.setPageNumber(pageNumber);
        page.setPageSize(pageSize);
        page.setTotal(adminService.getAdminCount());
        List<Admin> list = adminService.queryAdmin(pageNumber,pageSize);
        page.setRows(list);
        return page;
    }

    @ResponseBody
    @RequestMapping(value = "/add")
    public ResultMsg addAdmin(Admin a){
        adminService.add(a);

        return new ResultMsg(200,null);

    }

    @ResponseBody
    @RequestMapping(value = "/deleteAdmin" )
    public ResultMsg delete(Integer id){
        adminService.deleteAdmin(id);

        return new ResultMsg(200,null);

    }


}
