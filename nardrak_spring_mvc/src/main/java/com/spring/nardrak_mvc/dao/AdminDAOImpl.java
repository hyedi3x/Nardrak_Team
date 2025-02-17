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

	// 관리자 수정
	@Override
	public int adminModifyAction(AdminDTO dto) {
		System.out.println("DAO adminModifyAction");

		return sqlSession.update(namespace+"adminModifyAction", dto);
	}
	
	// 관리자 삭제
	@Override
	public int adminDeleteAction(String strId) {
		System.out.println("DAO adminModifyAction");
		
		return sqlSession.update(namespace+"adminDeleteAction", strId);
	}

	// 관리자 요청 총 갯수 카운트
	@Override
	public int AdminAccessCount(String listId) {
		System.out.println("DAO AdminAccessCount");
		
		if(listId.equals("ad")) {
			return sqlSession.selectOne(namespace+"adminAccessCount");
		 }
		 else if(listId.equals("cs")) {
			 return sqlSession.selectOne(namespace+"customerDeletConut");
		 }
		return 0;
	}
	
	// 관리자 등록 요청 조회
	@Override
	public List<AdminDTO> adminAccess(Map<String, Object> map) {
		System.out.println("DAO adminAccess");
		if(map.get("listId").equals("ad")) {
		
			return sqlSession.selectList(namespace+"adminAccess", map);
		}
		else if(map.get("listId").equals("cs")) {

			return  sqlSession.selectList(namespace+"customerDeleteList", map);
		}
		else {
			return null;
		}
	}
	
	// 관리자 권한 요청 승인
	@Override
	public int adminAccessAction(List<String> ad_ids) {
		System.out.println("DAO adminAccessAction");
		 for(String index:ad_ids) {
			 System.out.println(index);
		 }
		return sqlSession.update(namespace+"adminAccessAction", ad_ids);
	}
	
	// 탈퇴 요청 30일 지난 회원 삭제
	@Override
	public int customerDelete(List<String> cs_ids) {
		System.out.println("DAO customerDelete");
		
		return sqlSession.delete(namespace+"customerDelete", cs_ids);
	}
	
}