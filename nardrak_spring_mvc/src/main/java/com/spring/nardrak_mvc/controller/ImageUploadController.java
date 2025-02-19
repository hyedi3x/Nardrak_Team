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

import com.spring.nardrak_mvc.service.ImageUploadService;

@Controller
public class ImageUploadController {
	
	@Autowired
	private ImageUploadService service;

	private static final Logger logger = LoggerFactory.getLogger(ImageUploadController.class);
	
	// 사진 등록 및 수정 페이지
	@RequestMapping("/uploadImage.do")
	public String editUploadImage(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException{
		
		logger.info("<< url : editUploadImage.do >>" );
		
		service.getImages(request, response, model);
		
		return "admin/imageUP/imageUpload";
	}
	
	// 사진 등록 및 수정 처리
	@RequestMapping("/uploadImageAction.do")
	public String uploadImageAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		
		logger.info("<< url : uploadImageAction.do >>" );
		
		service.uploadImage(request, response, model);  // Service에서 업로드 처리
		
		return "redirect:/main.do";
	}
	
	// 이미지 수정 처리
	@RequestMapping("/updateImage.do")
	public String updateImage(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
		logger.info("<< url : updateImage.do >>");
		
		service.updateImage(request, response, model);  // Service에서 수정 처리
		
		return "redirect:/main.do";  // 수정 후 다시 이미지 관리 페이지로 리디렉션
	}
	
	// 이미지 삭제 처리
	@RequestMapping("/deleteImage.do")
	public String deleteImage(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
		logger.info("<< url : deleteImage.do >>");
		
		service.deleteImage(request, response, model);  // Service에서 삭제 처리
		
		return "redirect:/main.do";  // 삭제 후 다시 이미지 관리 페이지로 리디렉션
	}
}
