package com.spring.nardrak_mvc.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface FavoriteService {

	
	// ======================= [선호 여행지 정보등록] =======================
	public void favoriteAction(HttpServletRequest request,HttpServletResponse response,Model model)  
		    throws ServletException, IOException;
	

}
