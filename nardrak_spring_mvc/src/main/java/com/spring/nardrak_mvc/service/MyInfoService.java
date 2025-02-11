package com.spring.nardrak_mvc.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface MyInfoService {

	// ======================= [마이페이지 dto 정보 가져오기] =======================
	public void myInfo(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// ======================= [마이페이지 - 수정/삭제 페이지 진입 전 비밀번호 확인(인증) 처리 페이지] =======================
	public void pwdChk(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}
