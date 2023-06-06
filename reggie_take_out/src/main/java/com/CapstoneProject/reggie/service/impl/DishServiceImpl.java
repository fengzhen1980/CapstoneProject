package com.CapstoneProject.reggie.service.impl;

import com.CapstoneProject.reggie.dto.DishDto;
import com.CapstoneProject.reggie.entity.Dish;
import com.CapstoneProject.reggie.entity.DishFlavor;
import com.CapstoneProject.reggie.mapper.DishMapper;
import com.CapstoneProject.reggie.service.DishFlavorService;
import com.CapstoneProject.reggie.service.DishService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
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

    @Override
    public DishDto getByIdWithFlavor(Long id) {

        Dish dish = this.getById(id);

        DishDto dishDto = new DishDto();

        BeanUtils.copyProperties(dish, dishDto);

        LambdaQueryWrapper<DishFlavor> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(DishFlavor::getDishId, dish.getId());
        List<DishFlavor> flavors = dishFlavorService.list(queryWrapper);
        dishDto.setFlavors(flavors);

        return dishDto;
    }

    @Override
    @Transactional
    public void updateWithFlavor(DishDto dishDto) {
        // update dish table
        this.updateById(dishDto);

        // delete old flavor information from dish_flavor table
        LambdaQueryWrapper<DishFlavor> queryWrapper = new LambdaQueryWrapper();
        queryWrapper.eq(DishFlavor::getDishId, dishDto.getId());
        dishFlavorService.remove(queryWrapper);

        // insert new flavor information into dish_flavor table
        List<DishFlavor> flavors = dishDto.getFlavors();

        flavors = flavors.stream().map((item)-> {
            item.setDishId(dishDto.getId());
            return item;
        } ).collect(Collectors.toList());

        dishFlavorService.saveBatch(flavors);

    }
}
