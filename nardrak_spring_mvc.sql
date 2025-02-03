-- [ 1. 세션 테이블 컬럼 넘버 추가 ] --

-- NOT NULL 컬럼을 추가 하기 위한 나머지 컬럼 초기화
DELETE login_tb;

-- 컬럼 별 번호 추가
ALTER TABLE login_tb
ADD session_num NUMBER(2)  UNIQUE  NOT NULL; 

-- 관리자, 고객 컬럼 추가
INSERT INTO login_tb (session_num, login_session)
    VALUES (NVL((SELECT MAX(session_num)+1 FROM login_tb),1), 'Admin');

INSERT INTO login_tb (session_num, login_session)
    VALUES (NVL((SELECT MAX(session_num)+1 FROM login_tb),1), 'Customer');

-- 결과 조회
SELECT * FROM login_tb;

-- [ 2. 관리자 등록 ] --

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
-- 권한 상태 : DEFAULT 'Y'  -> DEFAULT 'N' 
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
    delete_status  CHAR(1) DEFAULT 'N'     NOT NULL,   -- 권한상태 -> default에다가 인풋값이 아닌 컬럼이기에 기본 not null 상태, not null 조건 안주셔도 됩니다 
    login_session  VARCHAR2(20),                       -- 권한 세션
    CONSTRAINT admin_tb_fk FOREIGN KEY(login_session) REFERENCES login_tb(login_session)
    ON DELETE CASCADE
);

-- 관리자 등록 시 아이디 중복 확인
SELECT COUNT(*) FROM admin_tb
WHERE ad_id = '아이디';

-- 관리자 등록 실행
INSERT INTO admin_tb(ad_id, ad_pwd, ad_name, ad_birth, ad_phone, ad_email, ad_zip, ad_tel, ad_empnum, ad_dep, ad_terms, login_session)
    VALUES('hyeri', '1234567891', '홍길동', '000101', '010-1222-2222','seoul3@visit.com', '0000, 기본주소, 상세주소', '02-1234-1234', 'A1111113', '자연관광부서', '1 2 3 4', 'Admin');

-- 등록 확인
SELECT * FROM admin_tb;

COMMIT;