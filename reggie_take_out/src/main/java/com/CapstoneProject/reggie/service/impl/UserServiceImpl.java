package com.CapstoneProject.reggie.service.impl;

import com.CapstoneProject.reggie.entity.User;
import com.CapstoneProject.reggie.mapper.UserMapper;
import com.CapstoneProject.reggie.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
}
