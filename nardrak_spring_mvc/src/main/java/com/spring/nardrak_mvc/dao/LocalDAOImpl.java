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
	
	// ======================= [국내 여행지 정보 등록] =======================
	@Override
	public int InsertTour(LocalDTO dto) {
		System.out.println("LocalDAO - InsertTour()");
		
		return sqlSession.insert(namespace + "insertTour", dto);
	}
	
	// ======================= [국내 여행지 정보 전체 조회] =======================
	@Override
	public List<LocalDTO> localList(Map<String, Object> map){
		System.out.println("LocalDAO - localList()");
		
		return sqlSession.selectList(namespace + "localList", map);
	}
	
	// ======================= [국내 여행지 정보 전체 개수] =======================
	@Override
	public int localCnt() {
		System.out.println("LocalDAO - localCnt()");
	     
	    return sqlSession.selectOne(namespace + "localCnt");       
	}
	
	// ======================= [특정 지역 국내 여행지 정보 전체 개수] =======================
	@Override
	public int regionLocalCnt(String region) {
		System.out.println("LocalDAO - regionLocalCnt()");
		
		return sqlSession.selectOne(namespace + "regionLocalCnt", region);
	}

	// ======================= [국내 여행지 상세정보 조회(1건)] =======================
	@Override
	public LocalDTO localInfo(String local_title) {
		System.out.println("LocalDAO - localInfo()");

		return sqlSession.selectOne(namespace + "localInfo", local_title);
	}

	// ======================= [여행지 이름 유니크 값 체크] =======================
   @Override
   public int checkTitle(String local_title) {
      System.out.println("CustomerDAOImpl - checkTitle()");
      System.out.println("dao"+local_title);
      return sqlSession.selectOne(namespace+"checkTitle", local_title);
   }

   // ======================= [국내 여행지 정보 수정] =======================
	@Override
	public int updateTour(LocalDTO dto) {
		System.out.println("LocalDAO - updateTour()");
		
		return sqlSession.update(namespace + "updateTour", dto);
	}

}
