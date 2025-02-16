package com.spring.nardrak_mvc.dto;

import java.sql.Timestamp;

public class InquiryDTO {
	
	// 멤버 변수 : customer inquiry (inquiryCS_tb)
	private String rn;              // 문의글 번호 정렬 위한 rowNum
    private String i_title;         // 문의 제목
    private String i_category;      // 문의 유형
    private String i_content;       // 문의 내용
    private String i_imgUpload;     // 파일 첨부 (이미지)
    private Timestamp i_writeDate;  // 작성일
    private String i_status;        // 답변 상태
    private String cs_id;           // 고객 ID(FK)

    // 멤버 변수 : admin response (inquiryAD_tb)
    private String adI_reply;       // 관리자 답변 내용
    private Timestamp adI_replyDate;// 답변 일시
    private String adI_status;      // 문의 상태 (pending, answered)
    private String ad_id;           // 관리자 ID(FK)
    private String ad_dep;          // 관리자 부서
    
    //디폴트 생성자
	public InquiryDTO() {
		super();
	}

	//매개변수 생성자
	public InquiryDTO(String rn, String i_title, String i_category, String i_content, String i_imgUpload,
			Timestamp i_writeDate, String i_status, String cs_id, String adI_reply, Timestamp adI_replyDate,
			String adI_status, String ad_id, String ad_dep) {
		super();
		this.rn = rn;
		this.i_title = i_title;
		this.i_category = i_category;
		this.i_content = i_content;
		this.i_imgUpload = i_imgUpload;
		this.i_writeDate = i_writeDate;
		this.i_status = i_status;
		this.cs_id = cs_id;
		this.adI_reply = adI_reply;
		this.adI_replyDate = adI_replyDate;
		this.adI_status = adI_status;
		this.ad_id = ad_id;
		this.ad_dep = ad_dep;
	}
	
	//getter setter
	public String getRn() {
		return rn;
	}

	public void setRn(String rn) {
		this.rn = rn;
	}

	public String getI_title() {
		return i_title;
	}

	public void setI_title(String i_title) {
		this.i_title = i_title;
	}

	public String getI_category() {
		return i_category;
	}

	public void setI_category(String i_category) {
		this.i_category = i_category;
	}

	public String getI_content() {
		return i_content;
	}

	public void setI_content(String i_content) {
		this.i_content = i_content;
	}

	public String getI_imgUpload() {
		return i_imgUpload;
	}

	public void setI_imgUpload(String i_imgUpload) {
		this.i_imgUpload = i_imgUpload;
	}

	public Timestamp getI_writeDate() {
		return i_writeDate;
	}

	public void setI_writeDate(Timestamp i_writeDate) {
		this.i_writeDate = i_writeDate;
	}

	public String getI_status() {
		return i_status;
	}

	public void setI_status(String i_status) {
		this.i_status = i_status;
	}

	public String getCs_id() {
		return cs_id;
	}

	public void setCs_id(String cs_id) {
		this.cs_id = cs_id;
	}

	public String getAdI_reply() {
		return adI_reply;
	}

	public void setAdI_reply(String adI_reply) {
		this.adI_reply = adI_reply;
	}

	public Timestamp getAdI_replyDate() {
		return adI_replyDate;
	}

	public void setAdI_replyDate(Timestamp adI_replyDate) {
		this.adI_replyDate = adI_replyDate;
	}

	public String getAdI_status() {
		return adI_status;
	}

	public void setAdI_status(String adI_status) {
		this.adI_status = adI_status;
	}

	public String getAd_id() {
		return ad_id;
	}

	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}

	public String getAd_dep() {
		return ad_dep;
	}

	public void setAd_dep(String ad_dep) {
		this.ad_dep = ad_dep;
	}

	//toString
	@Override
	public String toString() {
		return "InquiryDTO [rn=" + rn + ", i_title=" + i_title + ", i_category=" + i_category + ", i_content="
				+ i_content + ", i_imgUpload=" + i_imgUpload + ", i_writeDate=" + i_writeDate + ", i_status=" + i_status
				+ ", cs_id=" + cs_id + ", adI_reply=" + adI_reply + ", adI_replyDate=" + adI_replyDate + ", adI_status="
				+ adI_status + ", ad_id=" + ad_id + ", ad_dep=" + ad_dep + "]";
	}

}
