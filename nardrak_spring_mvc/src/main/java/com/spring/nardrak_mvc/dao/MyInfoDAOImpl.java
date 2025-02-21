package com.spring.nardrak_mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.nardrak_mvc.dto.AdminDTO;
import com.spring.nardrak_mvc.dto.CustomerDTO;
import com.spring.nardrak_mvc.dto.InquiryDTO;

@Repository
public class MyInfoDAOImpl implements MyInfoDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;   // dataSource-config.xml - 컨넥션풀 + 마이바티스 설정(pom.xml)
	
	// 패키지명 변수에 담아 매핑
	String namespace = "com.spring.nardrak_mvc.dao.MyInfoDAO."; 
	
	@Override
	// ======================= [회원정보 불러오기] =======================
	public CustomerDTO memberSelectCS(String strId) {
		System.out.println("MyInfoDAOImpl - memberSelectCS()");

		return sqlSession.selectOne(namespace + "memberSelectCS", strId);
	}
	
	@Override
	// ======================= [회원정보 불러오기] =======================	
	public AdminDTO memberSelectAD(String strId) {
		System.out.println("MyInfoDAOImpl - memberSelectAD()");

		return sqlSession.selectOne(namespace + "memberSelectAD", strId);
	}
	
	// ======================= [회원정보 인증(비번)] =======================
	@Override
	public int userPwdChk(Map<String, Object> map) {
		System.out.println("MyInfoDAOImpl - userPwdChk()");
		
		return sqlSession.selectOne(namespace  +"userPwdChk", map);  // 0, 1 결과 반환		
	}
	
	//======================= [ 1:1 문의 등록 ] =======================
	@Override
	public int insertInquiry(InquiryDTO dto) {
		System.out.println("MyInfoDAOImpl - insertInquiry()");
		
		return sqlSession.insert(namespace + "insertInquiry", dto);
	}
	
	//======================= [ 1:1 문의 내역 불러오기] =======================
	@Override
	public List<InquiryDTO> inquiryResList(Map<String, Object> maps) {
	    System.out.println("MyInfoDAOImpl - inquiryResList()");

	    return sqlSession.selectList(namespace + "inquiryResList", maps);
	}

	//======================= [ 1:1 문의 내역 전체 게시글 수를 반환 ] =======================
	@Override
	public int inquiryResListCnt(Map<String, Object> maps) {
	    System.out.println("MyInfoDAOImpl - inquiryResListCount()");
	    
	    return sqlSession.selectOne(namespace + "inquiryResListCount", maps);
	}
}
