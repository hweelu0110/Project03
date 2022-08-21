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

COMMIT;


INSERT INTO EZEN.ALTO_CLASS
(CLASS_CODE, className, HOBBY_CODE, HOBBY_SUB_CODE, AREA_CODE, MANAGER, MEMBER_NUM, MEMBER_MAX, PRICE, IMGNAME, INTRO, REGIDATE, STARTDATE, ENDDATE, CURRICULUM, TEACHERINFO)
VALUES('000001', '테스트 클래스', 'hm000001', 'hs010001', 'area0001', 'test', 0 , 99, 100000, '', '테스트 중입니다', sysdate , '2022-07-01', '2022-08-24', '테스트 중입니다', '테스트 중입니다');

INSERT INTO EZEN.ALTO_CLASS
(CLASS_CODE, className, HOBBY_CODE, HOBBY_SUB_CODE, AREA_CODE, MANAGER, MEMBER_NUM, MEMBER_MAX, PRICE, IMGNAME, INTRO, REGIDATE, STARTDATE, ENDDATE, CURRICULUM, TEACHERINFO)
VALUES('000002', '테스트 클래스2', 'hm000002', 'hs020001', 'area0002', 'test', 0 , 80, 200000, '', '테스트 중입니다2', sysdate , '2022-06-15', '2022-08-20', '테스트 중입니다2', '테스트 중입니다2');

INSERT INTO EZEN.ALTO_ITEM
(ITEM_CODE, HOBBY_CODE, HOBBY_SUB_CODE, ITEM_NAME, PRICE, REGIDATE, IMGNAME, INTRO, ITEM_COUNT, QUANTITY)
VALUES('000001', 'hm000001', 'hs010001', '테스트 취미용품', 10000, sysdate , '', '상품 소개', 0 , 0);

