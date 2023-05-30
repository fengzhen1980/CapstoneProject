package com.CapstoneProject.reggie.service.impl;

import com.CapstoneProject.reggie.common.CustomException;
import com.CapstoneProject.reggie.entity.Category;
import com.CapstoneProject.reggie.entity.Dish;
import com.CapstoneProject.reggie.entity.Setmeal;
import com.CapstoneProject.reggie.mapper.CategoryMapper;
import com.CapstoneProject.reggie.service.CategoryService;
import com.CapstoneProject.reggie.service.DishService;
import com.CapstoneProject.reggie.service.SetmealService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

    @Autowired
    private DishService dishService;

    @Autowired
    private SetmealService setmealService;

    @Override
    public void remove(Long id) {
        // check the relationships with dish
        LambdaQueryWrapper<Dish> dishLambdaQueryWrapper = new LambdaQueryWrapper<>();
        dishLambdaQueryWrapper.eq(Dish :: getCategoryId, id);
        int countDish = dishService.count(dishLambdaQueryWrapper);
        if(countDish > 0){
            throw new CustomException("Current category is related with dish. It can't be deleted.");
        }

        // check the relationships with set meal
        LambdaQueryWrapper<Setmeal> setmealLambdaQueryWrapper = new LambdaQueryWrapper<>();
        setmealLambdaQueryWrapper.eq(Setmeal::getCategoryId, id);
        int countSetmeal = setmealService.count(setmealLambdaQueryWrapper);
        if(countSetmeal > 0){
            throw new CustomException("Current category is related with set meal. It can't be deleted.");
        }

        // delete category
        super.removeById(id);
    }
}
