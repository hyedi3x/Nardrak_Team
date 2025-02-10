package com.spring.nardrak_mvc.dao;

import java.util.Map;

import com.spring.nardrak_mvc.dto.CustomerDTO;

public interface CustomerDAO {
	
	// ======================= [ID 중복확인 처리] =======================
	public int useridCheck(String cs_id);
	
	// ======================= [전화번호 & 이메일 중복 확인] =======================
	public int uniqueCheck(Map<String, Object> map);
	
	// ======================= [회원가입 처리] =======================
	public int insertCustomer(CustomerDTO dto); 
	
	// ======================= [회원정보 인증(아이디, 비번)] =======================
	public int userIdPwdChk(Map<String, Object> map);

}
