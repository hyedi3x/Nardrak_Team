package com.spring.nardrak_mvc.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

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
    public void favoriteAction(HttpServletRequest request,HttpServletResponse response, Model model) {
        // 요청 파라미터 받아오기
        String ad_id = (String)request.getSession().getAttribute("sessionID");
        String dest_id = request.getParameter("dest_id");  // 여행지 ID
        String dest_name = request.getParameter("dest_name"); // 여행지 이름
        String image_url = request.getParameter("image_url"); // 이미지 URL
        String description = request.getParameter("description"); // 여행지 설명
        boolean isAdd = "true".equals(request.getParameter("isAdd")); // 체크박스 값 (선호 여행지 추가 여부)
        
        System.out.println(ad_id);
        System.out.println(dest_id);
        System.out.println(dest_name);
        System.out.println(image_url);
        System.out.println(description);
        System.out.println(isAdd);
        
        // null 체크 후 로직 처리
        if (ad_id == null || dest_id == null || dest_name == null || image_url == null || description == null) {
            // 누락된 파라미터 처리
            System.out.println("필수 파라미터 누락");
            return;
        }


        // DTO 생성 및 값 설정
        FavoriteDTO favoriteDTO = new FavoriteDTO();
        favoriteDTO.setAd_id(ad_id);
        favoriteDTO.setDest_id(dest_id);
        favoriteDTO.setDest_name(dest_name);
        favoriteDTO.setImage_url(image_url); // 이미지 URL
        favoriteDTO.setDescription(description); // 여행지 설명
        favoriteDTO.setAdded_date(new Timestamp(System.currentTimeMillis()));
        

        // 선호 여행지 추가/해제 로직 처리
        if (isAdd) {
            // 여행지 추가
            favoriteDAO.addFavorite(favoriteDTO);
        } else {
            // 여행지 해제
            // HashMap을 사용하여 ad_id, dest_id를 전달
            HashMap<String, String> map = new HashMap<>();
            map.put("ad_id", ad_id);
            map.put("dest_id", dest_id);
            favoriteDAO.removeFavorite(map);
        }
    }

    // ======================= [선호 여행지 목록 조회] =======================
	@Override
	public List<FavoriteDTO> favoriteList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
		String ad_id = (String)request.getSession().getAttribute("sessionID");
		
		List<FavoriteDTO> favoriteList = null;
		
		if(ad_id != null) {
			
			favoriteList = favoriteDAO.getFavoriteList(ad_id);
		}
		
		return favoriteList;
	}
    
    
}

