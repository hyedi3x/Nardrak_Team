package com.spring.nardrak_mvc.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.nardrak_mvc.dao.AdminDAO;
import com.spring.nardrak_mvc.dto.AdminDTO;
import com.spring.nardrak_mvc.paging.AdminPaging;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO dao;
	
	// 관리자 정보 전송 객체 통일성을 위해 전역변수로 선언
	AdminDTO dto = new AdminDTO();
	
	// 아이디 중복확인
	@Override
	public void adminIdConfirm(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		System.out.println("Service idConfirm");
		
		String ad_id = request.getParameter("ad_id");

		model.addAttribute("selectCnt", dao.adminIdConfirm(ad_id));
		model.addAttribute("ad_id", ad_id);
	}

	//관리자 회원가입
	@Override
	public void adminSignUpAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException{
		System.out.println("Service AdminSignUpAction");
		
		dto.setAd_id(request.getParameter("ad_id")); 			// 아이디
		dto.setAd_pwd(request.getParameter("ad_pwd")); 			// 비밀번호
		dto.setAd_name(request.getParameter("ad_name")); 		// 이름
		
		String ad_bitth = request.getParameter("ad_birth")+"-"+
						  request.getParameter("ad_jender");
		dto.setAd_birth(ad_bitth); 		// 생일
		
		String ad_phone1 = request.getParameter("ad_phone1"); 	// 통신사 
		String ad_phone2 = request.getParameter("ad_phone2"); 	// 번호 (-없이 입력)
		
		// 통신사(ex. S, K, L) 000-0000-0000 형식으로 DB에 값 저장
		// ad_phone = 통신사데이터 + 공백 + 휴대폰번호 앞에서부터 3자리 + '-' + 4자리 + '-' 4자리
		String ad_phone = ad_phone1+" "
						 +ad_phone2.substring(0,3)+"-"
						 +ad_phone2.substring(3,7)+"-"
						 +ad_phone2.substring(7,11);
		dto.setAd_phone(ad_phone);
		
		// 이메일과 우편번호&주소는 나눠서 받은 input 필드의 값을 하나의 변수에 구분자 '@'와 ','를 함께 저장한다.
		String ad_email1 = request.getParameter("ad_email1"); 	// ex.seoul
		String ad_email2 = request.getParameter("ad_email2"); 	// ex.naver.com
		String ad_email = ad_email1+"@"+ad_email2; 				// ex.seoul@naver.com
		dto.setAd_email(ad_email);
		
		String ad_zip1 = request.getParameter("ad_zip1");
		String ad_zip2 = request.getParameter("ad_zip2");
		String ad_zip3 = request.getParameter("ad_zip3");
		String ad_zip = ad_zip1 + "," + ad_zip2 + "," + ad_zip3;
		dto.setAd_zip(ad_zip);
		
		dto.setAd_tel(request.getParameter("ad_tel"));			// 사내 전화번호 (필수X)
		dto.setAd_empnum(request.getParameter("ad_empnum"));		// 사번
		dto.setAd_dep(request.getParameter("ad_dep"));			// 부서코드
		
		// 약관동의 항목을 담을 ArrayList
		List<String> chkArr = new ArrayList<String>();			

		// 각 약관 순서대로 체크된 요소만 값을 1~4로 전달함.
		chkArr.add(request.getParameter("chkList1")); // value=1	
		chkArr.add(request.getParameter("chkList2")); // value=2	
		chkArr.add(request.getParameter("chkList3")); // value=3	
		chkArr.add(request.getParameter("chkList4")); // value=4	
		
		// 향상된 for문으로  List에 담은 약관 값이 존재하는 경우(체크한 경우)에만 값+공백을 실행
		String ad_terms = "";
		for(String index:chkArr) {
			if(index != null) {
				ad_terms += index+" ";
			}
		}
		// 마지막에 추가된 공백을 지워준다.
		ad_terms = ad_terms.substring(0,ad_terms.length()-1);
	
		dto.setAd_terms(ad_terms);
		
		model.addAttribute("insertCnt",  dao.adminSignUpAction(dto));
	}

	// 유니크 값 체크
	@Override
	public void uniqueCheck(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("Service uniqueCheck");
		
		String id = request.getParameter("id");
		String value = request.getParameter("value");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("value", value);
		
		// 저장되어 있는 번호들의 형식이 010-0000-0000 이기에 형식을 맞춰서 와일드카드로 포함되는지 구분한다.
		String ad_phone = "";
		if(id.equals("ad_phone")) {
			if(value.length() == 11||value.length() == 12) { // 12를 준 이유는 js로 최대값 이상이 되면 값을 자르기 전에 여기로 값이 들어와서 추가 입력시 12자리가 된다.
				String phone1 = value.substring(0, 3);
				String phone2 = value.substring(3, 7);
				String phone3 = value.substring(7, 11);
				ad_phone = phone1+"-"+phone2+"-"+phone3;
			}
		}
		map.put("ad_phone", ad_phone);
	
		String jsonResponse = "{\"uniqueCheck\":"+dao.uniqueCheck(map) + "}"; //{"uniqueCheck": mapper 결과} json형식 문자열 생성
		
		response.setContentType("application/json"); // 응답 컨텐츠(데이터 자료) 유형을 json으로 설정
		response.setCharacterEncoding("UTF-8");      // 인코딩 시, 한글 깨짐 방지
		response.getWriter().write(jsonResponse);    // 문자열 전달하는 객체
		
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
			request.getSession().setAttribute("login_session", "Admin"); // 사용자 유형 저장
		}
	}

    // 관리자 수정
    @Override
    public void adminModifyAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
	    System.out.println("Service adminModifyAction");
	      
	    dto.setAd_id((String)request.getSession().getAttribute("sessionID"));          // 아이디
	    dto.setAd_pwd(request.getParameter("ad_pwd"));          // 비밀번호
	    dto.setAd_name(request.getParameter("ad_name"));        // 이름
	      
	    String ad_bitth = request.getParameter("ad_birth")+"-"
	                    + request.getParameter("ad_jender");
	    dto.setAd_birth(ad_bitth);       // 생일
	      
	    String ad_phone1 = request.getParameter("ad_phone1");    // 통신사 
	    String ad_phone2 = request.getParameter("ad_phone2");    // 번호 (-없이 입력)
	      
	    // 통신사(ex. S, K, L) 000-0000-0000 형식으로 DB에 값 저장
	    // ad_phone = 통신사데이터 + 공백 + 휴대폰번호 앞에서부터 3자리 + '-' + 4자리 + '-' 4자리
	    String ad_phone = ad_phone1+" "
	                   +ad_phone2.substring(0,3)+"-"
	                   +ad_phone2.substring(3,7)+"-"
	                   +ad_phone2.substring(7,11);
	    dto.setAd_phone(ad_phone);
	      
	    // 이메일과 우편번호&주소는 나눠서 받은 input 필드의 값을 하나의 변수에 구분자 '@'와 ','를 함께 저장한다.
	    String ad_email1 = request.getParameter("ad_email1");    // ex.seoul
	    String ad_email2 = request.getParameter("ad_email2");    // ex.naver.com
	    String ad_email = ad_email1+"@"+ad_email2;             // ex.seoul@naver.com
	    dto.setAd_email(ad_email);
	      
	    String ad_zip1 = request.getParameter("ad_zip1");
	    String ad_zip2 = request.getParameter("ad_zip2");
	    String ad_zip3 = request.getParameter("ad_zip3");
	    String ad_zip = ad_zip1 + "," + ad_zip2 + "," + ad_zip3;
	    dto.setAd_zip(ad_zip);
	      
	    dto.setAd_tel(request.getParameter("ad_tel"));         // 사내 전화번호 (필수X)
	    dto.setAd_empnum(request.getParameter("ad_empnum"));      // 사번
	    dto.setAd_dep(request.getParameter("ad_dep"));         // 부서코드
	      
	    // 약관동의 항목을 담을 ArrayList
	    List<String> chkArr = new ArrayList<String>();         
	
	    // 각 약관 순서대로 체크된 요소만 값을 1~4로 전달함.
	    chkArr.add(request.getParameter("chkList1")); // value=1   
	    chkArr.add(request.getParameter("chkList2")); // value=2   
	    chkArr.add(request.getParameter("chkList3")); // value=3   
	    chkArr.add(request.getParameter("chkList4")); // value=4   
	      
	    // 향상된 for문으로  List에 담은 약관 값이 존재하는 경우(체크한 경우)에만 값+공백을 실행
	    String ad_terms = "";
	    for(String index:chkArr) {
	        if(index != null) {
	            ad_terms += index+" ";
	        }
	    }
	    // 마지막에 추가된 공백을 지워준다.
	    ad_terms = ad_terms.substring(0,ad_terms.length()-1);
	   
	    dto.setAd_terms(ad_terms);
	      
	    model.addAttribute("updateCnt", dao.adminModifyAction(dto));
	}
	
	// 관리자 삭제
	@Override
	public void adminDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		 System.out.println("Service adminDeleteAction");
		 
		String ad_id = (String)request.getSession().getAttribute("sessionID");
		
		// 세션 삭제
		request.getSession().invalidate();
		
		model.addAttribute("deleteCnt", dao.adminDeleteAction(ad_id));
	}
	
	// 관리자 요청 조회
	@Override
	public void adminAccess(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		 System.out.println("Service adminAccess");
		 
		 // 관리자 리스트에 처음 들어올 때는 null, 블록을 누르면 페이지 전달
		 AdminPaging paging = new AdminPaging(request.getParameter("page"));
		 
		 // 전체 요청수를 매개 변수로 전달하여, 전체 페이지수, 시작 글 번호, 마지막 글 번호 설정, 블록 함수 실행
		 int totalCount = dao.AdminAccessCount();
		 System.out.println(totalCount);
		 paging.setCount(totalCount);
		 
		 // 시작 글 번호, 끝 글번호만큼만 조회
		 Map<String,Object> map = new HashMap<String, Object>();
		 
		 map.put("startRow", paging.getStartRow());
		 map.put("endRow", paging.getEndRow());
		 System.out.println(map.get("startRow"));
		 System.out.println(map.get("endRow"));
		 model.addAttribute("list", dao.adminAccess(map));
		 model.addAttribute("paging", paging);
		 
		
	}
}