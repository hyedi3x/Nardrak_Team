package com.spring.nardrak_mvc.dto;

import java.sql.Timestamp;

public class AdminDTO {
	
	// 멤버변수
	private String ad_id;			// 아이디
	private String ad_pwd; 			// 비밀번호
	private String ad_name; 		// 이름
	private String ad_birth; 		// 생년월일
	private String ad_phone; 		// 통신사 & 전화번호
	private String ad_email; 		// 이메일
	private String ad_zip; 		    // 우편번호, 기본주소, 상세주소 
	private String ad_tel; 			// 사내 전화번호
	private String ad_empnum; 		// 사번
	private String ad_dep; 			// 부서코드
	private Timestamp ad_regDate;   // 가입일
	private String ad_terms; 		// 약관동의 항목
	private String ad_permission; 	// 삭제상태
	private String l_session; 		// 계정권한 (admin)
	private String access_status;   // 관리자 권한
	private String rn;              // 페이지에 사용되는 RowNum
	private String delete_status;              // 페이지에 사용되는 RowNum
	private String timeDiff;              // 페이지에 사용되는 RowNum
	
	public AdminDTO() {}

	public AdminDTO(String ad_id, String ad_pwd, String ad_name, String ad_birth, String ad_phone, String ad_email,
			String ad_zip, String ad_tel, String ad_empnum, String ad_dep, Timestamp ad_regDate, String ad_terms,
			String ad_permission, String l_session, String access_status, String rn, String delete_status,
			String timeDiff) {
		super();
		this.ad_id = ad_id;
		this.ad_pwd = ad_pwd;
		this.ad_name = ad_name;
		this.ad_birth = ad_birth;
		this.ad_phone = ad_phone;
		this.ad_email = ad_email;
		this.ad_zip = ad_zip;
		this.ad_tel = ad_tel;
		this.ad_empnum = ad_empnum;
		this.ad_dep = ad_dep;
		this.ad_regDate = ad_regDate;
		this.ad_terms = ad_terms;
		this.ad_permission = ad_permission;
		this.l_session = l_session;
		this.access_status = access_status;
		this.rn = rn;
		this.delete_status = delete_status;
		this.timeDiff = timeDiff;
	}

	public String getAd_id() {
		return ad_id;
	}

	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}

	public String getAd_pwd() {
		return ad_pwd;
	}

	public void setAd_pwd(String ad_pwd) {
		this.ad_pwd = ad_pwd;
	}

	public String getAd_name() {
		return ad_name;
	}

	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}

	public String getAd_birth() {
		return ad_birth;
	}

	public void setAd_birth(String ad_birth) {
		this.ad_birth = ad_birth;
	}

	public String getAd_phone() {
		return ad_phone;
	}

	public void setAd_phone(String ad_phone) {
		this.ad_phone = ad_phone;
	}

	public String getAd_email() {
		return ad_email;
	}

	public void setAd_email(String ad_email) {
		this.ad_email = ad_email;
	}

	public String getAd_zip() {
		return ad_zip;
	}

	public void setAd_zip(String ad_zip) {
		this.ad_zip = ad_zip;
	}

	public String getAd_tel() {
		return ad_tel;
	}

	public void setAd_tel(String ad_tel) {
		this.ad_tel = ad_tel;
	}

	public String getAd_empnum() {
		return ad_empnum;
	}

	public void setAd_empnum(String ad_empnum) {
		this.ad_empnum = ad_empnum;
	}

	public String getAd_dep() {
		return ad_dep;
	}

	public void setAd_dep(String ad_dep) {
		this.ad_dep = ad_dep;
	}

	public Timestamp getAd_regDate() {
		return ad_regDate;
	}

	public void setAd_regDate(Timestamp ad_regDate) {
		this.ad_regDate = ad_regDate;
	}

	public String getAd_terms() {
		return ad_terms;
	}

	public void setAd_terms(String ad_terms) {
		this.ad_terms = ad_terms;
	}

	public String getAd_permission() {
		return ad_permission;
	}

	public void setAd_permission(String ad_permission) {
		this.ad_permission = ad_permission;
	}

	public String getL_session() {
		return l_session;
	}

	public void setL_session(String l_session) {
		this.l_session = l_session;
	}

	public String getAccess_status() {
		return access_status;
	}

	public void setAccess_status(String access_status) {
		this.access_status = access_status;
	}

	public String getRn() {
		return rn;
	}

	public void setRn(String rn) {
		this.rn = rn;
	}

	public String getDelete_status() {
		return delete_status;
	}

	public void setDelete_status(String delete_status) {
		this.delete_status = delete_status;
	}

	public String getTimeDiff() {
		return timeDiff;
	}

	public void setTimeDiff(String timeDiff) {
		this.timeDiff = timeDiff;
	}

	@Override
	public String toString() {
		return "AdminDTO [ad_id=" + ad_id + ", ad_pwd=" + ad_pwd + ", ad_name=" + ad_name + ", ad_birth=" + ad_birth
				+ ", ad_phone=" + ad_phone + ", ad_email=" + ad_email + ", ad_zip=" + ad_zip + ", ad_tel=" + ad_tel
				+ ", ad_empnum=" + ad_empnum + ", ad_dep=" + ad_dep + ", ad_regDate=" + ad_regDate + ", ad_terms="
				+ ad_terms + ", ad_permission=" + ad_permission + ", l_session=" + l_session + ", access_status="
				+ access_status + ", rn=" + rn + ", delete_status=" + delete_status + ", timeDiff=" + timeDiff + "]";
	}
	
}
