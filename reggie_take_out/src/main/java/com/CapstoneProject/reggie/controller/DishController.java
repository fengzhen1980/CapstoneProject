package com.CapstoneProject.reggie.controller;

import com.CapstoneProject.reggie.common.R;
import com.CapstoneProject.reggie.dto.DishDto;
import com.CapstoneProject.reggie.entity.Category;
import com.CapstoneProject.reggie.entity.Dish;
import com.CapstoneProject.reggie.service.CategoryService;
import com.CapstoneProject.reggie.service.DishFlavorService;
import com.CapstoneProject.reggie.service.DishService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/dish")
@Slf4j
public class DishController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private DishService dishService;

    @Autowired
    private DishFlavorService dishFlavorService;

    @PostMapping
    public R<String> save(@RequestBody DishDto dishDto){
        dishService.saveWithFlavor(dishDto);
        return R.success("Add Dish Successful!");
    }

    @GetMapping("/page")
    public R<Page> page(int page, int pageSize, String name) {

        Page<Dish> pageInfo = new Page<>(page, pageSize);
        Page<DishDto> dishDtoPage = new Page<>();

        LambdaQueryWrapper<Dish> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(name != null, Dish::getName, name);
        queryWrapper.orderByDesc(Dish::getUpdateTime);

        dishService.page(pageInfo,queryWrapper);

        // object copy
        BeanUtils.copyProperties(pageInfo, dishDtoPage, "records");

        List<Dish> records = pageInfo.getRecords();
        List<DishDto> list = records.stream().map((item) ->{
            DishDto dishDto = new DishDto();

            BeanUtils.copyProperties(item, dishDto);

            Long categoryId = item.getCategoryId();

            Category category = categoryService.getById(categoryId);
            String categoryName = category.getName();

            dishDto.setCategoryName(categoryName);

            return dishDto;
        }).collect(Collectors.toList());

        dishDtoPage.setRecords(list);

        return R.success(dishDtoPage);
    }
}
