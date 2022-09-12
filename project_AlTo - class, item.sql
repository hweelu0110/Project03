-- Ŭ����
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

CREATE SEQUENCE seq_class START WITH 000100 INCREMENT BY 1;

ALTER TABLE alto_class ADD CONSTRAINT alto_class_fk FOREIGN KEY (hobby_code)
REFERENCES alto_hobby (hobby_code);

ALTER TABLE alto_class ADD CONSTRAINT alto_class_fk2 FOREIGN KEY (hobby_sub_code)
REFERENCES alto_hobby_sub (hobby_sub_code);

ALTER TABLE alto_class ADD CONSTRAINT alto_class_fk3 FOREIGN KEY (area_code)
REFERENCES alto_area (area_code);

ALTER TABLE alto_class ADD CONSTRAINT alto_class_fk4 FOREIGN KEY (manager)
REFERENCES alto_member (mem_id);



-- Ŭ���� �̹���
DROP TABLE alto_class_image CASCADE CONSTRAINT;
CREATE TABLE alto_class_image (
	imageFileNO		number(10)	PRIMARY KEY,
	imageFileName	varchar2(50),
	regDate			DATE		DEFAULT sysdate,
	class_code		char(8),
	CONSTRAINT FK_CLASSCODE FOREIGN KEY(class_code)
	REFERENCES alto_class(class_code) ON DELETE CASCADE
);



-- ��̿�ǰ
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

CREATE SEQUENCE seq_item START WITH 000100 INCREMENT BY 1;

ALTER TABLE alto_item ADD CONSTRAINT alto_item_fk FOREIGN KEY (hobby_code)
REFERENCES alto_hobby (hobby_code);

ALTER TABLE alto_item ADD CONSTRAINT alto_item_fk2 FOREIGN KEY (hobby_sub_code)
REFERENCES alto_hobby_sub (hobby_sub_code);



-- ��̿�ǰ �̹���
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