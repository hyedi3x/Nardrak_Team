package com.spring.nardrak_mvc.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface CustomerService {
	
	// ======================= [ID 중복확인 처리] =======================
	public void inConfirmAction(HttpServletRequest request,HttpServletResponse response, Model model) 
	        throws ServletException, IOException;
	
	// ======================= [전화번호 & 이메일 중복 확인] =======================
	public void uniqueCheck(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException;

	// ======================= [회원가입 처리] =======================
    public void signUpAction(HttpServletRequest request,HttpServletResponse response, Model model) 
            throws ServletException, IOException;
 
	// ======================= [로그인 성공 처리 페이지] =======================
	public void loginResult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	//======================= [회원정보 수정처리] =======================
	public void modifyCustomerInAction(HttpServletRequest request,HttpServletResponse response, Model model) 
	        throws ServletException, IOException;
	    
	//======================= [회원정보 탈퇴처리] =======================
	public void deleteCustomer(HttpServletRequest request,HttpServletResponse response, Model model) 
			throws ServletException, IOException;
	
	//======================= [1:1문의 등록처리] =======================
	public void insertInquiry(MultipartHttpServletRequest request,HttpServletResponse response, Model model) 
			throws ServletException, IOException;
	
	

}
