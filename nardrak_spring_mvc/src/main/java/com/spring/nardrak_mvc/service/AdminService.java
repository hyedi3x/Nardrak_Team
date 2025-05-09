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
		public void uniqueCheck(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException;
		
		// 로그인 성공 처리 페이지
		public void loginResult(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException;
		
		// 관리자 수정
		public void adminModifyAction(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException;
		
		// 관리자 삭제
				public void adminDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
						throws ServletException, IOException;
		// 관리자 요청 조회
		public void adminAccess(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException;

		// 관리자 요청 승인
		public void adminAccessAction(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException;
		
		// 탈퇴 요청 30일 지난 회원 삭제
		public void customerDelete(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException;
		
		// 탈퇴 요청 30일 지난 관리자 삭제
		public void adminDelete(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException;
}
