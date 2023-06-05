package com.CapstoneProject.reggie.service.impl;

import com.CapstoneProject.reggie.dto.DishDto;
import com.CapstoneProject.reggie.entity.Dish;
import com.CapstoneProject.reggie.entity.DishFlavor;
import com.CapstoneProject.reggie.mapper.DishMapper;
import com.CapstoneProject.reggie.service.DishFlavorService;
import com.CapstoneProject.reggie.service.DishService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
public class DishServiceImpl extends ServiceImpl<DishMapper, Dish> implements DishService {

    @Autowired
    private DishFlavorService dishFlavorService;

    @Transactional
    public void saveWithFlavor(DishDto dishDto) {

        // save information into dish table
        this.save(dishDto);

        Long dishId = dishDto.getId();

        List<DishFlavor> flavors = dishDto.getFlavors();
        flavors = flavors.stream().map((item) -> {
            item.setDishId(dishId);
            return item;
        }).collect(Collectors.toList());


        // save information into dish_flavor table
        dishFlavorService.saveBatch(flavors);

    }
}
