package com.CapstoneProject.reggie.mapper.controller;

import com.CapstoneProject.reggie.common.R;
import com.CapstoneProject.reggie.entity.Orders;
import com.CapstoneProject.reggie.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/submit")
    public R<String> submit(@RequestBody Orders orders) {
        log.info("*----> orders:{}",orders);
        orderService.submit(orders);
        return R.success("Submit order successfully");
    }
}
