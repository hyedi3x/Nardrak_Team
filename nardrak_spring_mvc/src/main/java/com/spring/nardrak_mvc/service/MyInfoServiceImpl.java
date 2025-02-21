package com.spring.nardrak_mvc.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.nardrak_mvc.dao.MyInfoDAO;
import com.spring.nardrak_mvc.dto.AdminDTO;
import com.spring.nardrak_mvc.dto.CustomerDTO;
import com.spring.nardrak_mvc.dto.InquiryDTO;
import com.spring.nardrak_mvc.paging.AdminPaging;

@Service
public class MyInfoServiceImpl implements MyInfoService{

	@Autowired
	private MyInfoDAO dao;

	@Override
	// ======================= [마이페이지 dto 정보 가져오기] =======================
	public void myInfo(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("MyInfoServiceImpl - myInfo()");
		
		// -------------[3단계] 화면에서 입력받은 값을 가져와서 파라미터로 담기 -------------
		// 3-1단계. 세션에 저장된 ID를 가져와서 strId 변수에 담는다. 
		String strId = (String)request.getSession().getAttribute("sessionID");
		
		// 관리자 수정 페이지에서 접근하면, get 방식으로 strId와 pwd가 넘어온다.
		if(request.getParameter("strId") != null) {
			strId = request.getParameter("strId");
		}

		// -------------[4단계] - 전역변수로 dto 선언-------------
		// -------------[5단계] 세션 정보 조회-------------
		// 세션 ID에 해당하는 dto 값들을 dao.MemberSelect 함수를 통해 info 변수에 저장한다. 
		CustomerDTO dtoCS = dao.memberSelectCS(strId);
		AdminDTO dtoAD = dao.memberSelectAD(strId);
		
		// -------------[6단계] jsp로 처리 결과 전달-------------
		model.addAttribute("dtoCS", dtoCS);
		model.addAttribute("dtoAD", dtoAD);
		
	}

	@Override
	// ======================= [마이페이지 - 수정/삭제 페이지 진입 전 비밀번호 확인(인증) 처리 페이지] =======================
	public void pwdChk(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("MyInfoServiceImpl - pwdChk()");

		// -------------[3단계] 화면에서 입력받은 값을 가져와서 파라미터로 담기 -------------
		// 3-1단계. 세션에 저장된 ID를 가져와서 strId 변수에 담는다. 
		String strId = (String)request.getSession().getAttribute("sessionID");
		
		// 3-2단계. 화면에서 입력받은 비밀번호를 strPwd에 변수에 담는다. 
		String strPwd = request.getParameter("user_pwd");
		
		// 관리자 수정 페이지에서 접근하면, get 방식으로 strId와 pwd가 넘어온다
		// 관리자 승인에서는 admin_id, admin_pwd가 넘어오고 회원 삭제에서는 user_id로 넘어온다.
		if(request.getParameter("admin_id") != null) {
			strId = request.getParameter("admin_id");
			strPwd = request.getParameter("admin_pwd");
			
			model.addAttribute("admin_id", strId);
		}
		if(request.getParameter("user_id") != null) {
			strId = request.getParameter("user_id");

			model.addAttribute("user_id", strId);
		}
		
		System.out.println("strId"+strId);
		System.out.println("strpwd"+strPwd);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("strId", strId);   // key, value
		map.put("strPwd", strPwd);
		
		// -------------[4단계] - 전역변수로 선언-------------
		// -------------[5단계]비밀번호 인증 처리-------------
		// 아이디와 비밀번호가 일치하는지 userIdPwdChk 메서드 실행후 결과값을 pwdChkCnt 변수에 담는다.
		int pwdChkCnt = dao.userPwdChk(map);
		
		
		// -------------[6단계] jsp로 처리 결과 전달-------------
		model.addAttribute("pwdChkCnt", pwdChkCnt);
	}	
	
