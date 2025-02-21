package com.spring.nardrak_mvc.dto;

public class ChooseDTO {

	private int ch_num;					// 번호
	private String ch_title1;			// 부연설명1 
	private String ch_title2;			// 부연설명 
	private String ch_image;			// 이미지 URL 
	private String ch_tags1;			// 태그 메시지1 
	private String ch_tags2;			// 태그 메시지2  
	private String ch_detail_image;		// 상세 이미지(상세페이지)
	private String ch_detail;	        // 상세정보
	
	// 디폴트 생성자
	public ChooseDTO() {
		super();
	}

	public ChooseDTO(int ch_num, String ch_title1, String ch_title2, String ch_image, String ch_tags1, String ch_tags2,
			String ch_detail_image, String ch_detail) {
		super();
		this.ch_num = ch_num;
		this.ch_title1 = ch_title1;
		this.ch_title2 = ch_title2;
		this.ch_image = ch_image;
		this.ch_tags1 = ch_tags1;
		this.ch_tags2 = ch_tags2;
		this.ch_detail_image = ch_detail_image;
		this.ch_detail = ch_detail;
	}

	
	public int getCh_num() {
		return ch_num;
	}

	public void setCh_num(int ch_num) {
		this.ch_num = ch_num;
	}

	public String getCh_title1() {
		return ch_title1;
	}

	public void setCh_title1(String ch_title1) {
		this.ch_title1 = ch_title1;
	}

	public String getCh_title2() {
		return ch_title2;
	}

	public void setCh_title2(String ch_title2) {
		this.ch_title2 = ch_title2;
	}

	public String getCh_image() {
		return ch_image;
	}

	public void setCh_image(String ch_image) {
		this.ch_image = ch_image;
	}

	public String getCh_tags1() {
		return ch_tags1;
	}

	public void setCh_tags1(String ch_tags1) {
		this.ch_tags1 = ch_tags1;
	}

	public String getCh_tags2() {
		return ch_tags2;
	}

	public void setCh_tags2(String ch_tags2) {
		this.ch_tags2 = ch_tags2;
	}

	public String getCh_detail_image() {
		return ch_detail_image;
	}

	public void setCh_detail_image(String ch_detail_image) {
		this.ch_detail_image = ch_detail_image;
	}

	public String getCh_detail() {
		return ch_detail;
	}

	public void setCh_detail(String ch_detail) {
		this.ch_detail = ch_detail;
	}

	@Override
	public String toString() {
		return "ChooseDTO [ch_num=" + ch_num + ", ch_title1=" + ch_title1 + ", ch_title2=" + ch_title2 + ", ch_image="
				+ ch_image + ", ch_tags1=" + ch_tags1 + ", ch_tags2=" + ch_tags2 + ", ch_detail_image="
				+ ch_detail_image + ", ch_detail=" + ch_detail + "]";
	}

	
	
}



