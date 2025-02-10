package com.spring.nardrak_mvc.dao;

import java.util.Map;

import com.spring.nardrak_mvc.dto.AdminDTO;

public interface AdminDAO {
	
		// 아이디 중복 확인
		public int adminIdConfirm(String ad_id);
		
		// 관리자 회원가입
		// dto : 뷰 객체에서 전송한 input 값을 멤버 변수로 담은 클래스, DB로 전송하기 위함.
		public int adminSignUpAction(AdminDTO dto);
		
		// 유니크 값 검사
		public int uniqueCheck(Map<String, Object> map);
		
<<<<<<< HEAD
		// ======================= [회원정보 인증(아이디, 비번)] =======================
		public int userIdPwdChk(Map<String, Object> map);
=======
		// 관리자 수정/삭제 페이지 비밀번호 확인
		public AdminDTO adminModify(Map<String, Object> map);
		
		// 관리자 수정
		public int adminModifyAction(AdminDTO dto);
>>>>>>> 2d2a0f7 ([feat] 관리자 등록, 수정 페이지 관련)
		
}
