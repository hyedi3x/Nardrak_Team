package com.spring.nardrak_mvc.dao;

import java.util.List;
import java.util.Map;

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


	// 유니크 값 검사
	@Override
	public int uniqueCheck(Map<String, Object> map) {
		System.out.println("DAO adminSignUpAction");
		// 핸드폰은 통신사 자르고 검사해야해서 실행 구문이 다르다.
		if(map.get("id").equals("ad_phone")) {
			if(((String) map.get("value")).length() >= 11) {
				return sqlSession.selectOne(namespace+"uniqueCheckPhone",map);
			}
			else {
				return 0;
			}
		}
		
		else if(map.get("id").equals("ad_email")) {
			return sqlSession.selectOne(namespace+"uniqueCheckEmail",map);
		}
		return sqlSession.selectOne(namespace+"uniqueCheckEmpnum",map);
	}
	
	// ======================= [회원정보 인증(아이디, 비번)] =======================
	@Override
	public int userIdPwdChk(Map<String, Object> map) {
		System.out.println("CustomerDAOImpl - userIdPwdChk()");
		
		return sqlSession.selectOne(namespace  +"userIdPwdChk", map);  // 0, 1 결과 반환		
	}

	// 관리자 수정/삭제 페이지 비밀번호 확인
	@Override
	public AdminDTO adminModify(Map<String, Object> map) {
		System.out.println("DAO adminModify");
		
		return sqlSession.selectOne(namespace+"adminModify",map);
	}

	// 관리자 수정
	@Override
	public int adminModifyAction(AdminDTO dto) {
		System.out.println("DAO adminModifyAction");

		return sqlSession.update(namespace+"adminModifyAction", dto);
	}
	
	// 관리자 삭제
	@Override
	public int adminDeleteAction(Map<String, Object> map) {
		System.out.println("DAO adminModifyAction");
		
		return sqlSession.update(namespace+"adminDeleteAction", map);
	}

	// 관리자 요청 총 갯수 카운트
	@Override
	public int AdminAccessCount() {
		System.out.println("DAO AdminAccessCount");
		
		return sqlSession.selectOne(namespace+"AdminAccessCount");
	}
	
	// 관리자 등록 요청 조회
	@Override
	public List<AdminDTO> adminAccess(Map<String, Object> map) {
		System.out.println("DAO adminAccess");
		
		return sqlSession.selectList(namespace+"adminAccess", map);
	}
	
	
	
}