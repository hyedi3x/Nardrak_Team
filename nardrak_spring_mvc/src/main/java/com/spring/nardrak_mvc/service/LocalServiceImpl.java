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

import com.spring.nardrak_mvc.dao.LocalDAO;
import com.spring.nardrak_mvc.dto.LocalDTO;
import com.spring.nardrak_mvc.page.Paging;

@Service
public class LocalServiceImpl implements LocalService {
	
	@Autowired
	private LocalDAO dao;
	
	// 관광지 정보 추가
	@Override
	public void addTour(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
		 // 업로드된 이미지 파일을 MultipartFile 객체로 가져옴
        MultipartFile file = request.getFile("local_image");
		
		// 저장될 디렉토리 경로 설정 (서버의 resources/upload/admin 폴더)
        String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/local/");
        
        // 로컬 디스크에서 사용할 경로 설정
        String realDir = "D:\\Git\\Nardrak_Team\\nardrak_spring_mvc\\src\\main\\webapp\\resources\\upload\\local";
		
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
            
            LocalDTO dto = new LocalDTO();
        	
            dto.setLocalTitle(request.getParameter("local_title"));
            dto.setRegion(request.getParameter("region"));
            dto.setDescription(request.getParameter("description"));
            dto.setTags(request.getParameter("local_tags"));
            dto.setLocalDetail(request.getParameter("local_detail"));
            String localImage = "/resources/upload/local" + file.getOriginalFilename();
            dto.setLocalImage(localImage);
            dto.setLatitude(Double.parseDouble(request.getParameter("latitude")));
            dto.setLongitude(Double.parseDouble(request.getParameter("longitude")));
            dto.setApi_name(request.getParameter("api_name"));
            
            dao.InsertTour(dto);
            
        }catch(Exception e) {
        	e.printStackTrace();
        }
	}
	
	@Override
   // ======================= [지역정보 목록 조회] =======================
   public void localList(HttpServletRequest request, HttpServletResponse response, Model model)
         throws ServletException, IOException {
      System.out.println("CustomerSerivceImpl - nextPage()");
   
      // 화면에서 입력받은값 파라미터로 담기
      String pageNum = request.getParameter("pageNum");
      
      Paging paging = new Paging(pageNum);
      
      // 지역정보 개수
      int total = dao.localCnt();
      
      // 지역정보 목록
      paging.setTotalCount(total);
      
      int start = paging.getStartRow();
      int end = paging.getEndRow();
      
      // MAP
      Map<String,Object> map = new HashMap<String,Object>();
      map.put("start", start);
      map.put("end", end);
      
      List<LocalDTO> list = dao.localList(map);
      
      model.addAttribute("paging", paging);
      model.addAttribute("locals", list);
   }
	
}
