package com.spring.nardrak_mvc.dao;

import java.util.Map;

import com.spring.nardrak_mvc.dto.AdminDTO;
import com.spring.nardrak_mvc.dto.CustomerDTO;

public interface MyInfoDAO {
	// ======================= [회원정보 불러오기(고객)] =======================
	public CustomerDTO memberSelectCS(String strId);
	
	// ======================= [회원정보 불러오기(관리자)] =======================
	public AdminDTO memberSelectAD(String strId);
	
	// ======================= [회원정보 불러오기(관리자)] =======================
	public int userPwdChk(Map<String, Object> map);
}
