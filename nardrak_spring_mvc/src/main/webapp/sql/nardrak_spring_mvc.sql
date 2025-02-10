-- ==============[계정생성(System 계정에서)]==============
-- SYSTEM계정에서 계정 생성

-- 1. 계정생성 : nardrak_spring_mvc 계정생성
-- create user <계정이름> identified by <계정암호> default tablespace users;
create user  nardrak_spring_mvc identified by tiger default tablespace users;

-- 2. 사용자 권한 부여
-- grant [시스템 권한] to [계정];
grant connect, resource, create view to nardrak_spring_mvc;

-- 3. 락 해제
-- alter user <계정이름> account unlock;
alter user nardrak_spring_mvc account unlock;

-- 4. 계정 잘못만든 경우 계정, 객체 삭제하기 
-- drop user <계정이름> cascade;
-- drop user nardrak_spring_mvc cascade; 

---- 5. 패스워드 변경
----alter user <계정이름> identified by <패스워드>;
-- alter user nardrak_spring_mvc identified by tiger; 

-- ==================[공통 호스트 사용]==================
-- : 외부 호스트로 작업 (ipconfig)
-- nardrak_spring_mvc 계정에서 작업

-- ==================[로그인 테이블]=====================
-- drop
DROP TABLE login_tb CASCADE CONSTRAINTS;  

-- create
CREATE TABLE login_tb (
    login_session VARCHAR2(10) PRIMARY KEY
);

-- insert (Admin & Customer)
INSERT INTO login_tb(login_session)
   VALUES ('Admin');

INSERT INTO login_tb(login_session)
   VALUES ('Customer');

-- commit
COMMIT;

-- 조회 
SELECT * FROM login_tb;

-- --------------[세션 넘버 컬럼 추가]-------------------
-- 컬럼을 alter한 후 인서트 작업을 위해 기존 값 delete
DELETE login_tb;

-- 컬럼 별 번호 추가
ALTER TABLE login_tb
ADD session_num NUMBER(2)  UNIQUE  NOT NULL; 

-- 관리자, 고객 컬럼 추가
INSERT INTO login_tb (session_num, login_session)
    VALUES (NVL((SELECT MAX(session_num)+1 FROM login_tb),1), 'Admin');

INSERT INTO login_tb (session_num, login_session)
    VALUES (NVL((SELECT MAX(session_num)+1 FROM login_tb),1), 'Customer');

-- ==================[관리자 등록 테이블]=====================
-- 테이블 생성
-- 아이디  : 영어 소문자, 숫자로만 4~10자
-- 비밀번호 : 8~16자 영문 대/소문자 숫자 특수문자 
-- 이름
-- 생년월일 : 6자리 & 만 14세 미만 등록 불가
-- 핸드폰 : 통신사 000-0000-0000 형식
-- 이메일 : 000@000 형식
-- 주소 : 우편번호, 기본주소, 상세주소 형식
-- 사내전화번호 : 9~11자
-- 사번
-- 부서코드
-- 가입일 : DEFAULT sysdate
-- 약관동의: 1 2 3 4 형식
-- 권한 상태 : DEFAULT 'N' 
-- 권한 세션 : 'Admin', FOREIGN KEY, REPERNECES login_tb(login_session), ON DELETE CASCADE
-- 권한 세션 : DEFAULT 'Admin', FOREIGN KEY, REPERNECES login_tb(login_session), ON DELETE CASCADE
DROP TABLE admin_tb;
CREATE TABLE admin_tb(
    ad_id          VARCHAR2(10)    PRIMARY KEY,        -- 아이디
    ad_pwd         VARCHAR2(16)    NOT NULL,           -- 비밀번호
    ad_name        VARCHAR2(30)    NOT NULL,           -- 이름
    ad_birth       VARCHAR2(6)     NOT NULL,           -- 생년월일-성별
    ad_phone       VARCHAR2(20)    UNIQUE  NOT NULL,   -- 통신사 & 전화번호
    ad_email       VARCHAR2(30)    UNIQUE  NOT NULL,   -- 이메일
    ad_zip         VARCHAR2(250)   NOT NULL,           -- 우편번호, 기본주소, 상세주소
    ad_tel         VARCHAR2(13),                       -- 사내 전화번호
    ad_empnum      VARCHAR2(20)   UNIQUE  NOT NULL,    -- 사번
    ad_dep         VARCHAR2(30)    NOT NULL,           -- 부서코드
    ad_regDate     TIMESTAMP    DEFAULT sysdate,       -- 가입일
    ad_terms       VARCHAR2(8)    NOT NULL,            -- 약관동의 항목
    delete_status  CHAR(1) DEFAULT 'N'     NOT NULL,   -- 관리자 탈퇴 여부 권한 상태 -> default에다가 인풋값이 아닌 컬럼이기에 기본 not null 상태, not null 조건 안주셔도 됩니다 
    access_status  CHAR(1) DEFAULT 'N',                -- 관리자 회원가입 권한 부여 
    login_session  VARCHAR2(20),                       -- 권한 세션
    CONSTRAINT admin_tb_login_fk 
        FOREIGN KEY(login_session) 
        REFERENCES login_tb(login_session) ON DELETE CASCADE
);

-- 관리자 등록 구문(sql)
INSERT INTO admin_tb(ad_id, ad_pwd, ad_name, ad_birth, ad_phone, ad_email, ad_zip, ad_tel, ad_empnum, ad_dep, ad_terms, login_session)
    VALUES('ad1234', 'ad12345678@!', '관리자', '000101', '010-1222-2222','seoul3@visit.com', '0000, 기본주소, 상세주소', '02-1234-1234', 'A1111113', '자연관광부서', '1 2 3 4', 'Admin');

