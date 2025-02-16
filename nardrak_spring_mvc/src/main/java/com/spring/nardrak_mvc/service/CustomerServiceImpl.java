package com.spring.nardrak_mvc.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.nardrak_mvc.dao.CustomerDAO;
import com.spring.nardrak_mvc.dto.CustomerDTO;
import com.spring.nardrak_mvc.dto.CustomerDeleteDTO;
import com.spring.nardrak_mvc.dto.InquiryDTO;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerDAO dao;
	
	@Override
	
	//======================= [ID 중복확인 처리] =======================
	public void inConfirmAction(HttpServletRequest request, HttpServletResponse response, Model model)
	        throws ServletException, IOException {
	      
	      System.out.println("서비스 - idConfirmAction()");
	      
	      // 스트리트에서 get방식으로 넘긴 값을 가져온다.
	      String strId = request.getParameter("cs_id");
	         
	      // ID 중복확인 처리
	      int inConfirmCnt = dao.useridCheck(strId);
	      
	      // jsp로 처리결과 전달
	      model.addAttribute("inConfirmCnt", inConfirmCnt);
	      model.addAttribute("strId", strId);
	   }
	
	// ======================= [전화번호 & 이메일 중복 확인] =======================
	@Override
	public void uniqueCheck(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
	    System.out.println("서비스 - uniqueCheck()");

	    String type = request.getParameter("type"); // phone 또는 email
	    String value = request.getParameter("value");
	    
	    int count = 0;
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("type", type);
	    map.put("value", value);
	    count = dao.uniqueCheck(map);
	    
	    // JSON 문자열을 직접 생성
	    String jsonResponse = "{ \"count\": " + count + " }"; // JSON 형식의 문자열을 저장 

	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(jsonResponse);
	}

	// ======================= [회원가입 처리 페이지] =======================
	   @Override
	   public void signUpAction(HttpServletRequest request,HttpServletResponse response, Model model)
	         throws ServletException, IOException {
	      
	      System.out.println("서비스 - signInAction()");
	      
	      // DTO 생성 (생년월일 검증 성공 시 회원가입 처리 계속 진행)
	      CustomerDTO dto = new CustomerDTO();
	      dto.setCs_id(request.getParameter("cs_id"));
	      dto.setCs_pwd(request.getParameter("cs_pwd"));
	      dto.setCs_name(request.getParameter("cs_name"));
	      dto.setCs_gender(request.getParameter("cs_gender"));
	      dto.setCs_birth(Date.valueOf(request.getParameter("cs_birth"))); //sql.Date
	      
	      // [핸드폰 번호 입력] (010-1111-2222)
	      String hp = "";
	      
	      String hp1 = request.getParameter("user_hp1");
	      String hp2 = request.getParameter("user_hp2");
	      String hp3 = request.getParameter("user_hp3");

	      hp = hp1 + "-" + hp2 + "-" + hp3;
	     
	      dto.setCs_phone(hp);
	      
	      // [주소]
	      String user_addr ="";
	      
	      String postcode_ad = request.getParameter("postcode");  // 우편번호
	      String road_ad = request.getParameter("road");	      // 도로명주소
	      String jibun_ad = request.getParameter("jibun");        // 지번주소
	      String detail_ad = request.getParameter("detail");      // 상세주소
	      String extra_ad = request.getParameter("extra");        // 참고항목
	       
	      // 상세주소가 없을 경우
	      if(detail_ad.equals("")) {
	    	  user_addr = postcode_ad + road_ad + jibun_ad + extra_ad;
	      }
	      // 상세주소가 있을 경우
	      else {
	    	  user_addr = postcode_ad + "," + road_ad + ","  + jibun_ad + ","  + detail_ad +  "," + extra_ad;
	      }
	      
	      dto.setCs_zip(user_addr);
	      
	      // [이메일]
	      String email1 = request.getParameter("user_email1");
	      String email2 = request.getParameter("user_email2");
	      String email = email1 + "@" + email2;
	      
	      dto.setCs_email(email);
	      
	      // [지역 전화번호] 
	      //필수가 아니므로 null 값이 들어올 수 있으므로 값이 존재할 때만 받아온다. (010-1111-2222)
	      String local = "";
	      
	      String local1 = request.getParameter("user_local1");
	      String local2 = request.getParameter("user_local2");
	      String local3 = request.getParameter("user_local3");
	      
	      if(!local1.equals("")&& !local2.equals("")&& !local3.equals("")) {
	    	  local = local1 + "-" + local2 + "-" + local3;
	      }
	      dto.setCs_tel(local);
	      
	      dto.setCs_terms(request.getParameter("cs_Terms"));
	      
	      dto.setCs_regDate(new Timestamp(System.currentTimeMillis())); 	//System.currentTimeMillias()현재 시각
	     
	      // 회원가입 처리
	      int signUpCnt = dao.insertCustomer(dto);
	      
	      // jsp로 처리결과 전달
	      model.addAttribute("signUpCnt", signUpCnt);
	   }
	
	// ======================= [로그인 성공 처리 페이지] =======================
	public void loginResult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("CustomerSerivceImpl - loginResult()");

		// -------------[3단계] 화면에서 입력받은 값을 가져와서 파라미터로 담기 -------------
		String strId = request.getParameter("user_id");
		String strPwd = request.getParameter("user_pwd");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("strId", strId);   // key, value
		map.put("strPwd", strPwd);
				
		// -------------[4단계] - 전역변수로 선언-------------
		// -------------[5단계] 로그인 성공여부 처리-------------
		// 아이디와 비밀번호가 일치하는지 userIdPwdChk 메서드 실행후 결과값을 selectCnt 변수에 담는다.
		int loginCnt = dao.userIdPwdChk(map);
				
		// -------------[6단계] - selectCnt 값에 따라 세션 설정 및 에러 처리 ------------
		// request.getSession() : 컨트롤러 호출 시 세션이 존재하면 존재하는 세션을 전달, 없으면 새로 생성 또는 null 반환
		if (loginCnt == 1) {	
			request.getSession().setAttribute("sessionID", strId);
			request.getSession().setAttribute("login_session", "Customer"); // 사용자 유형 저장
		}
	}
	
	   //======================= [회원정보 수정처리] =======================
	   @Override
	   public void modifyCustomerInAction(HttpServletRequest request, HttpServletResponse response, Model model)
	         throws ServletException, IOException {
	      
	      System.out.println("서비스 - modifyCustomerInAction()");
	      
	      // 3단계. 화면에서 입력받은 값을 가져와서 dto에 담는다.(id는 세션값)
	      CustomerDTO dto = new CustomerDTO();
	      dto.setCs_id((String)request.getSession().getAttribute("sessionID"));   //input 박스에서 입력받지 않고 세션ID를 사용
	      dto.setCs_pwd(request.getParameter("cs_pwd"));
	      dto.setCs_name(request.getParameter("cs_name"));
	      dto.setCs_gender(request.getParameter("cs_gender"));
	      dto.setCs_birth(Date.valueOf(request.getParameter("cs_birth")));   //sql.Date
	      
	      // [핸드폰 번호 입력] (010-1111-2222)
	      String hp = "";
	      
	      String hp1 = request.getParameter("user_hp1");
	      String hp2 = request.getParameter("user_hp2");
	      String hp3 = request.getParameter("user_hp3");

	      hp = hp1 + "-" + hp2 + "-" + hp3;
	     
	      dto.setCs_phone(hp);
	      
	      // [주소]
	      String user_addr ="";
	      
	      String postcode_ad = request.getParameter("postcode");  // 우편번호
	      String road_ad = request.getParameter("road");	      // 도로명주소
	      String jibun_ad = request.getParameter("jibun");        // 지번주소
	      String detail_ad = request.getParameter("detail");      // 상세주소
	      String extra_ad = request.getParameter("extra");        // 참고항목
	       
	      // 상세주소가 없을 경우
	      if(detail_ad.equals("")) {
	    	  user_addr = postcode_ad + road_ad + jibun_ad + extra_ad;
	      }
	      // 상세주소가 있을 경우
	      else {
	    	  user_addr = postcode_ad + "," + road_ad + ","  + jibun_ad + ","  + detail_ad +  "," + extra_ad;
	      }
	      
	      dto.setCs_zip(user_addr);
	      
	      // [이메일]
	      String email1 = request.getParameter("user_email1");
	      String email2 = request.getParameter("user_email2");
	      String email = email1 + "@" + email2;
	      
	      dto.setCs_email(email);
	      
	      // [지역 전화번호] 
	      //필수가 아니므로 null 값이 들어올 수 있으므로 값이 존재할 때만 받아온다. (010-1111-2222)
	      String local = "";
	      
	      String local1 = request.getParameter("user_local1");
	      String local2 = request.getParameter("user_local2");
	      String local3 = request.getParameter("user_local3");
	      
	      if(!local1.equals("")&& !local2.equals("")&& !local3.equals("")) {
	    	  local = local1 + "-" + local2 + "-" + local3;
	      }
	      dto.setCs_tel(local);
	      
	      //등록날짜
	      dto.setCs_regDate(new Timestamp(System.currentTimeMillis()));
	      
	      //회원정보 수정처리
	     int updateCnt = dao.updateCustomer(dto);
	      
	      //jsp로 처리결과 전달
	      model.addAttribute("updateCnt", updateCnt);
	  }
	   
	   //======================= [회원정보 탈퇴 처리] =======================
	   @Override
	   public void deleteCustomer(HttpServletRequest request, HttpServletResponse response, Model model)
	         throws ServletException, IOException {
	      
	      System.out.println("서비스 - deleteCustomer()");
	      
	      String strId = (String) request.getSession().getAttribute("sessionID"); // 세션에서 사용자 ID를 가져옴
	      String cs_del_terms = request.getParameter("agree1"); //탈퇴 동의 여부
	      String cs_drCode = request.getParameter("levCd"); // 탈퇴 사유 코드
	      String cs_etc_cmmt = request.getParameter("etcCmmt"); // 기타 사유 (입력한 텍스트)
	      
	      //DTO 생성 후 파라미터 세팅
	      CustomerDeleteDTO dto = new CustomerDeleteDTO();
	      dto.setCs_id(strId);
	      dto.setCs_del_terms(cs_del_terms);
	      dto.setCs_drCode(cs_drCode);
	      dto.setCs_etc_cmmt(cs_etc_cmmt);
	      
	      // DB 업데이트 처리: 탈퇴 사유와 기타 사유, 탈퇴 일시 업데이트
	      dao.deleteCustomer(dto);
	      int deleteCnt = dao.deleteCustomerRemove(strId);
	      
	      // 세션 무효화 (삭제)
	      request.getSession().invalidate();
	      
	      // 탈퇴 후 결과 페이지로 리디렉션
	      model.addAttribute("deleteCnt", deleteCnt);
	  
	   }
	   
	    //======================= [ 1:1문의 등록 처리 ] =======================
		@Override
		public void insertInquiry(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException {
			
			System.out.println("서비스 - insertInquiry()");
			
			String strId = (String) request.getSession().getAttribute("sessionID");
			
			MultipartFile file = request.getFile("i_imgUpload");
			System.out.println("file" + file);
			
			String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/myInfo/myInfo_Inquiry/");
			System.out.println("saveDir" + saveDir);
			
			String realDir = "C:\\DEV\\team_개인\\Nardrak_Team\\nardrak_spring_mvc\\src\\main\\webapp\\resources\\upload\\myInfo\\myInfo_Inquiry\\";
			System.out.println("realDir :" + realDir);
			
			FileInputStream fis = null;
			FileOutputStream fos = null;
			
			try{
				file.transferTo(new File(saveDir + file.getOriginalFilename()));
				fis = new FileInputStream(saveDir + file.getOriginalFilename());
				fos = new FileOutputStream(realDir + file.getOriginalFilename());
				
				int data = 0;
				while((data = fis.read()) != -1) {
					fos.write(data);
				}
				
			// 화면에서 입력받은 값을 가져와서 dto에 담는다.(id는 세션값, 이름, 휴대폰 번호, 이메일가져옴)
			InquiryDTO dto = new InquiryDTO();
			dto.setCs_id(strId);
			dto.setI_title(request.getParameter("i_title"));
			
	        String category1 = request.getParameter("i_category1");
	        String category2 = request.getParameter("i_category2");
		    
	        String category = category1 + "," + category2;
		      
			dto.setI_category(category);
			
			dto.setI_content(request.getParameter("i_content"));
			
			String p_img1 = "/nardrak_spring_mvc/resources/upload/myInfo/myInfo_Inquiry/" + file.getOriginalFilename();
			System.out.println("p_img1" + p_img1);
			dto.setI_imgUpload(p_img1);
		
	        int inserCnt = dao.insertInquiry(dto);
	      
	        model.addAttribute("insertCnt", inserCnt);
	        
			}catch(IOException e){
				e.printStackTrace();
			}finally {
				if(fis != null) fis.close();
				if(fos != null) fos.close();
			}
		}
}
