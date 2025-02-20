package com.spring.nardrak_mvc.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.nardrak_mvc.dto.ChooseDTO;

public interface ChooseService {

	// =================== [국내 여행지 정보 추가] =======================
	public void ChooseAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException;
	
	// ==================== [국내 여행지 정보 목록 조회] ===================
	public void ChooseList(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException;
	
	// ==================== [국내 여행지 상세정보] ===================
	public void ChooseInfo(HttpServletRequest request, HttpServletResponse reponse, Model model)
		throws ServletException, IOException;
}
