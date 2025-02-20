package com.spring.nardrak_mvc.dto;

import java.sql.Timestamp;

public class FavoriteDTO {

	private String cs_id;			// 사용자 ID (외래키 - 고객)
	private int dest_id;			// 여행지 ID
	private String dest_name;		// 여행지 이름
	private String image_url;		// 여행지 이미지 URL
	private String description;		// 여행지 설명
	private Timestamp added_date; 	// 찜한 날짜
	
	// 디폴트 생성자
	public FavoriteDTO() {
		super();
	}

	public FavoriteDTO(String cs_id, int dest_id, String dest_name, String image_url, String description,
			Timestamp added_date) {
		super();
		this.cs_id = cs_id;
		this.dest_id = dest_id;
		this.dest_name = dest_name;
		this.image_url = image_url;
		this.description = description;
		this.added_date = added_date;
	}

	public String getCs_id() {
		return cs_id;
	}

	public void setCs_id(String cs_id) {
		this.cs_id = cs_id;
	}

	public int getDest_id() {
		return dest_id;
	}

	public void setDest_id(int dest_id) {
		this.dest_id = dest_id;
	}

	public String getDest_name() {
		return dest_name;
	}

	public void setDest_name(String dest_name) {
		this.dest_name = dest_name;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getAdded_date() {
		return added_date;
	}

	public void setAdded_date(Timestamp added_date) {
		this.added_date = added_date;
	}

	@Override
	public String toString() {
		return "FavoriteDTO [cs_id=" + cs_id + ", dest_id=" + dest_id + ", dest_name=" + dest_name + ", image_url="
				+ image_url + ", description=" + description + ", added_date=" + added_date + "]";
	}
	
	
}

