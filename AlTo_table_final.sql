-- (v) 취미 테이블 -------------------------------------------
DROP TABLE alto_hobby CASCADE CONSTRAINT;
CREATE TABLE alto_hobby(
	hobby_code	char(8) NOT NULL,
	name		varchar2(20) NOT NULL,
	PRIMARY KEY (hobby_code)
);


-- (v) 소분류 취미  -----------------------------------------
DROP TABLE alto_hobby_sub CASCADE CONSTRAINT;
CREATE TABLE alto_hobby_sub(
	hobby_sub_code	char(8) NOT NULL,
	hobby_code		char(8) NOT NULL,
	name			varchar2(30) NOT NULL,
	PRIMARY KEY (hobby_sub_code)
);

ALTER TABLE alto_hobby_sub ADD CONSTRAINT hobby_sub_fk FOREIGN KEY (hobby_code)
REFERENCES alto_hobby (hobby_code);


-- (v) 지역 테이블  --------------------------------------------
DROP TABLE alto_area CASCADE CONSTRAINT;
CREATE TABLE alto_area(
	area_code	char(8) NOT NULL,
	name		varchar2(20) NOT NULL,
	PRIMARY KEY (area_code)
);


-- (v) 회원 테이블  ---------------------------------------------
DROP TABLE alto_member CASCADE CONSTRAINT;
CREATE TABLE alto_member(
	mem_id	 varchar2(100) NOT NULL,
	mem_pwd	 varchar2(100) NOT NULL,
	mem_name varchar2(20) NOT NULL,
	gender	 char(1) 	 NOT NULL,
	birth	 DATE 		 NOT NULL,
	phone	 char(11),
	img		 varchar2(500),
	mem_open char(1) DEFAULT 'Y' NOT NULL,
	joindate DATE DEFAULT sysdate NOT NULL,
	authkey	 NUMBER DEFAULT 0 NOT NULL,
	member_id_yn varchar2(20),
	session_key varchar2(50) DEFAULT 'none',
	session_limit timestamp,
	del_yn   char(1) DEFAULT 'N' NOT NULL,
	PRIMARY KEY (mem_id)
);


-- (v) 인증키 테이블  --------------------------------------------
DROP TABLE ALTO_MEMBER_AUTH CASCADE CONSTRAINT;
CREATE TABLE alto_member_auth(
	mem_id	 varchar2(100) NOT NULL,
	authkey  varchar2(50)
);


-- (v) 내취미 테이블   --------------------------------------------
DROP TABLE alto_m_hobby CASCADE CONSTRAINT;
CREATE TABLE alto_m_hobby(
	m_hobby_code 	char(8) NOT NULL,
	mem_id	 	 	varchar2(100) NOT NULL,
	hobby_code	 	char(8) NOT NULL,
	hobby_sub_code	char(8),
	PRIMARY KEY (m_hobby_code)
);

ALTER TABLE alto_m_hobby ADD CONSTRAINT m_hobby_member_fk FOREIGN KEY (mem_id)
REFERENCES alto_member (mem_id);

ALTER TABLE alto_m_hobby ADD CONSTRAINT m_hobby_fk FOREIGN KEY (hobby_code)
REFERENCES alto_hobby (hobby_code);

ALTER TABLE alto_m_hobby ADD CONSTRAINT m_hobby_sub_fk FOREIGN KEY (hobby_sub_code)
REFERENCES alto_hobby_sub (hobby_sub_code);

-- (v) 관심취미코드(m_hobby_code)  일련번호 시퀀스 객체 생성 ------------
DROP SEQUENCE seq_Mhobby_code;
CREATE SEQUENCE seq_Mhobby_code
INCREMENT BY 1				
START WITH 1				
MINVALUE 1					
NOMAXVALUE					 
NOCYCLE 					
nocache						
;


-- (v) 활동지역 테이블 ------------------------------------------------ 
-- (최대 3개)
DROP TABLE alto_m_area CASCADE CONSTRAINT;
CREATE TABLE alto_m_area(
	m_area_code char(8) NOT NULL,
	area_code	char(8) NOT NULL,
	mem_id	 	varchar2(100) NOT NULL,
	PRIMARY KEY (m_area_code)
);

ALTER TABLE alto_m_area ADD CONSTRAINT m_area_fk FOREIGN KEY (area_code)
REFERENCES alto_area (area_code);

ALTER TABLE alto_m_area ADD CONSTRAINT m_area_member_fk FOREIGN KEY (mem_id)
REFERENCES alto_member (mem_id);

-- (v) 활동지역코드(m_area_code) 일련번호 시퀀스 객체 생성 --------------
DROP SEQUENCE seq_Marea_code;
CREATE SEQUENCE seq_Marea_code
INCREMENT BY 1				
START WITH 1				
MINVALUE 1					
NOMAXVALUE					 
NOCYCLE 					
nocache						
;


