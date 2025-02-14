package com.spring.nardrak_mvc.service;

import java.util.HashMap;

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
        String ad_id = request.getParameter("ad_id");      // 사용자 ID
        String dest_id = request.getParameter("dest_id");  // 여행지 ID
        String dest_name = request.getParameter("dest_name"); // 여행지 이름
        String image_url = request.getParameter("image_url"); // 이미지 URL
        String description = request.getParameter("description"); // 여행지 설명
        boolean isAdd = "true".equals(request.getParameter("isAdd")); // 체크박스 값 (선호 여행지 추가 여부)

        // DTO 생성 및 값 설정
        FavoriteDTO favoriteDTO = new FavoriteDTO();
        favoriteDTO.setAd_id(ad_id);
        favoriteDTO.setDest_id(dest_id);
        favoriteDTO.setDest_name(dest_name);
        favoriteDTO.setImage_url(image_url); // 이미지 URL
        favoriteDTO.setDescription(description); // 여행지 설명

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
}

