package com.CapstoneProject.reggie.service.impl;

import com.CapstoneProject.reggie.entity.ShoppingCart;
import com.CapstoneProject.reggie.mapper.ShoppingCartMapper;
import com.CapstoneProject.reggie.service.ShoppingCartService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class ShoppingCartServiceImpl extends ServiceImpl<ShoppingCartMapper, ShoppingCart> implements ShoppingCartService {
}
