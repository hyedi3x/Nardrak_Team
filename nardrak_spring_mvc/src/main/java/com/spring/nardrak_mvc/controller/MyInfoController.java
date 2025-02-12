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

import com.spring.nardrak_mvc.service.MyInfoService;

@Controller
public class MyInfoController {
	@Autowired
	private MyInfoService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MyInfoController.class);
	
	// 마이페이지 이동
	@RequestMapping("/myInfo.do")
	public String myInfo(HttpServletRequest request, HttpServletResponse response, Model model) 
	        throws ServletException, IOException{
	    logger.info("<< url : myInfo.do >>" );
	    
	    service.myInfo(request, response, model); // 사용자 정보 메서드

	    return "myInfo/myInfo";
	}

	// 개인정보 설정 탭 클릭시 오른쪽에 표현되는 페이지 
	@RequestMapping("/certifyInfo.do")
	public String certifyInfo(HttpServletRequest request, HttpServletResponse response, Model model) 
	        throws ServletException, IOException {
	    logger.info("<< url : certifyInfo.do >>");
	    
	    return "myInfo/leftMenuTab/pwdChkModify"; 
	}
	
	// 회원 탈퇴 탭 클릭시 오른쪽에 표현되는 페이지 
	@RequestMapping("/certifyDelete.do")
	public String certifyDelete(HttpServletRequest request, HttpServletResponse response, Model model) 
	        throws ServletException, IOException {
	    logger.info("<< url : certifyDelete.do >>");
	    
	    return "myInfo/leftMenuTab/pwdChkDelete";
	}
	
	// 수정 전 비밀번호 체크 페이지
	@RequestMapping("/pwdChkModify.do")
	public String pwdChkModify(HttpServletRequest request, HttpServletResponse response, Model model) 
	        throws ServletException, IOException {
	    logger.info("<< url : pwdChkModify.do >>");
	    
	    service.pwdChk(request, response, model);    // 비밀번호 인증 

	    return "myInfo/modifyResult"; 
	}
	
	// 탈퇴 전 비밀번호 체크 페이지
	@RequestMapping("/pwdChkDelete.do")
	public String pwdChkDelete(HttpServletRequest request, HttpServletResponse response, Model model) 
	        throws ServletException, IOException {
	    logger.info("<< url : pwdChkDelete.do >>");
	    
	    service.pwdChk(request, response, model);    // 비밀번호 인증 

	    return "myInfo/deleteResult";
	}
	
	// 수정 버튼 클릭 시 이동할 페이지 (수정 정보 페이지)
	@RequestMapping("/adminModify.do")
	public String adminModify(HttpServletRequest request, HttpServletResponse response, Model model) 
	        throws ServletException, IOException {
	    logger.info("<< url : adminModify.do >>");
	    	    
	    service.myInfo(request, response, model); // 사용자 정보 메서드
	    
	    return "admin/modifyDelete/adminModifyInfo";
	}
	
	// 삭제 버튼 클릭 시 이동할 페이지(약관 동의 페이지)
	@RequestMapping("adminDelete.do")
	public String adminDelete(HttpServletRequest request, HttpServletResponse response, Model model) 
	        throws ServletException, IOException {
	    logger.info("<< url : adminDelete.do >>");
	    
	    service.myInfo(request, response, model); // 사용자 정보 메서드
	    
	    return "admin/modifyDelete/adminDeleteInfo";
	}
}