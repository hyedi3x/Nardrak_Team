package com.spring.nardrak_mvc.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface AdminService {
	
		// 아이디 중복 확인
		public void adminIdConfirm(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException;

		// 관리자 회원가입
		public void adminSignUpAction(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException;

}
