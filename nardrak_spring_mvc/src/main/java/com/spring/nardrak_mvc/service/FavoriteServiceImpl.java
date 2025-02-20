package com.spring.nardrak_mvc.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.nardrak_mvc.dao.FavoriteDAO;
import com.spring.nardrak_mvc.dto.FavoriteDTO;

@Service
public class FavoriteServiceImpl implements FavoriteService {

    @Autowired
    private FavoriteDAO favoriteDAO;

    // ======================= [선호 여행지 추가 및 해제] =======================
    @Override
    public void favoriteAction(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
    	System.out.println("FavoriteSerivceImpl - favoriteAction()");
    	
        // 요청 파라미터 받아오기
        String cs_id = (String)request.getSession().getAttribute("sessionID");
        String dest_name = request.getParameter("dest_name"); // 여행지 이름
        String image_url = request.getParameter("image_url"); // 이미지 URL
        String description = request.getParameter("description"); // 여행지 설명
        boolean isAdd = "true".equals(request.getParameter("isAdd")); // 체크박스 값 (선호 여행지 추가 여부)
        
        // null 체크 후 로직 처리
        if (cs_id == null || dest_name == null || image_url == null || description == null) {
            // 누락된 파라미터 처리
            System.out.println("필수 파라미터 누락");
            return;
        }
        
        Map<String, Object> selectMap = new HashMap<String, Object>();
        selectMap.put("cs_id",cs_id);
        selectMap.put("dest_name", dest_name);
        int favoriteSelectCnt = favoriteDAO.favoriteSelectCnt(selectMap);
        
        // DTO 생성 및 값 설정
    	FavoriteDTO favoriteDTO = new FavoriteDTO();
        favoriteDTO.setCs_id(cs_id);
        favoriteDTO.setDest_name(dest_name);
        favoriteDTO.setImage_url(image_url); // 이미지 URL
        favoriteDTO.setDescription(description); // 여행지 설명
        favoriteDTO.setAdded_date(new Timestamp(System.currentTimeMillis()));
        
        // 응답 객체 JSON으로 설정
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        // 받을 응답 메시지
        String responseMessage = "";
    
    	// 선호 여행지 추가/해제 로직 처리
        if (isAdd) {
        	if (favoriteSelectCnt == 0) {
                // 선호 여행지가 없는 경우에만 추가
                favoriteDAO.addFavorite(favoriteDTO);
                responseMessage = "{\"message\": \"찜하기 추가 성공\"}";
            } else {
            	// 이미 선호 여행지에 있는 경우
                responseMessage = "{\"message\": \"이미 찜한 여행지입니다.\"}";
            }
        } else {
        	if (favoriteSelectCnt > 0) {
                // 선호 여행지가 존재하는 경우에만 해제
                HashMap<String, String> map = new HashMap<>();
                map.put("cs_id", cs_id);
                map.put("dest_name", dest_name); // 정확한 기준으로 삭제 처리
                favoriteDAO.removeFavorite(map);
                responseMessage = "{\"message\": \"찜하기 삭제 성공\"}";
            } else {
            	// 이미 해제된 경우
            	responseMessage = "{\"message\": \"이미 삭제한 여행지입니다.\"}";
            }
        }
        
        out.write(responseMessage);
        out.close();
	}
    
    // ======================= [찜한 여행지 목록 조회] =======================
	@Override
	public void favoriteList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("FavoriteSerivceImpl - favoriteList()");
		
		// 세션에서 고객 ID(cs_id) 가져오기
		String cs_id = (String)request.getSession().getAttribute("sessionID");
		
		// 응답 객체 JSON으로 설정
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		// 고객 아이디가 null이면 빈 배열(아무것도 안 나오게) 반환
	    if (cs_id == null) {
	        out.write("[]");
	        out.close();
	        return;
	    }
		
		// 찜한 여행지 목록을 저장할 리스트 변수 선언
		List<FavoriteDTO> favoriteList = null;
		
		// cs_id(고객 아이디)가 null이 아니면 찜한 여행지 목록 조회
		if(cs_id != null) {
			// 고객이 찜한 여행지 목록 조회
			favoriteList = favoriteDAO.getFavoriteList(cs_id);
		}
		
	    // 리스트를 JSON 형식으로 변환하기 위한 StringBuilder 생성
	    StringBuilder jsonResponse = new StringBuilder();

	    // JSON 배열의 시작
	    jsonResponse.append("[");
	    
	    // favoriteList의 각 항목에 대해 반복
	    for (int i = 0; i < favoriteList.size(); i++) {
	        FavoriteDTO favorite = favoriteList.get(i);	// 현재 항목을 FavoriteDTO 객체로 가져옴
	        
	        // 각 여행지의 이름(dest_name)을 포함하는 JSON 객체 추가
	        // {"dest_name" : "favorite.getDest_name()"}를 반복해서 StringBuilder에 append
	        jsonResponse.append("{")
	            .append("\"dest_name\": \"").append(favorite.getDest_name()).append("\"")
	            .append("}");

	     // 마지막 항목이 아니라면 쉼표를 추가하여 구분
	        if (i < favoriteList.size() - 1) {
	            jsonResponse.append(",");
	        }
	    }
	    
	    // JSON 배열의 닫기
	    jsonResponse.append("]");

	    // 응답 내용 작성
	    out.write(jsonResponse.toString());
	    out.close();
	}
    
}

