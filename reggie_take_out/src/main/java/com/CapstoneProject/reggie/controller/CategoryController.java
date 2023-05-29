package com.CapstoneProject.reggie.controller;

import com.CapstoneProject.reggie.common.R;
import com.CapstoneProject.reggie.entity.Category;
import com.CapstoneProject.reggie.service.CategoryService;
import com.CapstoneProject.reggie.service.impl.CategoryServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/category")
@Slf4j
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    /**
     * create category
     * @param category
     * @return
     */
    @PostMapping
    public R<String> save(@RequestBody Category category){
        log.info("category:{}", category);
        categoryService.save(category);
        return R.success("Create New Category Successfully");
    }
}
