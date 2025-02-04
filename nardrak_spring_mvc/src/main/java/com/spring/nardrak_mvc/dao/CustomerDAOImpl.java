package com.spring.nardrak_mvc.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAOImpl implements CustomerDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;   // dataSource-config.xml - 컨넥션풀 + 마이바티스 설정(pom.xml)
	
	// 패키지명 변수에 담아 매핑
	String namespace = "com.spring.nardrak_mvc.dao.CustomerDAO."; 


	@Override
	// ======================= [회원정보 인증(아이디, 비번)] =======================
	public int userIdPwdChk(Map<String, Object> map) {
		System.out.println("CustomerDAOImpl - userIdPwdChk()");
		
		return sqlSession.selectOne(namespace  +"userIdPwdChk", map);  // 0, 1 결과 반환		
	}

	// ======================= [회원정보 인증(권한 확인)] =======================
	public int sessionResult(String strId) {
		System.out.println("CustomerDAOImpl - sessionResult()");
		
		return sqlSession.selectOne(namespace + "sessionResult", strId);  // 0, 1 결과 반환		
	
	}
	
}
