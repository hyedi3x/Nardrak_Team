package com.spring.nardrak_mvc.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface CustomerService {
	
	// ======================= [ID 중복확인 처리] =======================
	public void inConfirmAction(HttpServletRequest request,HttpServletResponse response, Model model) 
	         throws ServletException, IOException;

	// ======================= [로그인 성공 처리 페이지] =======================
	public void loginResult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	

}
