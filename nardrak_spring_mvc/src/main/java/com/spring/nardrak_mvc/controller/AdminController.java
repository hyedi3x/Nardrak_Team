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
		
		return "admin/actionResultAdmin";
	}
	
	// 유니크 값 체크
	@RequestMapping("/uniqueCheck.ad")
	public void uniqueCheck(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException{
		
		logger.info("<< url : uniqueCheck.ad >>" );
		
		service.uniqueCheck(request, response, model);
	}
	
	// ======================= [관리자 로그인 처리 페이지] =======================
	@RequestMapping("/loginAdmin.ad")
	public String loginAdmin(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<< url - loginAdmin.ad >>");
				
		return "admin/login/loginAdmin";
	}
	
	// ======================= [관리자 로그인 성공 처리 페이지] =======================
	@RequestMapping("/loginResult.ad")
	public String loginResult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<< url - loginResult.ad >>");
			
		service.loginResult(request, response, model);

		return "admin/actionResultAdmin";

	}
	
	// 마이페이지 - 수정/삭제 비밀번호 확인 페이지 이동
	@RequestMapping("/pwdCheck.ad")
	public String pwdCheck(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException{
		logger.info("<< url : pwdCheck.ad >>" );
		
		return "admin/modify_delete/pwdCheck";
	}
				
	// 비밀번호 확인 => 관리자 수정 페이지 이동
	@RequestMapping("/adminModify.ad")
	public String adminModify(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException{
		logger.info("<< url : adminModify.ad >>" );
		
		service.adminModify(request, response, model);
		
		return "admin/modify_delete/delete";
	}
	
	// 관리자 수정
	@RequestMapping("/adminModifyAction.ad")
	public String adminModifyAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException{
		logger.info("<< url : adminModifyAction.ad >>" );
		
		service.adminModifyAction(request, response, model);
		
		return "admin/join/actionResult";
	}
	
	// 관리자 삭제
	@RequestMapping("/adminDeleteAction.ad")
	public String adminDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException{
		logger.info("<< url : adminDeleteAction.ad >>" );
		
		service.adminDeleteAction(request, response, model);
		
		return "admin/join/actionResult";
	}

	// 관리자 등록 요청 조회 리스트
	@RequestMapping("/adminAccess.ad")
	public String adminAccess(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException{
		logger.info("<< url : adminAccess.ad >>" );
		
		service.adminAccess(request, response, model);
		
		return "admin/accessList/accessList_admin";
	}
		
}