-- 관리자 등록 구문(DAO 구문)
INSERT INTO admin_tb(ad_id, ad_pwd, ad_name, ad_birth, ad_phone, ad_email, ad_zip, ad_tel, ad_empnum, ad_dep, ad_terms, login_session)
		VALUES(#{ad_id}, #{ad_pwd}, #{ad_name}, #{ad_birth}, #{ad_phone}, #{ad_email}, #{ad_zip}, #{ad_tel}, #{ad_empnum}, #{ad_dep}, #{ad_terms}, 'Admin');

-- 관리자 등록 테이블 조회
SELECT * FROM admin_tb;

COMMIT;

-- 관리자 등록 시 아이디 중복 확인
SELECT COUNT(*) FROM admin_tb
WHERE ad_id = 'hyeri';

-- 관리자 등록 시 아이디 중복 확인(DAO 구문)
SELECT COUNT(*) FROM admin_tb WHERE ad_id = #{ad_id};

-- ==================[고객 회원가입 테이블]=====================
DROP TABLE customer_tb CASCADE CONSTRAINTS;
CREATE TABLE customer_tb(
    cs_id              VARCHAR2(10)    PRIMARY KEY,        -- ID : 영어 소문자, 숫자로만 4~10자
    cs_pwd             VARCHAR2(16)    NOT NULL,           -- 비밀번호 : 영어, 숫자, 특수문자 조합 8~16자
    cs_name            VARCHAR2(30)    NOT NULL,           -- 이름
    cs_gender          VARCHAR2(8)     NOT NULL,           -- 성별
    cs_birth           DATE            NOT NULL,           -- 생년월일  
    cs_phone           VARCHAR2(20)    UNIQUE NOT NULL,    -- 핸드폰  
    cs_zip             VARCHAR2(250)   NOT NULL,           -- 주소
    cs_email           VARCHAR2(30)    UNIQUE NOT NULL,    -- 이메일
    cs_tel             VARCHAR2(13)    UNIQUE,             -- 지역 전화번호
    cs_user_num        VARCHAR2(30),                       -- 유저 고유 번호
    cs_regDate         TIMESTAMP       DEFAULT sysdate,    -- 가입일
    cs_terms           VARCHAR(8)      NOT NULL,           -- 약관 동의
    delete_status      CHAR(1)         DEFAULT 'N',        -- 탈퇴자 여부 (기본 N)
    login_session      VARCHAR2(20)    NOT NULL,           -- 일반회원 세션
    CONSTRAINT customer_tb_fk_session FOREIGN KEY(login_session) REFERENCES login_tb(login_session)
    ON DELETE CASCADE
);

-- 고객 등록 테이블 조회
SELECT * FROM customer_tb;

-- 고객 회원가입 중복확인 조회(sql)
SELECT COUNT(*) 
  FROM customer_tb 
 WHERE cs_id ='111q';

-- 고객 회원가입 중복확인 조회(Spring 구문)
SELECT COUNT(*) 
  FROM customer_tb 
 WHERE cs_id = #{cs_id}

-- 고객 등록 구문(sql)
INSERT INTO customer_tb(cs_id, cs_pwd, cs_name, cs_gender, cs_birth, cs_phone, cs_zip, cs_email, cs_tel, cs_user_num, cs_regDate, cs_terms, delete_status, login_session)
    VALUES('hello','hello1234!','김헬로','male','2001-11-07','010-7777-7777','원효로','hello@naver.com','', TO_CHAR((SELECT NVL(MAX(cs_user_num)+1,1) FROM customer_tb)), sysdate, 'yes', DEFAULT, 'Customer');

-- 고객 등록 구문(Spring 구문)
INSERT INTO customer_tb(cs_id, cs_pwd, cs_name, cs_gender, cs_birth, cs_phone, cs_zip, cs_email, cs_tel, cs_user_num, cs_regDate, cs_terms, delete_status, login_session)
	 VALUES(#{cs_id},#{cs_pwd},#{cs_name},#{cs_gender},#{cs_birth},#{cs_phone},#{cs_zip},#{cs_email},#{cs_tel}, TO_CHAR((SELECT NVL(MAX(cs_user_num)+1,1) FROM customer_tb)), #{cs_regDate}, 'yes', DEFAULT,'Customer')

-- ==================[로그인 구문(고객)]=====================
-- 아이디, 비밀번호 확인 (sql)
SELECT COUNT(*)
  FROM customer_tb
 WHERE cs_id='kil123' AND cs_pwd='kil1234$' AND login_session='Customer' AND delete_status='N';	

-- 아이디, 비밀번호 확인 (Spring 구문)
SELECT cs_id, cs_pwd, login_session, delete_status 
  FROM customer_tb
 WHERE cs_id=#{strId} AND cs_pwd=#{strPwd} AND login_session='Customer' AND delete_status='N';	


-- ==================[로그인 구문(관리자)]=====================
SELECT COUNT(*)
  FROM admin_tb
 WHERE ad_id='ad1234' AND ad_pwd='ad12345678@!' AND login_session='Admin' AND delete_status='N' AND access_status='N';
 
SELECT COUNT(*)
  FROM admin_tb
 WHERE ad_id=#{strId} AND ad_pwd=#{strPwd} AND login_session='Admin' AND delete_status='N' AND access_status='Y' 

