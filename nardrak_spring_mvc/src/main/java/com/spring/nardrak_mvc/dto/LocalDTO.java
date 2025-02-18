package com.spring.nardrak_mvc.dto;

public class LocalDTO {
	private String localTitle;			// 관광지 이름(제목 - PK)
    private String region;				// 지역
    private String description;			// 지역 부연설명
    private String tags;				// 태그 메시지
    private String localDetail;			// 상세정보
    private String localImage;			// 이미지 URL
    private double latitude;			// 위도
    private double longitude;			// 경도
	private String api_name;			// api 명칭	
    
	public String getLocalTitle() {
		return localTitle;
	}
	public void setLocalTitle(String localTitle) {
		this.localTitle = localTitle;
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
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getLocalDetail() {
		return localDetail;
	}
	public void setLocalDetail(String localDetail) {
		this.localDetail = localDetail;
	}
	public String getLocalImage() {
		return localImage;
	}
	public void setLocalImage(String localImage) {
		this.localImage = localImage;
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
	public String getApi_name() {
		return api_name;
	}
	public void setApi_name(String api_name) {
		this.api_name = api_name;
	}
	
	@Override
	public String toString() {
		return "LocalDTO [localTitle=" + localTitle + ", region=" + region + ", description=" + description + ", tags="
				+ tags + ", localDetail=" + localDetail + ", localImage=" + localImage + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", api_name=" + api_name + "]";
	}
    
    
}
