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
	
	// ==================== [ 선호 여행지 선택 홈페이지] =======================
	@RequestMapping("/choose.fa")
    public String choose(HttpServletRequest request,HttpServletResponse response , Model model) 
			throws ServletException, IOException {
		logger.info("<< url - choose.tr >>");
        
        return "customer/choose/choose";   
     }
	
	// ======================= [선호 여행지 정보등록] =======================
	@RequestMapping("/choose.fa")
	public String favorite(HttpServletRequest request,HttpServletResponse response , Model model)
			throws ServletException, IOException{
		logger.info("<< url = favorite.fa");
		
		 // 선호 여행지 추가/해제 로직을 Service에 위임
        service.favoriteAction(request,response,model);
			
        // 선호 여행지 처리 후, 'choose' 페이지로 이동
        return "customer/choose/choose"; 
    }
		
	// ==================== [ 꽃따라 봄 이미지 클릭 페이지 이동] =======================
	@RequestMapping("/mySwiper1-1.fa")
    public String mySwiper1_1(HttpServletRequest request,HttpServletResponse response , Model model) 
			throws ServletException, IOException {
		logger.info("<< url - Seoul.fa >>");
        
        return "customer/choose/mySwiper1-1";   
	}
	
	// ==================== [ 꽃따라 봄 이미지 클릭 페이지 이동] =======================
	@RequestMapping("/mySwiper1-2.fa")
    public String mySwiper1_2(HttpServletRequest request,HttpServletResponse response , Model model) 
			throws ServletException, IOException {
		logger.info("<< url - mySwiper1-2.fa >>");
        
        return "customer/choose/mySwiper1-2";   
	}
		
	// ==================== [ 꽃따라 봄 이미지 클릭 페이지 이동] =======================
	@RequestMapping("/mySwiper1-3.fa")
    public String mySwiper1_3(HttpServletRequest request,HttpServletResponse response , Model model) 
			throws ServletException, IOException {
		logger.info("<< url - mySwiper1-3 >>");
        
        return "customer/choose/mySwiper1-3";   
	}	

	// ==================== [ 꽃따라 봄 이미지 클릭 페이지 이동] =======================
	@RequestMapping("/mySwiper1-4.fa")
    public String mySwiper1_4(HttpServletRequest request,HttpServletResponse response , Model model) 
			throws ServletException, IOException {
		logger.info("<< url - mySwiper1-4 >>");
        
        return "customer/choose/mySwiper1-4";   
		}
}