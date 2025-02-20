package com.spring.nardrak_mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.nardrak_mvc.dto.FavoriteDTO;

public interface FavoriteDAO {
	
	// ======================= [선호 여행지 추가] =======================
	public int favoriteSelectCnt(Map<String, Object> map);
	
	// ======================= [선호 여행지 추가] =======================
	public void addFavorite(FavoriteDTO dto);
	
	// ======================= [선호 여행지 제거] =======================
	public void removeFavorite(HashMap<String,String>map);
	
	// ======================= [선호 여행지 목록 조회] =======================
	public List<FavoriteDTO> getFavoriteList(String cs_id);
}
