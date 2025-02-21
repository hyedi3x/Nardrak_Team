package com.spring.nardrak_mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.nardrak_mvc.service.FavoriteService;

@Controller
public class FavoriteController {
	
	@Autowired
	private FavoriteService service;
	
	private static final Logger logger = LoggerFactory.getLogger(FavoriteController.class);
	
	// ==================== [ 고객이 찜한 여행지 목록 조회 - ajax ] =======================
	@RequestMapping("/getFavoriteList.fa")
	public String getFavoriteList(HttpServletRequest request,HttpServletResponse response , Model model) 
			throws ServletException, IOException{
		logger.info("<< url - getFavoriteList.fa >>");
		
		service.favoriteList(request, response, model);
	
		return "customer/choose/choose";
	}
	
	// ======================= [선호 여행지 목록 조회] =======================
	@RequestMapping("/getUserFavorites.fa")
	public String getUserFavorites(HttpServletRequest request,HttpServletResponse response , Model model)
			throws ServletException, IOException{
		logger.info("<< url = getUserfavorites.fa");
		
		// 선호 여행지 추가/해제 로직을 Service에 위임
		service.favoriteList(request,response,model);
		
		// 선호 여행지 처리 후, 'choose' 페이지로 이동
		return "customer/choose/choose"; 
	}
	
	// ======================= [선호 여행지 정보등록] =======================
	@RequestMapping("/favorite.fa")
	public String favorite(HttpServletRequest request,HttpServletResponse response , Model model)
			throws ServletException, IOException{
		logger.info("<< url = favorite.fa");
		
		 // 선호 여행지 추가/해제 로직을 Service에 위임
        service.favoriteAction(request,response,model);
			
        // 선호 여행지 처리 후, 'choose' 페이지로 이동
        return "customer/choose/choose"; 
    }
		
}