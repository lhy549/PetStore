package com.lanhuayan.petstore.dao;

import com.lanhuayan.petstore.entity.Pet;
import java.util.List;

public interface PetMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Pet record);

    Pet selectByPrimaryKey(Integer id);

    Pet selectByPetStatus(String stutas);

    List<Pet> selectAll();

    int updateByPrimaryKey(Pet record);

}