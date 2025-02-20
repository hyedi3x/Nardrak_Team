package com.spring.nardrak_mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.nardrak_mvc.dto.ChooseDTO;

@Repository
public class ChooseDAOImpl implements ChooseDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String choose = "com.spring.nardrak_mvc.dao.ChooseDAO.";

	// ================= [추천 여행지 정보 등록] ======================
	@Override
	public int InsertChoose(ChooseDTO dto) {
		System.out.println("ChooseDAO - InsertChoose()");
		
		return sqlSession.insert(choose + "InsertChoose", dto);
	}
	
	// ================= [국내 여행지 정보 전체 조회] ===================
	@Override
	public List<ChooseDTO> ChooseList() {
		System.out.println("ChooseDAO - ChooseList()");
		
		return sqlSession.selectList(choose + "ChooseList");
	}

	// ================= [추천 여행지 상세정보 조회(1건)] ================
	@Override
	public ChooseDTO chooseInfo(String ch_title1) {
		System.out.println("ChooseDAO - chooseInfo()");

		return sqlSession.selectOne(choose + "chooseInfo", ch_title1);
	}
	
	// ================= [국내 여행지 상세정보 수정] ====================
	@Override
	public int updateChoose(ChooseDTO dto) {
		System.out.println("ChooseDAO - updateChoose()");
		
		return sqlSession.update(choose + "updateChoose",dto);
	}
	

	
}
