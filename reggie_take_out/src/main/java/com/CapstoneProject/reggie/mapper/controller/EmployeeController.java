package com.CapstoneProject.reggie.mapper.controller;

import com.CapstoneProject.reggie.common.R;
import com.CapstoneProject.reggie.entity.Employee;
import com.CapstoneProject.reggie.service.EmployeeService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.util.Strftime;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;

@Slf4j
@RestController
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @PostMapping("/login")
    public R<Employee> login(HttpServletRequest request, @RequestBody Employee employee) {

        // Encrypt the password with md5.
        String password = employee.getPassword();
        password = DigestUtils.md5DigestAsHex(password.getBytes());

        // research username from database
        LambdaQueryWrapper<Employee> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Employee::getUsername, employee.getUsername());
        Employee emp = employeeService.getOne(queryWrapper);

        // if not found employee information, login failure.
        if(emp == null) {
            return R.error("login failure.");
        }

        // Password comparison
        if(!emp.getPassword().equals(password)) {
            return R.error("login failure.");
        }

        // check employee status
        if(emp.getStatus() == 0) {
            return R.error("The count has been disabled");
        }

        // login successful, save user id into Session and return success result
        request.getSession().setAttribute("employee", emp.getId());
        return R.success(emp);
    }

    @PostMapping("/logout")
    public R<String> logout(HttpServletRequest request) {

        // clean session
        request.getSession().removeAttribute("employee");
        return R.success("logout success");
    }

    /**
     * add an employee
     * @param request
     * @param employee
     * @return
     */
    @PostMapping
    public R<String> save(HttpServletRequest request, @RequestBody Employee employee) {
        log.info("*----> add an employee. The employee information: {}", employee.toString());

        // Set initial password '123456', MD5 encryption is performed
        employee.setPassword(DigestUtils.md5DigestAsHex("123456".getBytes()));

//        employee.setCreateTime(LocalDateTime.now());
//        employee.setUpdateTime(LocalDateTime.now());

        // get current user information
        Long empId = (Long) request.getSession().getAttribute("employee");

//        employee.setCreateUser(empId);
//        employee.setUpdateUser(empId);

        employeeService.save(employee);

        return R.success("Add employee successfully");
    }

    /**
     * Paging query of employee information
     * @param page
     * @param pageSize
     * @param name
     * @return
     */
    @GetMapping("/page")
    public R<Page> page(int page, int pageSize, String name) {
        log.info("*----> page={}, pageSize={}, name={}", page, pageSize, name);

        Page pageInfo = new Page(page, pageSize);

        LambdaQueryWrapper<Employee> queryWrapper = new LambdaQueryWrapper();
        queryWrapper.like(StringUtils.isNotEmpty(name), Employee::getName, name);
        queryWrapper.orderByDesc(Employee::getUpdateTime);

        employeeService.page(pageInfo, queryWrapper);

        return R.success(pageInfo);
    }

    /**
     * Modify employee information based on id
     * @param employee
     * @return
     */
    @PutMapping
    public R<String> update(HttpServletRequest request, @RequestBody Employee employee) {
        log.info("*----> " + employee.toString());
        Long id = Thread.currentThread().getId();
        log.info("*----> Thread id:{}", id);

//        Long empId = (Long) request.getSession().getAttribute("employee");
//        employee.setUpdateUser(empId);
//        employee.setUpdateTime(LocalDateTime.now());

        employeeService.updateById(employee);
        return R.success("Employee information is modified successfully.");
    }

    @GetMapping("/{id}")
    public R<Employee> getById(@PathVariable Long id) {

        Employee employee = employeeService.getById(id);
        if(employee != null) {
            return R.success(employee);
        }
        return R.error("The employee information isn't found.");
    }
}
