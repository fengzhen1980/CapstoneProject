package com.CapstoneProject.reggie.service;

import com.CapstoneProject.reggie.dto.SetmealDto;
import com.CapstoneProject.reggie.entity.Setmeal;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface SetmealService extends IService<Setmeal> {

    public void saveWithDish(SetmealDto setmealDto);

    public void removeWithDish(List<Long> ids);
}
