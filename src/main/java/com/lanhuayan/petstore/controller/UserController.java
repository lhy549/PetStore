package com.lanhuayan.petstore.controller;

import com.lanhuayan.petstore.dao.UserMapper;
import com.lanhuayan.petstore.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserMapper userMapper;

    //显示首页
    @RequestMapping("/index")
    public String home(){
        return "index";
    }

    //获取所有用户并保存
    public List<User> getUserList(){
        return  userMapper.selectAll();
    }

    //登录
    @RequestMapping(value = "/checkLogin",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String checkLogin(String userName,String userPwd){
        List<User> userList = getUserList();

        for (int i = 0; i < userList.size(); i++) {
            User user2 = userList.get(i);
            if(user2.getUsername().equals(userName)){
                //用户名正确
                if(user2.getPassword().equals(userPwd)) {
                   return "{\"msg\":\"PasswordSuccess !\"}";
                } else{ //密码不正确
                    return "{\"msg\":\"PasswordError!\"}";
                }
            }
        }
        return "";

    }

    //注销用户
    public void logout(){

    }
    //跳转到新增用户界面
    @RequestMapping("/addPage")
    public String addPage(){
        return "addUser";
    }

    //新增用户
    @RequestMapping("/addUser")
    @ResponseBody
    public String addUser(@RequestBody User user){
      if(userMapper.insert(user) > 0 ) {
          return "{\"msg\":\"添加成功！\"}";
      }else return "{\"msg\":\"添加失败！\"}";
    }

    //跟据用户名获取用户
    public User getUserByName(String userName){
        return userMapper.selectByPrimaryKey(userName);
    }

    //更新用户
    public void updateUser(String name){
        userMapper.updateByPrimaryKey( getUserByName(name).getUsername());
    }

    //删除用户
    public void deleteUser(String userName){
        userMapper.deleteByPrimaryKey(userName);
    }
}
