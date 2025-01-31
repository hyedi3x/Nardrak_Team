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

import com.spring.nardrak_mvc.HomeController;
import com.spring.nardrak_mvc.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
	
	// 관리자 로그인 페이지 (태영)
	@RequestMapping("/adminLogIn.ad") 
	public String adminLogIn(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{	
		
		logger.info("<< url : login.ad >>");	
		
		return "admin/login/login";
	}
	
	//로그인 실행 (태영)
	@RequestMapping("/adminLogInAction.ad")
	public String adminLogInAction(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException{
		
		logger.info("<< url : adminLogInAction.ad >>");
		
		service.adminIdPwdCheck(request, response, model);	
		
		return "admin/login/loginChk";
	}
	
	// 로그아웃 (태영)
	@RequestMapping("/adminLogOut.ad") 
	public String adminLogOut(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{	
		
		logger.info("<< url : logout.ad >>");	
		
		request.getSession().invalidate();
		
		return "admin/login/login"; // 임시, 메인으로 경로 변경
	}
	
	// 계정 수정 : 비밀번호 확인 페이지
	@RequestMapping("/adminModifyChk.ad") 
	public String adminModifyChk(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{	
		
		logger.info("<< url : adminModifyChk.ad >>");	
		
		return "admin/modify/modifyChk";
	}
	
	// 비밀번호 확인 => 관리자 계정 수정 페이지
	@RequestMapping("/adminModify.ad") 
	public String adminModify(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		
		logger.info("<< url : adminModify.ad >>");	
		
		service.adminModify(request, response, model);
		
		return "admin/modify/modify";
	}
	
	// 계정 정보 수정
	//비밀번호 확인 => 관리자 계정 수정 페이지 이동
	@RequestMapping("/adminModifyAction.ad") 
	public String adminModifyAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{	
		
		logger.info("<< url : adminModifyAction.ad >>");	
		
		service.adminModifyAction(request, response, model);
		
		return "admin/join/actionResult";
	}
	
	// 관리자 탈퇴화면 (태영)
	// 비밀번호 확인 => 결과화면 actionResult으로 이동
	@RequestMapping("/adminDelete.ad") 
	public String adminDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{	
		
		logger.info("<< url : adminDelete.ad >>");	
		
		return "admin/delete/delete"; 
	}
	
	// 관리자 탈퇴실행 (태영)
	// 비밀번호 확인 => 결과화면 actionResult으로 이동
	@RequestMapping("/adminDeleteAction.ad")   
	public String adminDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{	
		
		logger.info("<< url : adminDeleteAction.ad >>");	
		
		service.adminDeleteAction(request, response, model);
		
		return "admin/join/actionResult";   
	}
}