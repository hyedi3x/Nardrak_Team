-- 세션 테이블 생성
-- 관리자, 고객
DROP TABLE session_tbl;
-- 세션 테이블 pk : Admin,Customer 구분, 그밖에 세션과 관련된 정보 넣을 테이블 
CREATE TABLE session_tbl(
    l_session   VARCHAR2(30) PRIMARY KEY,           -- customer, admin 구분 용
    session_num    NUMBER(2)    UNIQUE     NOT NULL    
);

SELECT * FROM session_tbl;

INSERT INTO session_tbl (session_num, l_session)
    VALUES (NVL((SELECT MAX(session_num)+1 FROM session_tbl),1), '관리자');
    
UPDATE session_tbl
SET l_session = '관리자'
WHERE session_num = 1;

DELETE session_tbl
WHERE session_num = 1;

-- 관리자 계정 생성 TBL

-- 아이디  : 5~20자 영문 소문자, 숫자, 특수기호 _
-- 비밀번호 : 8~16자 영문 대/소문자 숫자 특수문자 
-- 생년월일: 8자리 숫자
-- 성별 필수 (남, 여, 선택안함)
-- 나이 : 만 14세 미만 불가
-- 핸드폰 : 관리자 계정은 필수
-- 관리자 타입 : admin_dep : 부서를 넣는 컬럼 
DROP TABLE admin_tbl;
CREATE TABLE admin_tbl(
    ad_id      VARCHAR2(20)    PRIMARY KEY,     -- 아이디
    ad_pwd     VARCHAR2(16)    NOT NULL,       -- 비밀번호
    ad_name    VARCHAR2(30)    NOT NULL,       -- 이름
    ad_birth   VARCHAR2(8)     NOT NULL,       -- 생년월일-성별
    ad_phone   VARCHAR2(20)    UNIQUE  NOT NULL,   -- 통신사 & 전화번호
    ad_email   VARCHAR2(30)    UNIQUE  NOT NULL,   -- 이메일
    ad_tel     VARCHAR2(13)    UNIQUE,             -- 사내 전화번호
    ad_cpnum   VARCHAR2(20)    UNIQUE  NOT NULL,-- 사번
    ad_dep     VARCHAR2(30)    NOT NULL,       -- 부서코드
    ad_regDate DATE    DEFAULT sysdate,        -- 가입일
    ad_terms    VARCHAR2(8)    NOT NULL,       -- 약관동의 항목
    ad_permission  CHAR(1) DEFAULT 'N'     NOT NULL, -- 권한상태
    l_session VARCHAR2(20) DEFAULT '관리자' NOT NULL,     -- 권한 세션
    CONSTRAINT admin_tbl_fk FOREIGN KEY(l_session) REFERENCES session_tbl(l_session)
    ON DELETE CASCADE
);

SELECT * FROM admin_tbl
WHERE ad_id = 1
AND ad_pwd = 1
AND ad_permission = 'N';

-- 회원가입
INSERT INTO admin_tbl(ad_id, ad_pwd, ad_name, ad_birth, ad_phone, ad_email, ad_tel, ad_cpnum, ad_dep, ad_terms)
    VALUES('아이디2', '1234567891', '홍길동', '000101', '010-1222-5678','seoul2@visit.com', '02-1122-2222', 'A1111112', '자연관광부서', '1 2 3 4');

COMMIT;