package com.spring.nardrak_mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.nardrak_mvc.dto.AdminDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	String namespace = "com.spring.nardrak_mvc.dao.AdminDAO."; 
	
	// 아이디 중복확인
	@Override
	public int adminIdConfirm(String ad_id) {
		System.out.println("DAO AdminidConfirm");
		
		return sqlSession.selectOne(namespace+"adminIdConfirm", ad_id);
	}
	
	// 관리자 회원가입
	@Override
	public int adminSignUpAction(AdminDTO dto) {
		System.out.println("DAO adminSignUpAction");
		
		return sqlSession.insert(namespace+"adminSignUpAction", dto);
	}
}