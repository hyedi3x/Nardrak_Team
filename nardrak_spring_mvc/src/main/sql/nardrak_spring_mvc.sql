-- 6. 계정생성(System 계정에서) 1. ~ 2.
-- 오라클 설치(SYSTEM/ORACLE) 
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
--drop user nardrak_spring_mvc cascade; 
--
---- 5. 패스워드 변경
----alter user <계정이름> identified by <패스워드>;
--alter user nardrak_spring_mvc identified by tiger; 

----------------------------------------------------------------------------------
-- 공통 호스트 사용 : 로컬 호스트로 작업 (ipconfig)
-- windows defender 방화벽 설정 또는 해제 (Windows Defender 방화벽 사용안함 설정)
-- 7. 테이블 생성
-- nardrak_spring_mvc 계정에서 작업
DROP TABLE login_tb CASCADE CONSTRAINTS;
CREATE TABLE login_tb (
    login_session VARCHAR2(10) PRIMARY KEY
);

INSERT INTO login_tb(login_session)
   VALUES ('Admin');

INSERT INTO login_tb(login_session)
   VALUES ('Customer');

COMMIT;

SELECT * FROM login_tb;

