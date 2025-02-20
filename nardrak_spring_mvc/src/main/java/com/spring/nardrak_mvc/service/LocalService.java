package com.spring.nardrak_mvc.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface LocalService {

	// ======================= [국내 여행지 정보 추가] =======================
	public void addTour(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException;
	
	// ======================= [국내 여행지 정보 목록 조회] =======================
	public void localList(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException;
	
	// ======================= [국내 여행지 상세정보(1건) 조회] =======================
	public void localInfo(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// ======================= [여행지 이름 유니크 값 체크] =======================
    public void checkTitle(HttpServletRequest request, HttpServletResponse response, Model model)
          throws ServletException, IOException;
}
