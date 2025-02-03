package com.spring.nardrak_mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.nardrak_mvc.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	// 관리자 회원가입 페이지
	@RequestMapping("/adminSignUp.ad")
	public String adminSignUp(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException{
		
		logger.info("<< url : adminSignUp.ad >>" );
		return "admin/join/signUp";
	}
	
	// 아이디 중복확인
	@RequestMapping("/adminidConfirm.ad")
	public String adminidConfirm(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException{
		
		logger.info("<< url : adminidConfirm.ad >>" );
		
		service.adminIdConfirm(request, response, model);
		
		return "admin/join/idConfirm";
	}

	// 회원가입 실행
	@RequestMapping("/adminSignUpAction.ad")
	public String adminSignUpAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException{
		
		logger.info("<< url : adminSignUpAction.ad >>" );
		
		service.adminSignUpAction(request, response, model);
		
		return "admin/join/actionResult";
	}
	
}