-- (v) 모임 테이블 -----------------------------------------------------
DROP TABLE alto_club CASCADE CONSTRAINT;
CREATE TABLE alto_club(
	club_code	NUMBER NOT NULL,
	title	 	varchar2(100) NOT NULL,
	cate_m 		char(8) NOT NULL,
	cate_s	 	char(8) NOT NULL,
	area_code	char(8) NOT NULL,
	manager	 	varchar2(100) NOT NULL,
	member_num	NUMBER DEFAULT 1 NOT NULL,
	member_max	NUMBER DEFAULT 200 NOT NULL,
	img 		varchar2(500) NOT NULL DEFAULT 'club_noImg.png',
	intro 		varchar2(1000) NOT NULL,
	regidate 	DATE DEFAULT sysdate NOT NULL,
	member_out 	NUMBER DEFAULT 0 NOT NULL,
	PRIMARY KEY (club_code)
);

ALTER TABLE alto_club ADD CONSTRAINT club_hobby_fk FOREIGN KEY (cate_m)
REFERENCES alto_hobby (hobby_code);

ALTER TABLE alto_club ADD CONSTRAINT club_hobby_sub_fk FOREIGN KEY (cate_s)
REFERENCES alto_hobby_sub (hobby_sub_code);

ALTER TABLE alto_club ADD CONSTRAINT club_area_fk FOREIGN KEY (area_code)
REFERENCES alto_area (area_code);

ALTER TABLE alto_club ADD CONSTRAINT club_member_fk FOREIGN KEY (manager)
REFERENCES alto_member (mem_id);

-- 모임코드(club_code) 일련번호 시퀀스 객체 생성 --------------------------
DROP SEQUENCE seq_club_code;
CREATE SEQUENCE seq_club_code
INCREMENT BY 1				
START WITH 1				
MINVALUE 1					
NOMAXVALUE					 
NOCYCLE 					
nocache	
;


-- (v) 관심 테이블 --------------------------------------------------------
DROP TABLE alto_like CASCADE CONSTRAINT;
CREATE TABLE alto_like(
	like_code	char(8) NOT NULL,
	mem_id	 	varchar2(100) NOT NULL,
	club_code	NUMBER,
	class_code	char(8),
	item_code	char(8),
	PRIMARY KEY (like_code)
);

ALTER TABLE alto_like ADD CONSTRAINT like_club_fk FOREIGN KEY (club_code)
REFERENCES alto_club (club_code);

ALTER TABLE alto_like ADD CONSTRAINT like_class_fk FOREIGN KEY (class_code)
REFERENCES alto_class (class_code);

ALTER TABLE alto_like ADD CONSTRAINT like_item_fk FOREIGN KEY (item_code)
REFERENCES alto_item (item_code);

-- (v) 관심코드(like_code) 일련번호 시퀀스 객체 생성 --------------------------
DROP SEQUENCE seq_like_code;
CREATE SEQUENCE seq_like_code
INCREMENT BY 1				
START WITH 1				
MINVALUE 1					
NOMAXVALUE					 
NOCYCLE 					
nocache						
;


-- 가입 테이블
DROP TABLE alto_join CASCADE CONSTRAINT;
CREATE TABLE alto_join(
	join_code	NUMBER NOT NULL,
	mem_id	 	varchar2(100) NOT NULL,
	club_code	NUMBER NOT NULL,
	manager		char(1) DEFAULT 'N' NOT NULL,
	bookmark	char(1) DEFAULT 'Y' NOT NULL,
	regidate 	DATE DEFAULT sysdate NOT NULL,	
	PRIMARY KEY (join_code)
);

ALTER TABLE alto_join ADD CONSTRAINT join_member_fk FOREIGN KEY (mem_id)
REFERENCES alto_member (mem_id);

ALTER TABLE alto_join ADD CONSTRAINT join_club_fk FOREIGN KEY (club_code)
REFERENCES alto_club (club_code);


--게시판
DROP TABLE alto_club_notice CASCADE CONSTRAINTS;
CREATE TABLE alto_club_notice(
	club_code NUMBER NOT NULL
	,notice_num NUMBER NOT NULL PRIMARY key
	,category varchar2(10) NOT NULL
	,title varchar2(200) NOT NULL
	,contents varchar2(2000) NOT NULL
	,mem_id varchar2(100) NOT NULL
	,FileName varchar2(200) 
	,comment_num NUMBER DEFAULT 0
	,like_num NUMBER DEFAULT 0
	,regidate DATE DEFAULT sysdate NOT NULL
	,score NUMBER DEFAULT 0
	,CONSTRAINT alto_club_notice_fk FOREIGN KEY (club_code) REFERENCES alto_club (club_code)
	,CONSTRAINT alto_club_notice_member_fk FOREIGN KEY (mem_id) REFERENCES alto_member(mem_id)
);

