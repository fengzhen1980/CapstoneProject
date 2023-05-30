package com.CapstoneProject.reggie.service.impl;

import com.CapstoneProject.reggie.entity.Dish;
import com.CapstoneProject.reggie.mapper.DishMapper;
import com.CapstoneProject.reggie.service.DishService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class DishServiceImpl extends ServiceImpl<DishMapper, Dish> implements DishService {
}
