package com.spring.nardrak_mvc.dto;

import java.sql.Timestamp;

public class ImageUploadDTO {
	
	private int image_id;			// 이미지 고유 ID
	private String image_path;		// 이미지 경로
	private Timestamp upload_date;	// 업로드 날짜
	private String image_show;		// 이미지 표시 여부(기본값 'Y')
	private String image_uploader;	// 이미지 업로드한 관리자
	private String image_detail;		// 이미지에 대한 부연 설명
	
	// 디폴트 생성자
	public ImageUploadDTO() {
		super();
	}
	
	// 매개변수 생성자
	public ImageUploadDTO(int image_id, String image_path, Timestamp upload_date, String image_show,
			String image_uploader, String image_detail) {
		super();
		this.image_id = image_id;
		this.image_path = image_path;
		this.upload_date = upload_date;
		this.image_show = image_show;
		this.image_uploader = image_uploader;
		this.image_detail = image_detail;
	}
	
	public int getImage_id() {
		return image_id;
	}
	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public Timestamp getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Timestamp upload_date) {
		this.upload_date = upload_date;
	}
	public String getImage_show() {
		return image_show;
	}
	public void setImage_show(String image_show) {
		this.image_show = image_show;
	}
	public String getImage_uploader() {
		return image_uploader;
	}
	public void setImage_uploader(String image_uploader) {
		this.image_uploader = image_uploader;
	}
	public String getImage_detail() {
		return image_detail;
	}
	public void setImage_detail(String image_detail) {
		this.image_detail = image_detail;
	}
	
	@Override
	public String toString() {
		return "ImageUploadDTO [image_id=" + image_id + ", image_path=" + image_path + ", upload_date=" + upload_date
				+ ", image_show=" + image_show + ", image_uploader=" + image_uploader + ", image_detail=" + image_detail
				+ "]";
	}
	
}
