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

import com.spring.nardrak_mvc.dao.CustomerDAO;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerDAO dao;
	
	@Override
	
	//ID 중복확인 처리
	public void inConfirmAction(HttpServletRequest request, HttpServletResponse response, Model model)
	        throws ServletException, IOException {
	      
	      System.out.println("서비스 - idConfirmAction()");
	      
	      // 스트리트에서 get방식으로 넘긴 값을 가져온다.
	      String cs_id = request.getParameter("cs_id");
	         
	      // ID 중복확인 처리
	      int inConfirmCnt = dao.useridCheck(cs_id);
	      
	      // jsp로 처리결과 전달
	      model.addAttribute("inConfirmCnt", inConfirmCnt);
	      model.addAttribute("cs_id", cs_id);
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
		int sessionCnt = dao.sessionResult(strId);
				
		// -------------[6단계] - selectCnt 값에 따라 세션 설정 및 에러 처리 ------------
		// sessionCnt 값에 따라 세션 설정 및 에러 처리
		// request.getSession() : 컨트롤러 호출 시 세션이 존재하면 존재하는 세션을 전달, 없으면 새로 생성 또는 null 반환
		if (loginCnt == 1) {		
			if (sessionCnt == 0) { // 일반 회원	
				request.getSession().setAttribute("sessionID", strId);
				request.getSession().setAttribute("login_session", "Customer"); // 사용자 유형 저장
			} else if (sessionCnt == 1) { // 관리자
				request.getSession().setAttribute("sessionID", strId);
				request.getSession().setAttribute("login_session", "Admin"); // 사용자 유형 저장
			}
		}
	}
	
}
