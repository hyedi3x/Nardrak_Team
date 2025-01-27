-- 1. 사용자 계정생성 
create user nardrak_spring_mvc identified by tiger default tablespace users;

-- 2. 사용자 권한 부여
grant connect, resource, create view, create session to nardrak_spring_mvc;

-- 3. 락 해제
alter user nardrak_spring_mvc account unlock;

SELECT * FROM login_tb;

-- 관리자 계정 생성 TBL

-- 아이디  : 5~20자 영문 소문자, 숫자, 특수기호 _
-- 비밀번호 : 8~16자 영문 대/소문자 숫자 특수문자 
-- 생년월일: 8자리 숫자
-- 성별 필수 (남, 여, 선택안함)
-- 나이 : 만 14세 미만 불가
-- 핸드폰 : 관리자 계정은 필수
-- 관리자 타입 : admin_dep : 부서를 넣는 컬럼 
DROP TABLE user_admin_tb;
CREATE TABLE user_admin_tb(
    id      VARCHAR2(20)    PRIMARY KEY,     -- 아이디
    pwd     VARCHAR2(16)    NOT NULL,       -- 비밀번호
    name    VARCHAR2(30)    NOT NULL,       -- 전화번호
    birth   VARCHAR2(6)     NOT NULL,       -- 생년월일
    phone   VARCHAR2(13)    NOT NULL,       -- 전화번호
    email   VARCHAR2(30)    NOT NULL,       -- 이메일
    tel     VARCHAR2(13),                   -- 사내 전화번호
    no      VARCHAR2(20)    NOT NULL,       -- 사번
    dep     VARCHAR2(10)    NOT NULL,       -- 부서코드
    regDate DATE    DEFAULT sysdate,        -- 가입일
    del_st  CHAR(1) DEFAULT 'N'   NOT NULL, -- 권한상태
    login_session VARCHAR2(20)    NOT NULL,     -- 권한 세션
    CONSTRAINT tbl_fk FOREIGN KEY(login_session) REFERENCES login_tb(login_session)
    ON DELETE CASCADE
);

SELECT * FROM user_admin_tb;

INSERT INTO user_admin_tb (id, pwd, name, birth, phone, email, tel, no, dep, regDate, del_st, login_session)
    VALUES('아이디1', '1234', '홍길동', '000101', '010-1234-5678', 'seoul@visit.com', '02-111-2222', 'A0001', '명소', sysdate, 'N', 'Admin');

commit;