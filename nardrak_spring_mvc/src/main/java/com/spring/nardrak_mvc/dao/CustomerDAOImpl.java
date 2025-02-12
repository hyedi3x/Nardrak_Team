package com.spring.nardrak_mvc.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.nardrak_mvc.dto.CustomerDTO;
import com.spring.nardrak_mvc.dto.CustomerDeleteDTO;

@Repository
public class CustomerDAOImpl implements CustomerDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;   // dataSource-config.xml - 컨넥션풀 + 마이바티스 설정(pom.xml)
	
	// 패키지명 변수에 담아 매핑
	String namespace = "com.spring.nardrak_mvc.dao.CustomerDAO."; 


	// ======================= [id 중복확인 처리] =======================
	@Override
	public int useridCheck(String strId) {
	    System.out.println("CustomerDAOImpl - useridCheck()");
	   
	    return sqlSession.selectOne(namespace + "useridCheck", strId);
	}
	
	// ======================= [전화번호 & 이메일 중복 확인] =======================
	@Override
	public int uniqueCheck(Map<String, Object> map) {
		System.out.println("CustomerDAOImpl - uniqueCheck()");
		
		int count = 0;
		if(map.get("type").equals("phone")) {
			count = sqlSession.selectOne(namespace + "phoneCheck", map);
		}
		else if(map.get("type").equals("email")) {
			count = sqlSession.selectOne(namespace + "emailCheck", map);
		}
		return count;
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
	
   //======================= [회원정보 수정처리] =================================
    @Override
    public int updateCustomer(CustomerDTO dto) {
       System.out.println("CustomerDAOImpl - updateCustomer()");
      
       int updateCnt = sqlSession.update(namespace + "updateCustomer", dto);
     
       return updateCnt;
   }

    //======================= [회원정보 탈퇴 정보 처리] =======================
  	@Override
  	public int deleteCustomer(CustomerDeleteDTO dto){
  		System.out.println("CustomerDAOImpl - deleteCustomer()");
  		
  		return sqlSession.insert(namespace + "deleteCustomer", dto);
  	}
		
	//======================= [회원정보 탈퇴 처리 후, 고객 테이블에서 해당 회원 삭제] =======================
	@Override	
	public int deleteCustomerRemove(String strId) {
		System.out.println("CustomerDAOImpl - deleteCustomerRemove()");
		
		return sqlSession.update(namespace + "deleteCustomerRemove", strId);
	}

}
