package com.spring.nardrak_mvc.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.spring.nardrak_mvc.dto.FavoriteDTO;

public interface FavoriteService {

	
	// ======================= [선호 여행지 정보등록] =======================
	public void favoriteAction(HttpServletRequest request,HttpServletResponse response,Model model)  
		    throws ServletException, IOException;
	
	// ======================= [선호 여행지 목록 조회] =======================
	public List<FavoriteDTO> favoriteList(HttpServletRequest request,HttpServletResponse response,Model model)  
			throws ServletException, IOException;

}
