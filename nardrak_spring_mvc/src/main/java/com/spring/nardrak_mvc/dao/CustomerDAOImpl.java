package com.spring.nardrak_mvc.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.nardrak_mvc.dto.CustomerDTO;

@Repository
public class CustomerDAOImpl implements CustomerDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;   // dataSource-config.xml - 컨넥션풀 + 마이바티스 설정(pom.xml)
	
	// 패키지명 변수에 담아 매핑
	String namespace = "com.spring.nardrak_mvc.dao.CustomerDAO."; 


	// ======================= [id 중복확인 처리] =======================
	@Override
	public int useridCheck(String cs_id) {
	    System.out.println("CustomerDAOImpl - useridCheck()");
	   
	    return sqlSession.selectOne(namespace + "useridCheck", cs_id);
	}
	
	// ======================= [전화번호 중복확인 처리] =======================
	@Override
	public int phoneCheck(String cs_phone) {
		System.out.println("CustomerDAOImpl - phoneCheck()");
		
		return sqlSession.selectOne(namespace + "phoneCheck", cs_phone);
	}
	
	// ======================= [전화번호 중복확인 처리] =======================
	@Override
	public int emailCheck(String cs_email) {
		System.out.println("CustomerDAOImpl - emailCheck()");
		
		return sqlSession.selectOne(namespace + "emailCheck", cs_email);
	}
	
	// ======================= [회원가입 처리] =======================
	@Override
	public int insertCustomer(CustomerDTO dto) { 
	    System.out.println("CustomerDAOImpl - insertCustomer()");
	    int insertCnt = sqlSession.insert(namespace + "insertCustomer", dto);
	      
	    return insertCnt;
	 }
	   
	// ======================= [회원정보 인증(아이디, 비번)] =======================
	@Override
	public int userIdPwdChk(Map<String, Object> map) {
		System.out.println("CustomerDAOImpl - userIdPwdChk()");
		
		return sqlSession.selectOne(namespace  +"userIdPwdChk", map);  // 0, 1 결과 반환		
	}

	// ======================= [회원정보 인증(권한 확인)] =======================
	@Override
	public int sessionResult(String strId) {
		System.out.println("CustomerDAOImpl - sessionResult()");
		
		return sqlSession.selectOne(namespace + "sessionResult", strId);  // 0, 1 결과 반환		
	
	}
	
}
