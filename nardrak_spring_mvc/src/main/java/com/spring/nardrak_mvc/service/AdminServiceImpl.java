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
	
	// 아이디 중복확인
	@Override
	public void adminIdConfirm(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		
		System.out.println("Service idConfirm");
		
		String ad_id = request.getParameter("ad_id");

		model.addAttribute("selectCnt", dao.adminIdConfirm(ad_id));
		model.addAttribute("ad_id", ad_id);
		System.out.println(request.getAttribute("selectCnt"));
	}

	//관리자 회원가입
	@Override
	public void adminSignUpAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException{
		
		System.out.println("Service AdminSignUpAction");
		
		AdminDTO dto = new AdminDTO();
		
		dto.setAd_id(request.getParameter("ad_id")); 			// 아이디
		dto.setAd_pwd(request.getParameter("ad_pwd")); 			// 비밀번호
		dto.setAd_name(request.getParameter("ad_name")); 		// 이름
		dto.setAd_birth(request.getParameter("ad_birth")); 		// 생일
		
		String ad_phone1 = request.getParameter("ad_phone1"); 	// 통신사 
		String ad_phone2 = request.getParameter("ad_phone2"); 	// 번호 (-없이 입력)
		
		// ex.010-1111-2222으로 DB에 값 저장
		String ad_phone = ad_phone1+" "
										 +ad_phone2.substring(0,3)+"-"
										 +ad_phone2.substring(3,7)+"-"
										 +ad_phone2.substring(7,11);
		dto.setAd_phone(ad_phone);
		
		String ad_email1 = request.getParameter("ad_email1"); 	// ex.seoul
		String ad_email2 = request.getParameter("ad_email2"); 	// ex.naver.com
		String ad_email = ad_email1+"@"+ad_email2; 				// ex.seoul@naver.com
		dto.setAd_email(ad_email);
		
		dto.setAd_tel(request.getParameter("ad_tel"));			// 사내 전화번호 (필수X)
		dto.setAd_cpnum(request.getParameter("ad_cpnum"));		// 사번
		dto.setAd_dep(request.getParameter("ad_dep"));			// 부서코드
		
		List<String> chkArr = new ArrayList<String>();			// 약관동의 항목
		chkArr.add(request.getParameter("chkList1")); 			
		chkArr.add(request.getParameter("chkList2")); 
		chkArr.add(request.getParameter("chkList3")); 
		chkArr.add(request.getParameter("chkList4")); 
		
		String ad_terms = "";
		for(String index:chkArr) {
			if(index != null) {
				ad_terms += index+" ";
			}
		}
		ad_terms = ad_terms.substring(0,ad_terms.length()-1);
	
		dto.setAd_terms(ad_terms);
		
		int insertCnt = dao.adminSignUpAction(dto);
		model.addAttribute("insertCnt", insertCnt);
	}

}