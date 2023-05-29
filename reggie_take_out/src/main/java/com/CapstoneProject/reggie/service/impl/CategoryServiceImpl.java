package com.CapstoneProject.reggie.service.impl;

import com.CapstoneProject.reggie.entity.Category;
import com.CapstoneProject.reggie.mapper.CategoryMapper;
import com.CapstoneProject.reggie.service.CategoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {
}
