package com.spring.nardrak_mvc.dao;

import java.util.List;
import java.util.Map;

import com.spring.nardrak_mvc.dto.ChooseDTO;
import com.spring.nardrak_mvc.dto.LocalDTO;


public interface ChooseDAO {

	// ======================= [국내 여행지 정보 등록] =======================
	public int InsertChoose(ChooseDTO dto);
	
	// ======================= [국내 여행지 정보 전체 조회] ===================
	public List<ChooseDTO> ChooseList();
	
	// ================= [추천 여행지 상세정보 조회(1건)] =====================
	public ChooseDTO chooseInfo(String ch_title1);
	
	// ======================= [국내 여행지 상세정보 수정] ===================
	public int updateChoose(ChooseDTO dto);
	
}