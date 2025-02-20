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

import com.spring.nardrak_mvc.service.AdminService;

@Controller
public class trableController {
	
	private static final Logger logger = LoggerFactory.getLogger(trableController.class);
	
	// ======================= [ 선호 여행지 선택 홈페이지] =======================
	@RequestMapping("/choose.tr")
    public String choose(HttpServletRequest request,HttpServletResponse response , Model model) 
			throws ServletException, IOException {
		logger.info("<< url - choose.tr >>");
        
        return "customer/choose/choose";
     }
	
}