package com.CapstoneProject.reggie.service.impl;

import com.CapstoneProject.reggie.entity.Setmeal;
import com.CapstoneProject.reggie.mapper.SetmealMapper;
import com.CapstoneProject.reggie.service.SetmealService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class SetmealServiceImpl extends ServiceImpl<SetmealMapper, Setmeal> implements SetmealService {
}