    //======================= [ 1:1문의 등록 처리 ] =======================
	@Override
	public void insertInquiry(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
	        throws ServletException, IOException {

	    System.out.println("MyInfoServiceImpl - insertInquiry()");
	    
	    // 세션에서 사용자 ID 가져오기
	    String strId = (String) request.getSession().getAttribute("sessionID");
	    
	    // 업로드된 파일 가져오기
	    MultipartFile file = request.getFile("i_imgUpload");

	    // 저장될 경로 설정
	    String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/myInfo/myInfo_Inquiry/");
	    String realDir = "D:\\Git\\Nardrak_Team\\nardrak_spring_mvc\\src\\main\\webapp\\resources\\upload\\myInfo\\myInfo_Inquiry\\";
	    
	    // 저장할 디렉토리가 존재하지 않으면 생성
	    File saveDirectory = new File(saveDir);
	    if (!saveDirectory.exists()) {
	        saveDirectory.mkdirs();
	    }
	    
	    // 원본 파일명 및 확장자 분리
	    String originalFileName = file.getOriginalFilename();   // getOriginalFilename : 기존 파일명 추출
	    String fileExtension = "";   // 확장자를 저장할 변수 선언(초기화)
	    int dotIndex = originalFileName.lastIndexOf(".");    // lastIndexOf : 파일명에서 마지막 .(점)의 위치 인덱스로 반환, 확장자가 있으면 1이상 값 반환
	    
	    // 확장자가 없는 경우(즉, dotIndex == -1) 실행되지 않도록 방지
	    if (dotIndex > 0) {
	        fileExtension = originalFileName.substring(dotIndex); // 확장자 추출후 저장 
	        originalFileName = originalFileName.substring(0, dotIndex); // 파일명 전체(0번부터)에서 확장자 제외한 파일명 추출
	    }
	    
	    // 중복되지 않는 파일명 생성
	    String newFileName = originalFileName + fileExtension;
	    int count = 1;
	    File newFile = new File(saveDir + newFileName);
	    while (newFile.exists()) {   // 동일한 파일명이 존재할 때
	        newFileName = originalFileName + "(" + count + ")" + fileExtension;
	        newFile = new File(saveDir + newFileName);
	        count++;
	    }
	    
	    // 파일을 지정된 경로에 저장
	    file.transferTo(newFile);
	    
	    // 저장된 파일을 실제 경로에도 복사
	    try (FileInputStream fis = new FileInputStream(newFile);   // 파일을 읽기 위한 스트림을 생성
	         FileOutputStream fos = new FileOutputStream(realDir + newFileName)) {    // 파일을 쓰기 위한 스트림을 생성

	        int data;
	        while ((data = fis.read()) != -1) {  // fis.read() → 파일에서 1바이트씩 데이터를 읽음, 파일 끝이 -1이 되기 전까지만 읽음 
	            fos.write(data);   // 읽은 데이터를 출력 스트림(fos)을 통해 새 파일에 씀
	        }
	    }
	    
	    // DTO 객체 생성 후 데이터 설정
	    InquiryDTO dto = new InquiryDTO();
	    dto.setCs_id(strId); // 사용자 ID 설정
	    dto.setI_title(request.getParameter("i_title")); // 문의 제목 설정
	    
	    // 선택한 문의 유형 설정
	    String category = String.join(", ", 
	        request.getParameter("i_category1"), 
	        request.getParameter("i_category2"));
	    dto.setI_category(category);
	    
	    dto.setI_content(request.getParameter("i_content")); // 문의 내용 설정
	    
	    // DB에 저장할 이미지 파일 경로 설정
	    String p_img = "/resources/upload/myInfo/myInfo_Inquiry/" + newFileName;
	    dto.setI_imgUpload(p_img);
	    
	    // 문의 데이터 저장
	    int inquiryImgs = dao.insertInquiry(dto);
	    model.addAttribute("inquiryImgs", inquiryImgs);
	}

	
	@Override
	// ======================= [1:1 문의 내역 불러오기] =======================
	public void inquiryResponse(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("MyInfoServiceImpl - inquiryResponse()");

		// -------------[3단계] 화면에서 입력받은 값을 가져와서 파라미터로 담기 -------------
		// 3-1단계. 세션에 저장된 ID를 가져와서 strId 변수에 담는다. 
		String strId = (String)request.getSession().getAttribute("sessionID");
		
		// 페이지 번호 파라미터 가져오기
	    String pageNum = request.getParameter("page");
	    AdminPaging paging = new AdminPaging(pageNum);
	    
	    // 답변여부 상태를 불러옴 
	    String status = request.getParameter("status");

	    // 전체 게시글 수 설정
	    Map<String, Object> maps = new HashMap<>();
	    maps.put("strId", strId);
	    maps.put("status", status); // status 파라미터 추가
	    
	    int totalCount = dao.inquiryResListCnt(maps);
	    paging.setCount(totalCount);

	    maps.put("startRow", paging.getStartRow());
	    maps.put("endRow", paging.getEndRow());

	    // 페이징된 게시글 목록 가져오기
	    List<InquiryDTO> inquiryResList = dao.inquiryResList(maps);

	    model.addAttribute("inquiryRes", inquiryResList);
	    model.addAttribute("paging", paging); // 페이징 객체 모델에 추가
	}	
	
}
