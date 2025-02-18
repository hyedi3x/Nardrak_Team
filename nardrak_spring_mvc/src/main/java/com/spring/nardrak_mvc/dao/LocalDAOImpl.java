package com.spring.nardrak_mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.nardrak_mvc.dto.LocalDTO;

@Repository
public class LocalDAOImpl implements LocalDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String namespace = "com.spring.nardrak_mvc.dao.LocalDAO.";
	
	// 국내 여행지 정보 등록
	@Override
	public int InsertTour(LocalDTO dto) {
		System.out.println("LocalDAO - InsertTour()");
		
		return sqlSession.insert(namespace + "insertTour", dto);
	}
	
	// 여행지 정보 전부 가져오기
	@Override
	public List<LocalDTO> localList(Map<String, Object> map){
		System.out.println("LocalDAO - localList()");
		
		return sqlSession.selectList(namespace + "localList", map);
	}
	
	// ======================= [지역정보 총 개수] =======================
	@Override
	public int localCnt() {
		System.out.println("LocalDAO - localCnt()");
	     
	    return sqlSession.selectOne(namespace + "localCnt");       
	}
	
}
