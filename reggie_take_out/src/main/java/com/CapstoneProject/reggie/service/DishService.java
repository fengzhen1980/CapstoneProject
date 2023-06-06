package com.CapstoneProject.reggie.service;

import com.CapstoneProject.reggie.dto.DishDto;
import com.CapstoneProject.reggie.entity.Dish;
import com.baomidou.mybatisplus.extension.service.IService;

public interface DishService extends IService<Dish> {
    public void saveWithFlavor(DishDto dishDto);

    public DishDto getByIdWithFlavor(Long id);

    public void updateWithFlavor(DishDto dishDto);
}
