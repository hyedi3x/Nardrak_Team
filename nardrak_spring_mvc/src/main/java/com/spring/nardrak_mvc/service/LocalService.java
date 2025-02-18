package com.spring.nardrak_mvc.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface LocalService {

	// 관광지 정보 추가
	public void addTour(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException;
	
	// ======================= [지역정보 목록 조회] =======================
	public void localList(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException;
}
