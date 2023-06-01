package com.CapstoneProject.reggie.service.impl;

import com.CapstoneProject.reggie.entity.DishFlavor;
import com.CapstoneProject.reggie.mapper.DishFlavorMapper;
import com.CapstoneProject.reggie.service.DishFlavorService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class DishFlavorServiceImpl extends ServiceImpl<DishFlavorMapper, DishFlavor> implements DishFlavorService {
}
