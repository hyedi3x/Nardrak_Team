package com.spring.nardrak_mvc.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ImageUploadService {
	
	// 이미지 업로드 처리
	public void uploadImage(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 현재 등록된 사진 가져오기
	public void getImages(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 이미지 수정 처리
	public void updateImage(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;

	// 이미지 삭제 처리
	public void deleteImage(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}
