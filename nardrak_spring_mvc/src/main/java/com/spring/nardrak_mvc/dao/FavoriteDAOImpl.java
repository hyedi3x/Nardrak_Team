package com.spring.nardrak_mvc.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.nardrak_mvc.dto.FavoriteDTO;

@Repository
public class FavoriteDAOImpl implements FavoriteDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    String favorite = "com.spring.nardrak_mvc.dao.CustomerDAO.";

    // ======================= [선호 여행지 추가] =======================
    @Override
    public void addFavorite(FavoriteDTO dto) {
        // MyBatis를 사용하여 선호 여행지 추가
        sqlSession.insert(favorite + ".addFavorite", dto);
    }

    // ======================= [선호 여행지 제거] =======================
    @Override
    public void removeFavorite(HashMap<String, String> map) {
        // MyBatis를 사용하여 선호 여행지 제거
        sqlSession.delete(favorite + ".removeFavorite", map);
    }
}
