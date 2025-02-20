package com.spring.nardrak_mvc.dto;

public class LocalDTO {
	private String local_title;			// 관광지 이름(제목 - PK)
    private String region;				// 지역
    private String description;			// 지역 부연설명
    private String local_tags;				// 태그 메시지
    private String local_detail;			// 상세정보
    private String local_image;			// 이미지 URL
    private double latitude;			// 위도
    private double longitude;			// 경도
	public String getLocal_title() {
		return local_title;
	}
	public void setLocal_title(String local_title) {
		this.local_title = local_title;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLocal_tags() {
		return local_tags;
	}
	public void setLocal_tags(String local_tags) {
		this.local_tags = local_tags;
	}
	public String getLocal_detail() {
		return local_detail;
	}
	public void setLocal_detail(String local_detail) {
		this.local_detail = local_detail;
	}
	public String getLocal_image() {
		return local_image;
	}
	public void setLocal_image(String local_image) {
		this.local_image = local_image;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	@Override
	public String toString() {
		return "LocalDTO [local_title=" + local_title + ", region=" + region + ", description=" + description
				+ ", local_tags=" + local_tags + ", local_detail=" + local_detail + ", local_image=" + local_image
				+ ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}
    
}
