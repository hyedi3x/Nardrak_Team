package com.spring.nardrak_mvc.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class CustomerDTO {
	
		// 멤버변수 => 디폴트 생성자 => 매개변수 생성자 => getter, setter 생성 => toString 생성
		
		// 맴버변수
		private String cs_id;			//ID : 영어 소문자, 숫자로만 4~10자
		private String cs_pwd;			//비밀번호 : 영어, 숫자, 특수문자 조합 8~16자
		private String cs_name;			//이름
		private String cs_gender;		//성별
		private Date cs_birth;       	//생년월일
		private String cs_phone;		//핸드폰
		private String cs_zip;			//주소
		private String cs_email;		//이메일
		private String cs_tel;  		//지역 전화번호
		private String cs_user_num;		//유저 고유 번호
		private Timestamp cs_regDate; 	//가입일
		private String cs_terms;		//약관 동의
		private String delete_status;	//탈퇴자 여부(기본 N)
		private String login_session;	//일반회원 세션(기본 Customer)
		
		//기본 생성자
		public CustomerDTO() {
			super();
		}

		//매개변수 생성자
		public CustomerDTO(String cs_id, String cs_pwd, String cs_name, String cs_gender, Date cs_birth, String cs_phone,
				String cs_zip, String cs_email, String cs_tel, String cs_user_num, Timestamp cs_regDate, String cs_terms,
				String delete_status, String login_session) {
			super();
			this.cs_id = cs_id;
			this.cs_pwd = cs_pwd;
			this.cs_name = cs_name;
			this.cs_gender = cs_gender;
			this.cs_birth = cs_birth;
			this.cs_phone = cs_phone;
			this.cs_zip = cs_zip;
			this.cs_email = cs_email;
			this.cs_tel = cs_tel;
			this.cs_user_num = cs_user_num;
			this.cs_regDate = cs_regDate;
			this.cs_terms = cs_terms;
			this.delete_status = delete_status;
			this.login_session = login_session;
		}

		//getter setter
		public String getCs_id() {
			return cs_id;
		}

		public void setCs_id(String cs_id) {
			this.cs_id = cs_id;
		}

		public String getCs_pwd() {
			return cs_pwd;
		}

		public void setCs_pwd(String cs_pwd) {
			this.cs_pwd = cs_pwd;
		}

		public String getCs_name() {
			return cs_name;
		}

		public void setCs_name(String cs_name) {
			this.cs_name = cs_name;
		}

		public String getCs_gender() {
			return cs_gender;
		}

		public void setCs_gender(String cs_gender) {
			this.cs_gender = cs_gender;
		}

		public Date getCs_birth() {
			return cs_birth;
		}

		public void setCs_birth(Date cs_birth) {
			this.cs_birth = cs_birth;
		}

		public String getCs_phone() {
			return cs_phone;
		}

		public void setCs_phone(String cs_phone) {
			this.cs_phone = cs_phone;
		}

		public String getCs_zip() {
			return cs_zip;
		}

		public void setCs_zip(String cs_zip) {
			this.cs_zip = cs_zip;
		}

		public String getCs_email() {
			return cs_email;
		}

		public void setCs_email(String cs_email) {
			this.cs_email = cs_email;
		}

		public String getCs_tel() {
			return cs_tel;
		}

		public void setCs_tel(String cs_tel) {
			this.cs_tel = cs_tel;
		}

		public String getCs_user_num() {
			return cs_user_num;
		}

		public void setCs_user_num(String cs_user_num) {
			this.cs_user_num = cs_user_num;
		}

		public Timestamp getCs_regDate() {
			return cs_regDate;
		}

		public void setCs_regDate(Timestamp cs_regDate) {
			this.cs_regDate = cs_regDate;
		}

		public String getCs_terms() {
			return cs_terms;
		}

		public void setCs_terms(String cs_terms) {
			this.cs_terms = cs_terms;
		}

		public String getDelete_status() {
			return delete_status;
		}

		public void setDelete_status(String delete_status) {
			this.delete_status = delete_status;
		}

		public String getLogin_session() {
			return login_session;
		}

		public void setLogin_session(String login_session) {
			this.login_session = login_session;
		}
		
		//toString
		@Override
		public String toString() {
			return "CustomerDTO [cs_id=" + cs_id + ", cs_pwd=" + cs_pwd + ", cs_name=" + cs_name + ", cs_gender="
					+ cs_gender + ", cs_birth=" + cs_birth + ", cs_phone=" + cs_phone + ", cs_zip=" + cs_zip + ", cs_email="
					+ cs_email + ", cs_tel=" + cs_tel + ", cs_user_num=" + cs_user_num + ", cs_regDate=" + cs_regDate
					+ ", cs_terms=" + cs_terms + ", delete_status=" + delete_status + ", login_session=" + login_session
					+ "]";
		}
}
