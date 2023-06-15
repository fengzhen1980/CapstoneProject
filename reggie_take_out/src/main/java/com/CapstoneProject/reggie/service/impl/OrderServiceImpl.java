package com.CapstoneProject.reggie.service.impl;

import com.CapstoneProject.reggie.entity.Orders;
import com.CapstoneProject.reggie.mapper.OrderMapper;
import com.CapstoneProject.reggie.service.OrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Orders> implements OrderService {
}
