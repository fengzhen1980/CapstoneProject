package com.CapstoneProject.reggie.service;

import com.CapstoneProject.reggie.dto.DishDto;
import com.CapstoneProject.reggie.entity.Dish;
import com.baomidou.mybatisplus.extension.service.IService;

public interface DishService extends IService<Dish> {
    void saveWithFlavor(DishDto dishDto);
}
