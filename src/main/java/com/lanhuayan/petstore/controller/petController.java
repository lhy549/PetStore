package com.lanhuayan.petstore.controller;

import com.lanhuayan.petstore.dao.CategoryMapper;
import com.lanhuayan.petstore.dao.PetMapper;
import com.lanhuayan.petstore.dao.TagMapper;
import com.lanhuayan.petstore.entity.Category;
import com.lanhuayan.petstore.entity.Pet;
import com.lanhuayan.petstore.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/pet")
public class petController {

    @Autowired
    private PetMapper petMapper;
    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private TagMapper tagMapper;

    private List<Pet> petList;

    //通过id获取宠物
    public Pet getPetById(int id){
        return petMapper.selectByPrimaryKey(id);
    }

    //通过状态获取宠物
    @RequestMapping("/getPetByStatus")
    @ResponseBody
    public Pet findByStatus(String SearchText){
        return petMapper.selectByPetStatus(SearchText);
    }

    //更新现有宠物
    public void updatePet(Pet pet){
        petMapper.updateByPrimaryKey(pet);
    }

    //所有宠物
    @RequestMapping(method = RequestMethod.GET)
    public String getPets(Model model){
        petList = petMapper.selectAll();
        model.addAttribute("petList",petList);
        return "petstore";
    }

    @RequestMapping("/getAddPage")
    public String showAddPage(Model model){
        List<Category> categoryList = categoryMapper.selectAll();
        List<Tag> tagList = tagMapper.selectAll();
        model.addAttribute("tagList",tagList);
        model.addAttribute("categoryList",categoryList);
        return "addPeg";
    }

    //将新宠物添加到商店
    //AddToStore
    @RequestMapping("/addToStore")
    public void AddToStore(Pet pet){

    }

    //删除宠物
    @RequestMapping("/delPet/{id}")
    public String deletePet(@PathVariable int id){
        petMapper.deleteByPrimaryKey(id);
        return "/pet";
    }

}
