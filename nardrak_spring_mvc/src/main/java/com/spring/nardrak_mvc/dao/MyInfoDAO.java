package com.spring.nardrak_mvc.dao;

import java.util.List;
import java.util.Map;

import com.spring.nardrak_mvc.dto.AdminDTO;
import com.spring.nardrak_mvc.dto.CustomerDTO;
import com.spring.nardrak_mvc.dto.InquiryDTO;

public interface MyInfoDAO {
	// ======================= [회원정보 불러오기(고객)] =======================
	public CustomerDTO memberSelectCS(String strId);
	
	// ======================= [회원정보 불러오기(관리자)] =======================
	public AdminDTO memberSelectAD(String strId);
	
	// ======================= [회원정보 불러오기(관리자)] =======================
	public int userPwdChk(Map<String, Object> map);
	
	//======================= [ 1:1 문의 등록 ] =======================
	public int insertInquiry(InquiryDTO dto);	

	//======================= [ 1:1 문의 내역 불러오기 ] =======================
	public List<InquiryDTO> inquiryResList(Map<String, Object> maps);
	
	//======================= [ 1:1 문의 내역 전체 게시글 수를 반환 ] =======================
	public int inquiryResListCnt(Map<String, Object> maps);
}
