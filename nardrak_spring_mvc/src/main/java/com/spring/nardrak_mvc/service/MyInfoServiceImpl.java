package com.spring.nardrak_mvc.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.nardrak_mvc.dao.MyInfoDAO;
import com.spring.nardrak_mvc.dto.AdminDTO;
import com.spring.nardrak_mvc.dto.CustomerDTO;

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
		System.out.println("strid" + strId);
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
		
		// 관리자 수정 페이지에서 접근하면, get 방식으로 strId와 pwd가 넘어온다
		if(request.getParameter("user_id") != null) {
			strId = request.getParameter("user_id");
			model.addAttribute("strId", strId);
		}
		
		// 3-2단계. 화면에서 입력받은 비밀번호를 strPwd에 변수에 담는다. 
		String strPwd = request.getParameter("user_pwd");
		
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
	
}
