package com.spring.nardrak_mvc.dto;

import java.sql.Timestamp;

public class CustomerDeleteDTO {
	
	private String cs_id;         	// 회원 ID
    private String cs_del_terms;    // 탈퇴 동의 여부
    private String cs_drCode;       // 탈퇴 사유 코드
    private String cs_etc_cmmt;     // 기타 사유
    private Timestamp cs_del_date;  // 탈퇴 처리 일시
	
    //기본 생성자
    public CustomerDeleteDTO() {
		super();
	}

    //매개변수 생성자
	public CustomerDeleteDTO(String cs_id, String cs_del_terms, String cs_drCode, String cs_etc_cmmt,
			Timestamp cs_del_date) {
		super();
		this.cs_id = cs_id;
		this.cs_del_terms = cs_del_terms;
		this.cs_drCode = cs_drCode;
		this.cs_etc_cmmt = cs_etc_cmmt;
		this.cs_del_date = cs_del_date;
	}

	//getter, setter
	public String getCs_id() {
		return cs_id;
	}

	public void setCs_id(String cs_id) {
		this.cs_id = cs_id;
	}

	public String getCs_del_terms() {
		return cs_del_terms;
	}

	public void setCs_del_terms(String cs_del_terms) {
		this.cs_del_terms = cs_del_terms;
	}

	public String getCs_drCode() {
		return cs_drCode;
	}

	public void setCs_drCode(String cs_drCode) {
		this.cs_drCode = cs_drCode;
	}

	public String getCs_etc_cmmt() {
		return cs_etc_cmmt;
	}

	public void setCs_etc_cmmt(String cs_etc_cmmt) {
		this.cs_etc_cmmt = cs_etc_cmmt;
	}

	public Timestamp getCs_del_date() {
		return cs_del_date;
	}

	public void setCs_del_date(Timestamp cs_del_date) {
		this.cs_del_date = cs_del_date;
	}

	//toString
	@Override
	public String toString() {
		return "CustomerDeleteDTO [cs_id=" + cs_id + ", cs_del_terms=" + cs_del_terms + ", cs_drCode=" + cs_drCode
				+ ", cs_etc_cmmt=" + cs_etc_cmmt + ", cs_del_date=" + cs_del_date + "]";
	}

}
