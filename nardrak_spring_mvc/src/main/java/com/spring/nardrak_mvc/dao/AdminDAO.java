package com.spring.nardrak_mvc.dao;

import java.util.Map;

import com.spring.nardrak_mvc.dto.AdminDTO;

public interface AdminDAO {
	
		// 아이디 중복 확인
		public int adminIdConfirm(String ad_id);
		
		// 관리자 회원가입
		public int adminSignUpAction(AdminDTO dto);

}
