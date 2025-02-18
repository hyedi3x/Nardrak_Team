package com.spring.nardrak_mvc.dao;

import java.util.List;
import java.util.Map;

import com.spring.nardrak_mvc.dto.LocalDTO;

public interface LocalDAO {

	// ======================= [국내 여행지 정보 등록] =======================
	public int InsertTour(LocalDTO dto);
	
	// ======================= [국내 여행지 정보 전체 조회] =======================
	public List<LocalDTO> localList(Map<String, Object> map);
	
	// ======================= [국내 여행지 정보 전체 개수] =======================
	public int localCnt();

	// ======================= [국내 여행지 상세정보 조회(1건)] =======================
	public LocalDTO localInfo(String local_title);
}
