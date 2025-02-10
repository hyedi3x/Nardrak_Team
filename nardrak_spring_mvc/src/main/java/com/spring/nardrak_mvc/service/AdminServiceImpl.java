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
	
	// 관리자 수정/삭제 비밀번호 확인
	@Override
	public void adminModify(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("Service adminModify");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String ad_id = request.getParameter("ad_id");
		String ad_pwd = request.getParameter("ad_pwd");
		map.put("ad_id", ad_id);
		map.put("ad_pwd", ad_pwd);
		
		model.addAttribute("dto",dao.adminModify(map)); 
		System.out.println("dto:"+request.getAttribute("dto"));
		
	}

	// 관리자 수정
	@Override
	public void adminModifyAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("Service adminModifyAction");
		
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
		
		model.addAttribute("updateCnt", dao.adminModifyAction(dto));
	}

}