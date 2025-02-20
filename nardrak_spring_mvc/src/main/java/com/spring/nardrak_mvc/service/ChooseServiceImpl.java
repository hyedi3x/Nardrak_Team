package com.spring.nardrak_mvc.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.nardrak_mvc.dao.ChooseDAO;
import com.spring.nardrak_mvc.dao.LocalDAO;
import com.spring.nardrak_mvc.dto.ChooseDTO;
import com.spring.nardrak_mvc.dto.LocalDTO;
import com.spring.nardrak_mvc.page.Paging;

@Service
public class ChooseServiceImpl implements ChooseService {
	
	@Autowired
	private ChooseDAO dao;
	
	// ======================= [국내 여행지 정보 추가] =======================
	@Override
	public void ChooseAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
		 // 업로드된 이미지 파일을 MultipartFile 객체로 가져옴
        MultipartFile file = request.getFile("ch_image");
		
		// 저장될 디렉토리 경로 설정 (서버의 resources/upload/choose 폴더)
        String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/choose/");
        
        // 로컬 디스크에서 사용할 경로 설정
        String realDir = "D:\\DEV\\git\\Nardrak_Team\\nardrak_spring_mvc\\src\\main\\webapp\\resources\\upload\\choose\\";
		
        // 파일 입출력을 위한 스트림 초기화
        FileInputStream fis = null;
        FileOutputStream fos = null;
        
        try {
        	file.transferTo(new File(saveDir + file.getOriginalFilename()));
        	
        	// 저장된 파일을 로컬 디스크로 복사하기 위한 입력, 출력 스트림 초기화
            fis = new FileInputStream(saveDir + file.getOriginalFilename());
            fos = new FileOutputStream(realDir + file.getOriginalFilename());

            // 파일 내용을 한 바이트씩 읽고 로컬 파일에 복사
            int data = 0;
            while ((data = fis.read()) != -1) { // 파일 끝까지 읽기
                fos.write(data); // 파일을 로컬에 저장
            }
            
            ChooseDTO dto = new ChooseDTO();
        	

            dto.setCh_title1(request.getParameter("ch_title1"));
            dto.setCh_title2(request.getParameter("ch_title2"));
            String chooseImage = "/resources/upload/choose/" + file.getOriginalFilename();
            dto.setCh_image(chooseImage);
            dto.setCh_tags1(request.getParameter("ch_tags1"));
            dto.setCh_tags2(request.getParameter("ch_tags2"));
            dto.setCh_detail(request.getParameter("ch_detail"));
            
            dao.InsertChoose(dto);
            
        }catch(Exception e) {
        	e.printStackTrace();
        }
	}
	
	@Override
	// ======================= [추천여행지 목록 조회] =======================
   public void ChooseList(HttpServletRequest request, HttpServletResponse response, Model model)
         throws ServletException, IOException {
      System.out.println("ChooseServiceImpl - ChooseList()");

	  List<ChooseDTO> list = dao.ChooseList();
      System.out.println(list);
      
      model.addAttribute("list", list);  
   }

	// ==================== [국내 여행지 상세정보] ===================
	@Override
	public void ChooseInfo(HttpServletRequest request, HttpServletResponse reponse, Model model)
			throws ServletException, IOException {
		System.out.println("ChooseServiceImpl - ChooseInfo() ");
		
		// 쿼리 스트링으로 받은아온 pk값전달
		String ch_title1 = request.getParameter("ch_title1");
		
		ChooseDTO dto = null;
		
		// 쿼리 스트링으로 받아온 pk값이 있다면 상세정보 조회
		if(ch_title1 != null) {
			dto = dao.chooseInfo(ch_title1);
		}
		
		// dto에 담아 전달
		model.addAttribute("dto", dto);
	}

}
