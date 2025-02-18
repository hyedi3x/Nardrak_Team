package com.spring.nardrak_mvc.dao;

import java.util.List;
import java.util.Map;

import com.spring.nardrak_mvc.dto.LocalDTO;

public interface LocalDAO {

	// 국내 여행지 정보 등록
	public int InsertTour(LocalDTO dto);
	
	// 여행지 정보 전부 가져오기
	public List<LocalDTO> localList(Map<String, Object> map);
	
	// 총 지역정보 개수
	public int localCnt();

}
