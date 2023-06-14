package com.CapstoneProject.reggie.service.impl;

import com.CapstoneProject.reggie.entity.AddressBook;
import com.CapstoneProject.reggie.mapper.AddressBookMapper;
import com.CapstoneProject.reggie.service.AddressBookService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class AddressBookServiceImpl extends ServiceImpl<AddressBookMapper, AddressBook> implements AddressBookService {
}
