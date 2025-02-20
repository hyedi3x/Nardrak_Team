package com.spring.nardrak_mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.nardrak_mvc.dto.FavoriteDTO;

@Repository
public class FavoriteDAOImpl implements FavoriteDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    String favorite = "com.spring.nardrak_mvc.dao.FavoriteDAO.";
    
    // ======================= [선호 여행지 선호 여부] =======================
    @Override
    public int favoriteSelectCnt(Map<String, Object> map) {
    	System.out.println("FavoriteDAO - favoriteSelectCnt()");
    	
    	return sqlSession.selectOne(favorite + "favoriteSelectCnt", map);
    }

    // ======================= [선호 여행지 추가] =======================
    @Override
    public void addFavorite(FavoriteDTO dto) {
    	System.out.println("FavoriteDAO - addFavorite()");
    	
        sqlSession.insert(favorite + "addFavorite", dto);
    }

    // ======================= [선호 여행지 제거] =======================
    @Override
    public void removeFavorite(HashMap<String, String> map) {
    	System.out.println("FavoriteDAO - removeFavorite()");

        sqlSession.delete(favorite + "removeFavorite", map);
    }

    // ======================= [선호 여행지 목록 조회] =======================
	@Override
	public List<FavoriteDTO> getFavoriteList(String cs_id) {
		System.out.println("FavoriteDAO - getFavoriteList()");

		return sqlSession.selectList(favorite + "getFavoriteList", cs_id);
	}
}
