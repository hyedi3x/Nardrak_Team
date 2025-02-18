package com.spring.nardrak_mvc.dao;

import java.util.List;

import com.spring.nardrak_mvc.dto.ImageUploadDTO;

public interface ImageUploadDAO {

	// 이미지 정보 삽입
	public int insertImage(ImageUploadDTO dto);
	
	// 등록된 사진 가져오기
	public List<ImageUploadDTO> getImages();
	
	// 특정 이미지 가져오기
    public ImageUploadDTO getImageById(int image_id);
    
    // 이미지 변경
    public void updateImage(ImageUploadDTO dto);

    // 이미지 삭제
    public void deleteImage(int image_id);
}