-- 다중 파일 업로드
DROP TABLE alto_File CASCADE CONSTRAINTS;
CREATE TABLE alto_File(
	FileNO number(10) PRIMARY KEY
	,FileName varchar2(50)
	,regDate DATE DEFAULT sysdate 
	,notice_num  number(10) 
	,CONSTRAINT FK_notice_num FOREIGN key(notice_num) REFERENCES alto_club_notice (notice_num) ON DELETE CASCADE
);

-- 게시물번호(notice_num) 일련번호 시퀀스 객체 생성 --------------------------
DROP SEQUENCE seq_notice_num;
CREATE SEQUENCE seq_notice_num
INCREMENT BY 1					
START WITH 1					
MINVALUE 1						
nomaxvalue						
nocycle							
nocache							
;


-- 사진첩
DROP TABLE alto_club_album CASCADE CONSTRAINT;
CREATE TABLE alto_club_album(
	club_code NUMBER NOT NULL
	,album_num NUMBER NOT NULL PRIMARY key
	,title VARCHAR2(200) NOT NULL
	,contents VARCHAR2(2000) NOT NULL
	,mem_id VARCHAR2(100) NOT NULL
	,imageFileName VARCHAR2(200) NOT NULL
	,comment_num NUMBER DEFAULT 0
	,like_num NUMBER DEFAULT 0
	,regidate DATE DEFAULT sysdate NOT NULL
	,score NUMBER DEFAULT 0
	,CONSTRAINT alto_club_album_fk FOREIGN KEY (club_code)
	REFERENCES alto_club(club_code)
	,CONSTRAINT alto_club_album_member_fk FOREIGN KEY (mem_id)
	REFERENCES alto_member(mem_id)
); 

-- 사진첩번호(album_num) 일련번호 시퀀스 객체 생성 --------------------------
DROP SEQUENCE seq_album_num;
CREATE SEQUENCE seq_album_num
INCREMENT BY 1					
START WITH 1					
MINVALUE 1						
nomaxvalue						
nocycle							
nocache							
;

-- 다중 파일 업로드
DROP TABLE alto_imageFile CASCADE CONSTRAINTS;
CREATE TABLE alto_imageFile(
	imageFileNO number(10) PRIMARY KEY
	,imageFileName varchar2(50)
	,regDate DATE DEFAULT sysdate 
	,album_num  number(10) 
);

ALTER TABLE alto_imageFile ADD CONSTRAINT FK_album_num  
FOREIGN key(album_num) REFERENCES alto_club_album (album_num) ON DELETE CASCADE;


-- 클래스
DROP TABLE alto_class CASCADE CONSTRAINT;
CREATE TABLE alto_class (
	class_code		char(8)			PRIMARY KEY,
	className		varchar2(100)	NOT NULL,
	hobby_code		char(8)			NOT NULL,
	hobby_sub_code	char(8),
	area_code		char(8)			NOT NULL,
	manager			varchar2(100)	NOT NULL,
	member_num		NUMBER			DEFAULT 0 NOT NULL,
	member_max		NUMBER			NOT NULL,
	price			NUMBER			NOT NULL,
	imgName			varchar2(500),
	intro			varchar2(1000)	NOT NULL,
	regidate		DATE			DEFAULT sysdate NOT NULL,
	startdate		DATE			NOT NULL,
	enddate			DATE			NOT NULL,
	curriculum		varchar2(1000)	NOT NULL,
	teacherInfo		varchar2(1000)	NOT NULL
);

ALTER TABLE alto_class ADD CONSTRAINT alto_class_fk FOREIGN KEY (hobby_code)
REFERENCES alto_hobby (hobby_code);

ALTER TABLE alto_class ADD CONSTRAINT alto_class_fk2 FOREIGN KEY (hobby_sub_code)
REFERENCES alto_hobby_sub (hobby_sub_code);

ALTER TABLE alto_class ADD CONSTRAINT alto_class_fk3 FOREIGN KEY (area_code)
REFERENCES alto_area (area_code);

ALTER TABLE alto_class ADD CONSTRAINT alto_class_fk4 FOREIGN KEY (manager)
REFERENCES alto_member (mem_id);

-- 클래스 이미지
DROP TABLE alto_class_image CASCADE CONSTRAINT;
CREATE TABLE alto_class_image (
	imageFileNO		number(10)	PRIMARY KEY,
	imageFileName	varchar2(50),
	regDate			DATE		DEFAULT sysdate,
	class_code		char(8),
	CONSTRAINT FK_CLASSCODE FOREIGN KEY(class_code)
	REFERENCES alto_class(class_code) ON DELETE CASCADE
);


