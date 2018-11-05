package com.lanhuayan.petstore.dao;

import com.lanhuayan.petstore.entity.User;
import java.util.List;

public interface UserMapper {

    int deleteByPrimaryKey(String username);


    int insert(User record);


    User selectByPrimaryKey(String username);


    List<User> selectAll();

    int updateByPrimaryKey(String username);
}