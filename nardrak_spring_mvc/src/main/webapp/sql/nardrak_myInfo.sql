 
-- =================[ 1:1 문의 내역 (고객ver) 테이블 ]================================
DROP TABLE inquiryCS_tb CASCADE CONSTRAINTS;
CREATE TABLE inquiryCS_tb( 
    i_num           VARCHAR2(36)    PRIMARY KEY,        -- 문의 ID (고유 ID - 중복되지 않는 UUID)
    i_title         VARCHAR2(250)   NOT NULL,		    -- 문의 제목 (한글기준 80자)
    i_category      VARCHAR2(50)    NOT NULL,           -- 문의 유형   
	i_content       VARCHAR2(600)   NOT NULL,		    -- 문의 내용 (한글기준 200자)
    i_imgUpload     VARCHAR2(300),                      -- 파일 첨부 (한글기준 100자)
    i_writeDate     TIMESTAMP       DEFAULT sysdate,	-- 작성일
    cs_id           VARCHAR2(10)    NOT NULL,           -- 회원 ID(작성자)(FK)
    CONSTRAINT fk_inquiry_cs_id FOREIGN KEY (cs_id) REFERENCES customer_tb(cs_id)
    ON DELETE CASCADE
);

-- =================[ 1:1 문의 내역 (고객ver) insert 예시(sql) ]================================
INSERT INTO inquiryCS_tb 
VALUES (RAWTOHEX(SYS_GUID()),'부산에 대한 이미지 변경 부탁드려요', '찜한 상품', '이미지가 구려요, 다른 걸로 변경해주세요', '/nardrak_mvc/resources/upload/myInfo/myInfo_Inquiry/스크린샷 2025-02-14 113950.png', DEFAULT, 'hello2');

COMMIT;

--inquiryCS_tb 조회
SELECT * FROM inquiryCS_tb;

-- =================[ 1:1 문의 내역 (고객ver)  + Customer 테이블 조인]================================
-- 외래키인 cs_id를 join하여, 문의내역과 사용자 정보를 불러온다. 
SELECT CS.cs_id,  
       CS.cs_email,
       CS.cs_phone,
       iCS.i_num, 
       iCS.i_title,
       iCS.i_category,
       iCS.i_content,
       iCS.i_imgUpload,
       iCS.i_writeDate
FROM customer_tb CS
INNER JOIN inquiryCS_tb iCS
ON CS.cs_id = iCS.cs_id  
WHERE CS.cs_id = 'hello2';

-- =================[ 1:1 문의 답변 내역 (관리자ver) 테이블 ]================================
DROP TABLE inquiryAD_tb CASCADE CONSTRAINTS;
CREATE TABLE inquiryAD_tb( 
    adI_num           VARCHAR2(36)    PRIMARY KEY,        -- 답변 ID (고유 ID - 중복되지 않는 UUID)
	adI_reply         VARCHAR2(600)   NOT NULL,		      -- 관리자 답변 내용 (한글기준 200자)
    adI_replyDate     TIMESTAMP       DEFAULT sysdate,    -- 관리자 답변 일시
    adI_status        VARCHAR2(10)    NOT NULL,           -- 문의 상태(pending 대기중, answered 답변 완료)
    i_num             VARCHAR2(36)    NOT NULL,           -- 문의 ID (FK)
    ad_id             VARCHAR2(10)    NOT NULL,           -- 관리자 ID(작성자)(FK)
    CONSTRAINT fk_inum_inquiryCS_tb FOREIGN KEY (i_num) REFERENCES inquiryCS_tb(i_num)
    ON DELETE CASCADE,
    CONSTRAINT fk_ad_id_inquiryAD_tb FOREIGN KEY (ad_id) REFERENCES admin_tb(ad_id)
    ON DELETE CASCADE
);

-- =================[ 1:1 문의 답변 내역 (관리자ver-마케팅 부서 담당) insert (sql) ]================================
INSERT INTO inquiryAD_tb 
VALUES (RAWTOHEX(SYS_GUID()),'oo으로 이미지 변경 완료하였습니다. 추가적으로 변경을 다시 하고 싶으시면, 다시 문의해주세요.', DEFAULT, 'pending', '6070865DEFC94D4F8CD1A6594B952262', 'test1');

COMMIT;

-- 마케팅 부서 관리자 조회  
SELECT * 
  FROM admin_tb
  WHERE ad_dep = 'CS004';

-- inquiryAD_tb 조회
SELECT * FROM inquiryAD_tb;

-- =======[ 1:1 문의 내역 테이블(고객ver) + Customer 테이블 조인 + 1:1 문의 답변 내역 (관리자ver) + Admin 테이블 조인 ]================================
-- 문의내역과 답변 내역을 모두 조회하는 구문, 해당 구문에서 매퍼에서 필요한 데이터만 select해서 dto에 뿌릴 예정
SELECT CS.cs_id,  
       CS.cs_email,
       CS.cs_phone,
       iCS.i_num, 
       iCS.i_title,
       iCS.i_category,
       iCS.i_content,
       iCS.i_imgUpload,
       iCS.i_writeDate,
       AD.ad_id,
       AD.ad_dep,
       iAD.adI_num,
       iAD.adI_reply,
       iAD.adI_replyDate,
       iAD.adI_status
FROM customer_tb CS
JOIN inquiryCS_tb iCS 
  ON CS.cs_id = iCS.cs_id
JOIN inquiryAD_tb iAD 
  ON iCS.i_num = iAD.i_num
JOIN admin_tb AD 
  ON AD.ad_id = iAD.ad_id
WHERE CS.cs_id = 'hello2'
  AND AD.ad_id = 'test1';


  
