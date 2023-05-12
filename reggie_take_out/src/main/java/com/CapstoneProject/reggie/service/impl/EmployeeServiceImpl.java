package com.CapstoneProject.reggie.service.impl;

import com.CapstoneProject.reggie.entity.Employee;
import com.CapstoneProject.reggie.mapper.EmployeeMapper;
import com.CapstoneProject.reggie.service.EmployeeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, Employee> implements EmployeeService {
}
