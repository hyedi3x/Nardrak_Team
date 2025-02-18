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

import com.spring.nardrak_mvc.service.LocalService;

@Controller
public class LocalController {
	
	@Autowired
	private LocalService service;
	
	private final Logger logger = LoggerFactory.getLogger(LocalController.class);
	
	// 국내여행 페이지
	@RequestMapping("/local.tr")
	public String local(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		logger.info("url => local.tr");
		
		return "customer/local/local";
	}
	
	// 국내여행 상세정보 등록페이지
	@RequestMapping("/locationDetail.tr")
	public String locationDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		logger.info("url => locationDetail.tr");
		
		return "customer/local/locationDetail";
	}
	
	// 국내여행 상세정보 데이터 등록 처리
	@RequestMapping("/addLocationDetailAction.tr")
	public String addTourAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		logger.info("url => addLocalAction.tr");
		
		service.addTour(request, response, model);
		
		return "customer/local/local";
	}
	
	// 국내여행 상세정보 페이지
	@RequestMapping("/locationDetailPage.tr")
	public String locationDetailPage(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		logger.info("url => locationDetailPage.tr");
		
		return "customer/local/locationDetailPage";
	}

}
