package com.spring.nardrak_mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.nardrak_mvc.dao.CustomerDAO;

@Service
public class CustomerServiceImpl {

	@Autowired
	private CustomerDAO dao;
	
	
}
