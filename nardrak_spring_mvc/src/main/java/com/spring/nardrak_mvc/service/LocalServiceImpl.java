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
	
	// ======================= [국내 여행지 정보 추가] =======================
	@Override
	public void addTour(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("LocalSerivceImpl - addTour()");
		
		 // 업로드된 이미지 파일을 MultipartFile 객체로 가져옴
        MultipartFile file = request.getFile("local_image");
		
		// 저장될 디렉토리 경로 설정 (서버의 resources/upload/admin 폴더)
        String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/local/");
        
        // 로컬 디스크에서 사용할 경로 설정
        String realDir = "D:\\Git\\Nardrak_Team\\nardrak_spring_mvc\\src\\main\\webapp\\resources\\upload\\local\\";
		
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
        	
            dto.setLocal_title(request.getParameter("local_title"));
            dto.setRegion(request.getParameter("region"));
            dto.setDescription(request.getParameter("description"));
            dto.setLocal_tags(request.getParameter("local_tags"));
            dto.setLocal_detail(request.getParameter("local_detail"));
            String localImage = "/resources/upload/local/" + file.getOriginalFilename();
            dto.setLocal_image(localImage);
            dto.setLatitude(Double.parseDouble(request.getParameter("latitude")));
            dto.setLongitude(Double.parseDouble(request.getParameter("longitude")));
            
            dao.InsertTour(dto);
            
        }catch(Exception e) {
        	e.printStackTrace();
        }
	}
	
	// ======================= [국내 여행지 정보 목록 조회] =======================
	@Override
   public void localList(HttpServletRequest request, HttpServletResponse response, Model model)
         throws ServletException, IOException {
      System.out.println("LocalSerivceImpl - localList()");
   
      // 화면에서 입력받은값 파라미터로 담기
      String pageNum = request.getParameter("pageNum");
      
      String region = request.getParameter("region");
      
      Paging paging = new Paging(pageNum);
      
      // 지역정보 개수
      int total = 0;
      if(region == null || region.isEmpty()) {
    	  total = dao.localCnt();
      }
      else {
    	  total = dao.regionLocalCnt(region);	// 특정 지역에 있는 국내 여행지 전체 개수 조회
      }
      
      // 지역정보 목록
      paging.setTotalCount(total);
      
      int start = paging.getStartRow();
      int end = paging.getEndRow();
      
      // MAP
      Map<String,Object> map = new HashMap<String,Object>();
      map.put("start", start);
      map.put("end", end);
      if (region != null && !region.isEmpty()) {
          map.put("region", region);
      }
      
      List<LocalDTO> list = dao.localList(map);
      
      model.addAttribute("paging", paging);
      model.addAttribute("locals", list);
      model.addAttribute("selectedRegion", region);
   }

	// ======================= [국내 여행지 상세정보(1건) 조회] =======================
	@Override
	public void localInfo(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("LocalSerivceImpl - localInfo()");
		
		// queryString값으로 받아온 PK값
		String local_title = request.getParameter("local_title");
		
		LocalDTO dto = null;
		
		// 받아온 PK값이 존재하면 dao로 보내서 국내 여행지 정보를 조회(1건)
		if(local_title != null) {
			dto = dao.localInfo(local_title);
		}
		
		model.addAttribute("dto", dto);
	}
	
	// ======================= [여행지 이름 유니크 값 체크] =======================
   @Override
   public void checkTitle(HttpServletRequest request, HttpServletResponse response, Model model)
         throws ServletException, IOException {
      System.out.println("CustomerSerivceImpl - checkTitle()");
      
       String local_title = request.getParameter("value");
       System.out.println(local_title);
       int count = 0;
       count = dao.checkTitle(local_title);
       
       // JSON 문자열을 직접 생성
       String jsonResponse = "{ \"count\": " + count + " }"; // JSON 형식의 문자열을 저장 

       response.setContentType("application/json");
       response.setCharacterEncoding("UTF-8");
       response.getWriter().write(jsonResponse);
   }
	
// 국내 여행지 수정
	@Override
	public void modifyTour(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
		// 기존 이미지 주소
		String originImage = request.getParameter("originImage");
		// 저장할 이미지 주소
		String saveImage = "";
		
		 // 사용자가 업로드한 파일을 MultipartFile 객체로 저장
        MultipartFile file = request.getFile("local_image");
        System.out.println("file : "+ file);
        
		// 서버에서 저장될 디렉토리 경로 설정 (서버의 resources/upload/local 폴더)
        String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/local");
        System.out.println("saveDir : "+ saveDir);
        
        // 로컬 디스크에서 사용할 경로 설정
        String realDir = "D:\\Git\\Nardrak_Team\\nardrak_spring_mvc\\src\\main\\webapp\\resources\\upload\\local\\";
		
        // 파일 입출력을 위한 스트림 초기화
        FileInputStream fis = null;
        FileOutputStream fos = null;
        
		//상세페이지에 있는 이미지를 수정할 경우, 기존 try ~ finally (끝까지) 잘라서 if문 내부에 넣기
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			try {
				file.transferTo(new File(saveDir + file.getOriginalFilename())); // File 객체는 java.io에 있다.
				fis = new FileInputStream(saveDir + file.getOriginalFilename());
				fos = new FileOutputStream(realDir + file.getOriginalFilename());
				saveImage = "/resources/upload/local/"+file.getOriginalFilename();
				int data = 0;
				while((data = fis.read()) != -1) { // .read()가 더 이상 읽을 데이터가 없으면 -1을 반환
					fos.write(data);
				}
				
			} catch(IOException e){
				e.printStackTrace();
			} finally {
				if(fis != null) fis.close();
				if(fos != null) fos.close();
			}
			
		}
		else { //추가
			
			// 기존 이미지 사용 (이미지 수정 안할 경우)
			saveImage = originImage;
			System.out.println("local_image1: "+ originImage);
		}
            
            LocalDTO dto = new LocalDTO();
        	
            dto.setLocal_title(request.getParameter("local_title"));
            dto.setRegion(request.getParameter("region"));
            dto.setDescription(request.getParameter("description"));
            dto.setLocal_tags(request.getParameter("local_tags"));
            dto.setLocal_detail(request.getParameter("local_detail"));
            String localImage = saveImage;
            dto.setLocal_image(localImage);
            dto.setLatitude(Double.parseDouble(request.getParameter("latitude")));
            dto.setLongitude(Double.parseDouble(request.getParameter("longitude")));
            
            dao.updateTour(dto);
	}

}
