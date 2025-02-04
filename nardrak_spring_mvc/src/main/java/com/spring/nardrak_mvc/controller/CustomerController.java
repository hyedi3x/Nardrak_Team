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

import com.spring.nardrak_mvc.service.CustomerService;



@Controller
public class CustomerController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	private CustomerService service;
	

	// ======================= [시작 홈페이지] =======================
	@RequestMapping("main.do")
    public String main() {
		logger.info("<< url - main.do >>");
        
        return "common/main";
     }
	
	// ======================= [로그인 처리 페이지] =======================
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<< url - login.do >>");
				
		return "customer/login/login";
	}
	
	// ======================= [로그인 성공 처리 페이지] =======================
	@RequestMapping("/loginResult.do")
	public String loginResult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<< url - loginResult.do >>");
			
		service.loginResult(request, response, model);

		return "customer/actionResult";
	}
	
	// ======================= [로그아웃 처리 페이지] =======================
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<< url - logout.do >>");
		
		// 세션 삭제
		request.getSession().invalidate();

		return "common/main";	
	}
	
	// ======================= [개인정보 처리 동의 페이지] =======================
	@RequestMapping("/joinAgreement.do")
	public String joinAgreement() {
		logger.info("<< url => /joinAgreement.do >>");
			
		return "customer/join/joinAgreement";
	}
	
	// ======================= [회원가입 페이지] =======================
	@RequestMapping("/join.do")
	public String join() {
		logger.info("<< url => /join.do >>");

		return "customer/join/join";
	}
	
	// ======================= [id 중복확인 페이지] =======================
	@RequestMapping("/idConfirmAction.do")
	public String idConfirmAction(HttpServletRequest request, HttpServletResponse response , Model model) 
			throws ServletException, IOException {
		logger.info("<< url => /idConfirmAction.do >>");

		service.inConfirmAction(request,response, model);

		return "customer/join/idConfirmAction";
	}
}

