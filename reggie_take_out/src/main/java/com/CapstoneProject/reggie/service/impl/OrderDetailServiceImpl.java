package com.CapstoneProject.reggie.service.impl;

import com.CapstoneProject.reggie.entity.OrderDetail;
import com.CapstoneProject.reggie.mapper.OrderDetailMapper;
import com.CapstoneProject.reggie.service.OrderDetailService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class OrderDetailServiceImpl extends ServiceImpl<OrderDetailMapper, OrderDetail> implements OrderDetailService {
}
