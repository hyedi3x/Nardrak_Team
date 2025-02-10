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
		// 유니크 값 체크
<<<<<<< HEAD
		public void uniqueCheck(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException;
		
		// 로그인 성공 처리 페이지
		public void loginResult(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException;
		
=======
				public void uniqueCheck(HttpServletRequest request, HttpServletResponse response, Model model)
						throws ServletException, IOException;
		
		// 관리자 수정/삭제 비밀번호 확인
		public void adminModify(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException;
		
		// 관리자 수정
		public void adminModifyAction(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException;
<<<<<<< HEAD
>>>>>>> 2d2a0f7 ([feat] 관리자 등록, 수정 페이지 관련)
=======
>>>>>>> origin/admin_modify_dev1
}
