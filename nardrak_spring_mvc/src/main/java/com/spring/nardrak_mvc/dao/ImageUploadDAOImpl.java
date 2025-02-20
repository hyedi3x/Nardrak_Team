package com.spring.nardrak_mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.nardrak_mvc.dto.ImageUploadDTO;

@Repository
public class ImageUploadDAOImpl implements ImageUploadDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 패키지명 변수에 담아 매핑
	String namespace = "com.spring.nardrak_mvc.dao.ImageUploadDAO.";

	// 현재 등록된 사진 가져오기
	@Override
	public List<ImageUploadDTO> getImages() {
		System.out.println("DAO getImages");
		
		List<ImageUploadDTO> images = sqlSession.selectList(namespace+"getImages");
		
		return images;
	}

	// 특정 이미지 가져오기(이미지 ID로 조회)
	@Override
	public ImageUploadDTO getImageById(int image_id) {
		System.out.println("DAO getImageById");
		
		return sqlSession.selectOne(namespace + "getImageById", image_id);
	} 
	
	// 이미지 정보 삽입
	@Override
	public int insertImage(ImageUploadDTO dto) {
		System.out.println("DAO insertImage");
		
		int insertCnt = sqlSession.insert(namespace+"insertImage", dto);
		
		return insertCnt;
	}
	
	// 이미지 업데이트
    @Override
    public void updateImage(ImageUploadDTO dto) {
        sqlSession.update(namespace + "updateImage", dto);
    }

    // 이미지 삭제
    @Override
    public void deleteImage(int image_id) {
        sqlSession.update(namespace + "deleteImage", image_id);
    }
}
