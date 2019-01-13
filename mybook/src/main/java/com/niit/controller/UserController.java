package com.niit.controller;

import com.niit.bean.User;
import com.niit.service.BookService;
import com.niit.service.UserService;
import com.niit.util.ResultMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private BookService bookService;

    @RequestMapping("/log")
    public String log(){

        return "login";
    }
    @RequestMapping("/reg")
    public String reg(){
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String UserRegister(User u){
        userService.addUser(u);
        return "login" ;
    }

    @ResponseBody
    @RequestMapping(value = "/login" ,method = RequestMethod.POST)
    public ResultMsg UserLogin(@RequestParam("username") String username, @RequestParam("password") String password , HttpSession session){
        User u = userService.getUserByUsername(username);
        if(u==null){
            return new ResultMsg(500,"用户不存在");
        }else if(!u.getPassword().equals(password)){
            return  new ResultMsg(500,"密码错误");
        }
        session.setAttribute("u",u);
        return new ResultMsg(200,null);

    }
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }


    @ResponseBody
    @RequestMapping("/userinfo")
    public User userInfo(HttpSession session){
        User u = (User) session.getAttribute("u");

        return u;

    }

    @RequestMapping("/updateInfo")
    public String updateInfo(User u,HttpSession session){
        User user = (User) session.getAttribute("u");
        u.setId(user.getId());
        System.out.println(u);
        userService.updateInfo(u);
        return "index1";
    }

    @ResponseBody
    @RequestMapping("/pwd")
    public ResultMsg pwd(@RequestParam("oldpwd") String oldpwd,
                         @RequestParam("newpwd") String newpwd,
                         HttpSession session){
        System.out.println(oldpwd+"~~~~~~~~~~"+newpwd);
        User u = (User) session.getAttribute("u");
        if(!u.getPassword().equals(oldpwd)){
            return new ResultMsg(500,"原密码不对");
        }
        u.setPassword(newpwd);
        userService.pwd(u);

        return new ResultMsg(200,"");
    }

    @ResponseBody
    @RequestMapping("/checkUsername")
    public User check(String username){

        return userService.getUserByUsername(username);
    }

}
