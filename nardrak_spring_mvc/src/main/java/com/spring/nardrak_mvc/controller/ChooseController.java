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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.nardrak_mvc.service.ChooseService;

@Controller
public class ChooseController {

	@Autowired
	private ChooseService service;

	private final Logger logger = LoggerFactory.getLogger(ChooseController.class);

	// ==================== [ 선호 여행지 선택 홈페이지] =======================
	@RequestMapping("/choose.ch")
	public String choose(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<< url - choose.ch >>");

		service.ChooseList(request, response, model);

		return "customer/choose/choose";
	}


	// ==================== [ 선호 여행지 목록 확인(관리자)] =======================
	  
	@RequestMapping("/ChooseDetail.ch") 
	public String locationDetailPage(HttpServletRequest request, HttpServletResponse response,
	Model model) throws ServletException, IOException{
	logger.info("url => ChooseDetail.ch");
	  
	  
	return "customer/choose/chooseDetail"; 
	
	}
	
	// 추천여행지 상세정보 데이터 등록 처리
	@RequestMapping("/addChooseDetailAction.ch")
	public String addTourAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		logger.info("url => addLocalAction.ch");
		
		service.ChooseAction(request, response, model);
		
		return "customer/choose/choose";
	}

	// 추천여행지 상세 페이지
	@RequestMapping("/chooseDetailPage.ch")
	public String chooseDetailPage(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		logger.info("url => addLocalAction.ch");
		
		service.ChooseInfo(request, response, model);
		
		return "customer/choose/chooseDetailPage"; 
	}
	
}