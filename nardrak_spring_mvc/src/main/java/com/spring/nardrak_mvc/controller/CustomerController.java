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
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.nardrak_mvc.service.CustomerService;
import com.spring.nardrak_mvc.service.ImageUploadService;

@Controller
public class CustomerController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	private CustomerService service;
	
	@Autowired
	private ImageUploadService uploadService;
	

	// ======================= [시작 홈페이지] =======================
	@RequestMapping("main.do")
    public String main(HttpServletRequest request, HttpServletResponse response, Model model) 
    		throws ServletException, IOException {
		logger.info("<< url - main.do >>");
		
		uploadService.getImages(request, response, model);
        
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
		
		uploadService.getImages(request, response, model);
		
		return "common/main";	
	}
	
	// ======================= [개인정보 처리 동의 페이지] =======================
	@RequestMapping("/joinAgreement.do")
	public String joinAgreement() {
		logger.info("<< url => /joinAgreement.do >>");
			
		return "customer/join/joinAgreement";
	}
	
	// ======================= [전화번호 & 이메일 중복 확인] =======================
	@RequestMapping("/uniqueCheck.do")
	public void uniqueCheck(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
	    logger.info("<< url => /uniqueCheck.do >>");

	    service.uniqueCheck(request, response, model);
	}


	// ======================= [회원가입 페이지] =======================
	@RequestMapping("/join.do")
	public String join(HttpServletRequest request) {
		logger.info("<< url => /join.do >>");
		
		request.setAttribute("cs_Terms", request.getParameter("cs_Terms"));
		
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
	
	// ======================= [회원가입 처리 페이지] =======================
	// 서비스 호출, joinAction.jsp
	@RequestMapping("/joinAction.do")
	public String joinAction(HttpServletRequest request,HttpServletResponse response , Model model) 
			throws ServletException, IOException {
		logger.info("<<< url => /joinAction.do >>>");

		service.signUpAction(request, response ,model);

		return "customer/actionResult";
	}
}

