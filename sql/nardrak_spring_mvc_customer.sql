--------------------------------------------------------
---------------------- 회원가입 -------------------------
--------------------------------------------------------

DROP TABLE user_customer_tb  CASCADE CONSTRAINTS;
CREATE TABLE user_customer_tb(
    user_id         VARCHAR2(20)    PRIMARY KEY,       -- ID
    user_pwd        VARCHAR2(20)    NOT NULL,          -- 비밀번호
    user_name       VARCHAR2(30)    NOT NULL,          -- 이름
    user_gender     VARCHAR2(10)    NOT NULL,          -- 성별
    user_birth      DATE            NOT NULL,          -- 생년월일   
    user_ph         VARCHAR2(13)    NOT NULL,          -- 핸드폰  
    user_addr       VARCHAR2(100)   NOT NULL,          -- 주소
    user_email      VARCHAR2(30),                      -- 이메일
    user_tel        VARCHAR2(13),                      -- 지역 전화번호
    user_no         VARCHAR2(20),                      -- 유저 고유 번호 
    user_regDate    TIMESTAMP       DEFAULT sysdate,   -- 가입일
    del_status      VARCHAR2(10)    DEFAULT 'N'        -- 탈퇴자 여부 (기본 N)
);



SELECT * FROM user_customer_tb;

SELECT COUNT(*) FROM user_customer_tb;

-- sql 회원가입 INSERT
INSERT INTO user_customer_tb(user_id, user_pwd, user_name, user_gender, user_birth, user_ph, user_addr, user_email, user_tel, user_no, user_regDate, user_delete)
VALUES('aa','aa12','에이','남','971207','010-6385-8467','한남동','aa@naver.com',((SELECT NVL(MAX(user_no)+1,1) FROM nadrak_spring_mvc)),default,default);


-- spring mapper 회원가입
INSERT INTO user_customer_tb(user_id, user_pwd, user_name, user_gender, user_birth, user_ph, user_addr, user_email, user_tel, user_no, user_regDate, user_delete)
VALUES(?,?,?,?,?,?,?,?,?,((SELECT NVL(MAX(user_no)+1,1) FROM nadrak_spring_mvc)),default,default);



COMMIT;

SELECT NVL(MAX(user_no)+1,1) FROM user_customer_tb;