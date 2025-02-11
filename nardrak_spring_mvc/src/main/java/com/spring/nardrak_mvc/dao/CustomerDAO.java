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
	
	
	
	
	//======================= [마이페이지 - 회원상세정보] =======================
	public CustomerDTO customerDetail(String cs_id);
		
	//======================= [회원정보 인증처리 및 상세페이지] =======================
	public CustomerDTO modifyCustomerDetail(String cs_id);
	// 아이디와 일치할때의 정보를 확인해야 하기에 String cs_id 이지만 모든 값들을 확인해여 하기떄문에 CustomerDTO

	//======================= [회원정보 수정처리] =======================
	public int updateCustomer(CustomerDTO dto);	
	
	//======================= [회원정보 탈퇴 정보 처리] =======================
	public int deleteCustomer(CustomerDeleteDTO dto);
	
	//======================= [회원정보 탈퇴 처리 후, 고객 테이블에서 해당 회원 삭제] =======================
	public int deleteCustomerRemove(String cs_id);	

}
