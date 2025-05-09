package com.spring.nardrak_mvc.dao;

import java.util.Map;

import com.spring.nardrak_mvc.dto.CustomerDTO;
import com.spring.nardrak_mvc.dto.CustomerDeleteDTO;

public interface CustomerDAO {
	
	// ======================= [ID 중복확인 처리] =======================
	public int useridCheck(String cs_id);
	
	// ======================= [전화번호 & 이메일 중복 확인] =======================
	public int uniqueCheck(Map<String, Object> map);
	
	// ======================= [회원가입 처리] =======================
	public int insertCustomer(CustomerDTO dto); 
	
	// ======================= [회원정보 인증(아이디, 비번)] =======================
	public int userIdPwdChk(Map<String, Object> map);
	
	//======================= [회원정보 수정처리] =======================
	public int updateCustomer(CustomerDTO dto);	
	
	//======================= [회원정보 탈퇴 정보 처리] =======================
	public int deleteCustomer(CustomerDeleteDTO dto);
	
	//======================= [회원정보 탈퇴 처리 후, 고객 테이블에서 해당 회원 삭제] =======================
	public int deleteCustomerRemove(String strId);

}
