package com.spring.nardrak_mvc.service;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.nardrak_mvc.dao.ImageUploadDAO;
import com.spring.nardrak_mvc.dto.ImageUploadDTO;

@Service // 서비스 클래스를 Spring Bean으로 등록
public class ImageUploadServiceImpl implements ImageUploadService {

    @Autowired
    private ImageUploadDAO dao;

    // 이미지 업로드 처리
    @Override
    public void uploadImage(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        System.out.println("Service uploadImage"); // 로그 출력 (업로드 시작)

        // 업로드된 이미지 파일을 MultipartFile 객체로 가져옴
        MultipartFile file = request.getFile("ad_img");

        // 저장될 디렉토리 경로 설정 (서버의 resources/upload/admin 폴더)
        String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/admin/");
        
        try {
            // 업로드된 파일을 서버의 지정된 디렉토리에 저장
            file.transferTo(new File(saveDir + file.getOriginalFilename()));

            // 이미지 경로와 업로드 날짜 설정
            ImageUploadDTO dto = new ImageUploadDTO(); // 새로운 DTO 객체 생성
            String image_path = "/nardrak_mvc/resources/upload/admin/" + file.getOriginalFilename(); // 상대 경로로 설정
            dto.setImage_path(image_path); // 이미지 경로 설정

            // 현재 시간을 업로드 날짜로 설정
            dto.setUpload_date(new Timestamp(System.currentTimeMillis()));
            
            // 업로드한 사람과 이미지 설명을 설정
            dto.setImage_uploader(request.getParameter("image_uploader"));
            dto.setImage_detail(request.getParameter("image_detail"));

            // DB에 이미지 정보 저장
            dao.insertImage(dto);

        } catch (Exception e) {
            e.printStackTrace(); // 예외 발생 시 로그 출력
        }
    }

    // 현재 등록된 사진 가져오기
    @Override
    public void getImages(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        System.out.println("Service getImages"); // 로그 출력 (이미지 가져오기 시작)

        // DAO를 통해 DB에서 이미지 목록 가져오기
        List<ImageUploadDTO> images = dao.getImages();

        // 모델에 이미지를 추가하여 뷰로 전달
        model.addAttribute("images", images); // 이미지 목록을 모델에 추가
    }

    // 이미지 정보 수정 처리
    @Override
    public void updateImage(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        System.out.println("Service updateImage"); // 로그 출력 (이미지 수정 시작)

        // 수정할 이미지의 ID와 새로 업로드된 이미지 파일을 받음
        int imageId = Integer.parseInt(request.getParameter("imageId")); // 수정할 이미지 ID
        MultipartFile file = request.getFile("ad_img"); // 새 이미지 파일
        String hiddenPath = request.getParameter("hiddenPath"); // 기존 이미지 경로
        
        // 저장될 디렉토리 경로 설정 (서버의 resources/upload/admin 폴더)
        String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/admin/");
        
		String upload_img = "";
        
        // DB에서 기존 이미지 정보 가져오기
        ImageUploadDTO existingImage = dao.getImageById(imageId); // 기존 이미지 정보 조회

        // 이미지를 바꿀 경우
        if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
            try {
            	// 기존 이미지가 존재하는 경우
                if (existingImage != null) {
                    
                    // 새 이미지를 지정된 디렉토리에 저장
                    File saveFile = new File(saveDir + file.getOriginalFilename()); // 새 파일 경로 설정
                    file.transferTo(saveFile); // 파일을 서버에 저장

                    upload_img = "/nardrak_mvc/resources/upload/admin/" + file.getOriginalFilename();
                }
            } catch (Exception e) {
                e.printStackTrace(); // 예외 처리
            }
        } else { 
            // 기존 이미지 사용 (새로운 이미지가 업로드되지 않았을 경우)
            upload_img = hiddenPath;
        }

        // 새 이미지 경로와 업로드 날짜 설정
        ImageUploadDTO dto = new ImageUploadDTO(); // 새로운 DTO 객체 생성
        dto.setImage_path(upload_img); // 이미지 경로 설정
        dto.setUpload_date(new Timestamp(System.currentTimeMillis())); // 업로드 날짜 설정
        dto.setImage_id(imageId); // 수정할 이미지 ID 설정
        dto.setImage_detail(request.getParameter("image_rewrite")); // 수정된 이미지 설명 설정
        
        // DB에서 기존 이미지를 새로운 정보로 업데이트
        dao.updateImage(dto);
    }

    // 이미지 정보 삭제 처리
    @Override
    public void deleteImage(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        System.out.println("Service deleteImage"); // 로그 출력 (이미지 삭제 시작)

        // 삭제할 이미지 ID를 요청 파라미터에서 받음
        int imageId = Integer.parseInt(request.getParameter("imageId")); // 삭제할 이미지 ID

        // DB에서 기존 이미지 정보 가져오기
        ImageUploadDTO existingImage = dao.getImageById(imageId); // 기존 이미지 정보 조회

        if (existingImage != null) { // 기존 이미지가 존재하는 경우

            // 기존 이미지 경로에서 파일명 추출
            String existingFilePath = existingImage.getImage_path(); // 기존 이미지 경로
            String fileName = existingFilePath.substring(existingFilePath.lastIndexOf("/") + 1); // 파일명 추출

            String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/admin/");
            File existingFile = new File(saveDir + fileName);

            // 기존 파일이 존재하면 삭제
            if (existingFile.exists()) { // 파일이 존재하면
                existingFile.delete(); // 파일 삭제
            }

            // DB에서 해당 이미지 삭제
            dao.deleteImage(imageId); // DB에서 이미지 정보 삭제
        }
    }
}
