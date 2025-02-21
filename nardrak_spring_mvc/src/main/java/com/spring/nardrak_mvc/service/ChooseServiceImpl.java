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
import com.spring.nardrak_mvc.dto.ChooseDTO;


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
        String realDir = "D:\\Git\\Nardrak_Team\\nardrak_spring_mvc\\src\\main\\webapp\\resources\\upload\\choose\\";
        
        String originalName = file.getOriginalFilename(); // 원래 파일 이름
        String extension = ""; // 확장자
        int lastDot = originalName.lastIndexOf(".");
        
        if(lastDot > 0) {
        	extension = originalName.substring(lastDot);
        	originalName = originalName.substring(0, lastDot);
        }
        
        // 중복되지 않는 파일 이름
        String newName = originalName + extension;
        int count = 1;
        File newFile = new File(saveDir + newName);
        while(newFile.exists()) {
        	newName = originalName + "(" + count + ")" + extension;
        	newFile = new File(saveDir + newName);
        	count++;
        }
		
        // 파일 입출력을 위한 스트림 초기화
        FileInputStream fis = null;
        FileOutputStream fos = null;
        
        try {
        	// 업로드된 파일을 서버의 지정된 디렉토리에 저장
            file.transferTo(newFile);

            // 저장된 파일을 로컬 디스크로 복사하기 위한 입력, 출력 스트림 초기화
            fis = new FileInputStream(newFile);
            fos = new FileOutputStream(realDir + newName);

            // 파일 내용을 한 바이트씩 읽고 로컬 파일에 복사
            int data = 0;
            while ((data = fis.read()) != -1) { // 파일 끝까지 읽기
                fos.write(data); // 파일을 로컬에 저장
            }
            
            ChooseDTO dto = new ChooseDTO();
        	
            dto.setCh_title1(request.getParameter("ch_title1"));
            dto.setCh_title2(request.getParameter("ch_title2"));
            String chooseImage = "/resources/upload/choose/" + newName;
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
      
      model.addAttribute("list", list);  
   }

	// ==================== [국내 여행지 상세정보] ===================
	@Override
	public void ChooseInfo(HttpServletRequest request, HttpServletResponse reponse, Model model)
			throws ServletException, IOException {
		System.out.println("ChooseServiceImpl - ChooseInfo() ");
		
		// 쿼리 스트링으로 받은아온 pk값전달
		int ch_num = Integer.parseInt(request.getParameter("ch_num"));
		
		ChooseDTO dto = null;
		
		// 쿼리 스트링으로 받아온 pk값이 있다면 상세정보 조회
		if(ch_num > 0) {
			dto = dao.chooseInfo(ch_num);
		}
		
		// dto에 담아 전달
		model.addAttribute("dto", dto);
	}

	// ==================== [국내 여행지 상세정보 수정] ===================
	@Override
	public void modifyUpdate(MultipartHttpServletRequest request, HttpServletResponse reponse, Model model)
			throws ServletException, IOException {
	
		// 기존 이미지 주소
		String ch_title1 = request.getParameter("hidden_title1");
		int ch_num = Integer.parseInt(request.getParameter("ch_number"));
		
		// 저장할 이미지 주소
		String chImage = "";
		
		// 업로드한 파일을 MultipartFile 객체로 저장
		MultipartFile file = request.getFile("ch_image");
		System.out.println("file :" +  file);
		
		// 서버에 저장될 디렉토리 경로 설정
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/choose");
		
		// 로컬 디크스 경로
		String localDir = "D:\\Git\\Nardrak_Team\\nardrak_spring_mvc\\src\\main\\webapp\\resources\\upload\\choose\\";
		
		String originalName = file.getOriginalFilename(); // 원래 파일 이름
        String extension = ""; // 확장자
        int lastDot = originalName.lastIndexOf(".");
        
        if(lastDot > 0) {
        	extension = originalName.substring(lastDot);
        	originalName = originalName.substring(0, lastDot);
        }
        
        // 중복되지 않는 파일 이름
        String newName = originalName + extension;
        int count = 1;
        File newFile = new File(saveDir + newName);
        while(newFile.exists()) {
        	newName = originalName + "(" + count + ")" + extension;
        	newFile = new File(saveDir + newName);
        	count++;
        }
		
		// 파일 입출력을 위한 스트림 초기화
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		// 상세페이지에 있는 이미지 수정할경우 기존 try문을 잘라서 if문 내부에 넣기
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			try {
				// 업로드된 파일을 서버의 지정된 디렉토리에 저장
            	file.transferTo(newFile);
            	
            	// 저장된 파일을 로컬 디스크로 복사하기 위한 입력, 출력 스트림 초기화
                fis = new FileInputStream(newFile);
                fos = new FileOutputStream(localDir + newName);
                
				int data = 0;
				while((data = fis.read()) != -1) { // .read()가 더 이상 읽을 데이터가 없으면 -1을 반환
					fos.write(data);
				}
				
				chImage = "/resources/upload/choose/" + newName;
			} catch(IOException e){
				e.printStackTrace();
			} finally {
				if(fis != null) fis.close();
				if(fos != null) fos.close();
			}
			
		}
		else { 
			// 기존 이미지 사용(이미지 수정 없을경우 기존꺼 사용)
			chImage = ch_title1;
			System.out.println("ch_image" + ch_title1);
		}
		
		ChooseDTO dto = new ChooseDTO();
		
		dto.setCh_num(ch_num);
		dto.setCh_title1(request.getParameter("ch_title1"));
        dto.setCh_title2(request.getParameter("ch_title2"));
        String ch_image = chImage;
        dto.setCh_image(ch_image);
        dto.setCh_tags1(request.getParameter("ch_tags1"));
        dto.setCh_tags2(request.getParameter("ch_tags2"));
        dto.setCh_detail(request.getParameter("ch_detail"));
        
        dao.updateChoose(dto);
	}
}