-- 취미용품
DROP TABLE alto_item CASCADE CONSTRAINT;
CREATE TABLE alto_item (
	item_code		char(8)			PRIMARY KEY,
	hobby_code		char(8)			NOT NULL,
	hobby_sub_code	char(8),
	item_name		varchar2(100)	NOT NULL,
	price			NUMBER			NOT NULL,
	regidate		DATE			DEFAULT sysdate NOT NULL,
	imgName			varchar2(500),
	intro			varchar2(1000)	NOT NULL,
	item_count		NUMBER			DEFAULT 0 NOT NULL,
	quantity		NUMBER			NOT NULL
);

ALTER TABLE alto_item ADD CONSTRAINT alto_item_fk FOREIGN KEY (hobby_code)
REFERENCES alto_hobby (hobby_code);

ALTER TABLE alto_item ADD CONSTRAINT alto_item_fk2 FOREIGN KEY (hobby_sub_code)
REFERENCES alto_hobby_sub (hobby_sub_code);

-- 취미용품 이미지
DROP TABLE alto_item_image CASCADE CONSTRAINT;
CREATE TABLE alto_item_image (
	imageFileNO		number(10)	PRIMARY KEY,
	imageFileName	varchar2(50),
	regDate			DATE		DEFAULT sysdate,
	item_code		char(8),
	CONSTRAINT FK_ITEMCODE FOREIGN KEY(item_code)
	REFERENCES alto_item(item_code) ON DELETE CASCADE
);


------------- 클래스리뷰
DROP TABLE alto_class_review CASCADE CONSTRAINT;
CREATE TABLE alto_class_review (
	cmt_num			number			PRIMARY KEY,
	cmt_writer		varchar2(100)	NOT NULL,
	cmt_star		number			NOT NULL,
	cmt_content		varchar2(4000)	NOT NULL,
	cmt_class		char(8)			NOT NULL,
	cmt_regdate		DATE			DEFAULT sysdate NOT NULL
);

CREATE SEQUENCE seq_class_review START WITH 20 INCREMENT BY 1;

ALTER TABLE alto_class_review ADD CONSTRAINT alto_class_review_fk FOREIGN KEY (cmt_class)
REFERENCES ALTO_CLASS (class_code);


-- 취미용품 리뷰
DROP TABLE alto_item_review CASCADE CONSTRAINT;
CREATE TABLE alto_item_review (
	cmt_num			number			PRIMARY KEY,
	cmt_writer		varchar2(100)	NOT NULL,
	cmt_star		number			NOT NULL,
	cmt_content		varchar2(4000)	NOT NULL,
	cmt_item		char(8)			NOT NULL,
	cmt_regdate		DATE			DEFAULT sysdate NOT NULL
);

CREATE SEQUENCE seq_item_review START WITH 20 INCREMENT BY 1;

ALTER TABLE alto_item_review ADD CONSTRAINT alto_item_review_fk FOREIGN KEY (cmt_item)
REFERENCES ALTO_ITEM (item_code);


-- 클래스, 취미용품 장바구니
DROP TABLE alto_cart CASCADE CONSTRAINT;
CREATE TABLE alto_cart (
	cart_num		number			PRIMARY KEY,
	mem_id	 varchar2(100) NOT NULL,
	goods_type		varchar2(100)	NOT NULL,
	goods_code		char(8)			NOT NULL,
	quantity		number			NOT NULL
);

CREATE SEQUENCE seq_cart START WITH 10 INCREMENT BY 1;

ALTER TABLE alto_cart ADD CONSTRAINT alto_cart_fk FOREIGN KEY (mem_id)
REFERENCES alto_member (mem_id);


-- 주문 테이블
DROP TABLE alto_order CASCADE CONSTRAINT;
CREATE TABLE alto_order (
	orderId			number			PRIMARY KEY,
	memberId		varchar2(100)	NOT NULL,
	zipcode			varchar2(100)	NOT NULL,
	address			varchar2(2000)	NOT NULL,
	dis_address		varchar2(2000)	NOT NULL,
	orderState		varchar2(100)	NOT NULL,
	orderDate		DATE 			DEFAULT sysdate NOT NULL
);

CREATE SEQUENCE seq_order START WITH 1000 INCREMENT BY 1;


-- 주문아이템 테이블
DROP TABLE alto_order_item CASCADE CONSTRAINT;
CREATE TABLE alto_order_item (
	orderId			number			NOT NULL,
	goods_type		varchar2(100)	NOT NULL,
	goods_code		char(8)			NOT NULL,
	price			NUMBER			NOT NULL,
	quantity		number			NOT NULL
);
