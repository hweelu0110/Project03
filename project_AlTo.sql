-- 취미
DROP TABLE alto_hobby CASCADE CONSTRAINT;
CREATE TABLE alto_hobby(
	hobby_code	char(8) NOT NULL,
	name		varchar2(20) NOT NULL,
	PRIMARY KEY (hobby_code)
);

-- 취미 정보 추가
INSERT INTO alto_hobby VALUES ('hm000001','창작');
INSERT INTO alto_hobby VALUES ('hm000002','액티비티');
INSERT INTO alto_hobby VALUES ('hm000003','아웃도어');
INSERT INTO alto_hobby VALUES ('hm000004','요리');
INSERT INTO alto_hobby VALUES ('hm000005','게임');
INSERT INTO alto_hobby VALUES ('hm000006','음악');
INSERT INTO alto_hobby VALUES ('hm000007','문화');
INSERT INTO alto_hobby VALUES ('hm000008','여행');
INSERT INTO alto_hobby VALUES ('hm000009','봉사');
INSERT INTO alto_hobby VALUES ('hm000010','사진/영상');
INSERT INTO alto_hobby VALUES ('hm000011','직무/커리어');
INSERT INTO alto_hobby VALUES ('hm000012','차/오토바이');
INSERT INTO alto_hobby VALUES ('hm000013','반려동물');
INSERT INTO alto_hobby VALUES ('hm000014','수집');
INSERT INTO alto_hobby VALUES ('hm000015','자유주제');

SELECT * FROM alto_hobby

-- 소분류 취미
DROP TABLE alto_hobby_sub CASCADE CONSTRAINT;
CREATE TABLE alto_hobby_sub(
	hobby_sub_code	char(8) NOT NULL,
	hobby_code		char(8) NOT NULL,
	name			varchar2(30) NOT NULL,
	PRIMARY KEY (hobby_sub_code)
);

ALTER TABLE alto_hobby_sub ADD CONSTRAINT hobby_sub_fk FOREIGN KEY (hobby_code)
REFERENCES alto_hobby (hobby_code);

-- 소분류 취미 정보 추가
INSERT INTO alto_hobby_sub VALUES ('hs010001','hm000001','드로잉');
INSERT INTO alto_hobby_sub VALUES ('hs010002','hm000001','플라워아트');
INSERT INTO alto_hobby_sub VALUES ('hs010003','hm000001','캘리그라피');
INSERT INTO alto_hobby_sub VALUES ('hs010004','hm000001','뜨개/자수');
INSERT INTO alto_hobby_sub VALUES ('hs010005','hm000001','도예');
INSERT INTO alto_hobby_sub VALUES ('hs010006','hm000001','캔들/디퓨저');
INSERT INTO alto_hobby_sub VALUES ('hs010007','hm000001','비누/화장품');
INSERT INTO alto_hobby_sub VALUES ('hs010008','hm000001','목공/라탄');
INSERT INTO alto_hobby_sub VALUES ('hs010009','hm000001','가죽공예');
INSERT INTO alto_hobby_sub VALUES ('hs010010','hm000001','악세사리/레진');
INSERT INTO alto_hobby_sub VALUES ('hs010011','hm000001','메이크업/네일');
INSERT INTO alto_hobby_sub VALUES ('hs010012','hm000001','키덜트/프라모델');
INSERT INTO alto_hobby_sub VALUES ('hs010013','hm000001','기타');

INSERT INTO alto_hobby_sub VALUES ('hs020001','hm000002','헬스/PT/GX');
INSERT INTO alto_hobby_sub VALUES ('hs020002','hm000002','요가/필라테스');
INSERT INTO alto_hobby_sub VALUES ('hs020003','hm000002','러닝');
INSERT INTO alto_hobby_sub VALUES ('hs020004','hm000002','자전거');
INSERT INTO alto_hobby_sub VALUES ('hs020005','hm000002','댄스/무용');
INSERT INTO alto_hobby_sub VALUES ('hs020006','hm000002','클라이밍');
INSERT INTO alto_hobby_sub VALUES ('hs020007','hm000002','스쿠버다이빙/수영');
INSERT INTO alto_hobby_sub VALUES ('hs020008','hm000002','스키/보드');
INSERT INTO alto_hobby_sub VALUES ('hs020009','hm000002','야외스포츠');
INSERT INTO alto_hobby_sub VALUES ('hs020010','hm000002','구기스포츠');
INSERT INTO alto_hobby_sub VALUES ('hs020011','hm000002','실내스포츠');

INSERT INTO alto_hobby_sub VALUES ('hs030001','hm000003','등산');
INSERT INTO alto_hobby_sub VALUES ('hs030002','hm000003','캠핑/백패킹');
INSERT INTO alto_hobby_sub VALUES ('hs030003','hm000003','낚시');
INSERT INTO alto_hobby_sub VALUES ('hs030004','hm000003','트래킹');

INSERT INTO alto_hobby_sub VALUES ('hs040001','hm000004','나라별');
INSERT INTO alto_hobby_sub VALUES ('hs040002','hm000004','베이킹');
INSERT INTO alto_hobby_sub VALUES ('hs040003','hm000004','와인');
INSERT INTO alto_hobby_sub VALUES ('hs040004','hm000004','커피/티');
INSERT INTO alto_hobby_sub VALUES ('hs040005','hm000004','주류');
INSERT INTO alto_hobby_sub VALUES ('hs040006','hm000004','펫푸드');

INSERT INTO alto_hobby_sub VALUES ('hs050001','hm000005','온라인게임');
INSERT INTO alto_hobby_sub VALUES ('hs050002','hm000005','보드게임');

INSERT INTO alto_hobby_sub VALUES ('hs060001','hm000006','보컬');
INSERT INTO alto_hobby_sub VALUES ('hs060002','hm000006','기타');
INSERT INTO alto_hobby_sub VALUES ('hs060003','hm000006','드럼');
INSERT INTO alto_hobby_sub VALUES ('hs060004','hm000006','피아노');
INSERT INTO alto_hobby_sub VALUES ('hs060005','hm000006','그외 악기연주');
INSERT INTO alto_hobby_sub VALUES ('hs060006','hm000006','밴드/합주');
INSERT INTO alto_hobby_sub VALUES ('hs060007','hm000006','작사/작곡');
INSERT INTO alto_hobby_sub VALUES ('hs060008','hm000006','클래식');
INSERT INTO alto_hobby_sub VALUES ('hs060009','hm000006','재즈');
INSERT INTO alto_hobby_sub VALUES ('hs060010','hm000006','랩/힙합/DJ');
INSERT INTO alto_hobby_sub VALUES ('hs060011','hm000006','그외 장르');

INSERT INTO alto_hobby_sub VALUES ('hs070001','hm000007','공연');
INSERT INTO alto_hobby_sub VALUES ('hs070002','hm000007','전시');
INSERT INTO alto_hobby_sub VALUES ('hs070003','hm000007','영화');
INSERT INTO alto_hobby_sub VALUES ('hs070004','hm000007','도서');
INSERT INTO alto_hobby_sub VALUES ('hs070005','hm000007','파티/페스티벌');
INSERT INTO alto_hobby_sub VALUES ('hs070006','hm000007','연극/공연제작');

INSERT INTO alto_hobby_sub VALUES ('hs080001','hm000008','국내');
INSERT INTO alto_hobby_sub VALUES ('hs080002','hm000008','해외');
INSERT INTO alto_hobby_sub VALUES ('hs080003','hm000008','맛집/명소');
INSERT INTO alto_hobby_sub VALUES ('hs080004','hm000008','패키지');
INSERT INTO alto_hobby_sub VALUES ('hs080005','hm000008','정보공유');

INSERT INTO alto_hobby_sub VALUES ('hs090001','hm000009','양로원');
INSERT INTO alto_hobby_sub VALUES ('hs090002','hm000009','보육원');
INSERT INTO alto_hobby_sub VALUES ('hs090003','hm000009','환경');
INSERT INTO alto_hobby_sub VALUES ('hs090004','hm000009','사회');
INSERT INTO alto_hobby_sub VALUES ('hs090005','hm000009','재능기부');
INSERT INTO alto_hobby_sub VALUES ('hs090006','hm000009','유기동물보호');

INSERT INTO alto_hobby_sub VALUES ('hs100001','hm000010','DSLR');
INSERT INTO alto_hobby_sub VALUES ('hs100002','hm000010','필름카메라');
INSERT INTO alto_hobby_sub VALUES ('hs100003','hm000010','디지털카메라');
INSERT INTO alto_hobby_sub VALUES ('hs100004','hm000010','영상제작');

INSERT INTO alto_hobby_sub VALUES ('hs110001','hm000011','직군모임');
INSERT INTO alto_hobby_sub VALUES ('hs110002','hm000011','스피치/발성');
INSERT INTO alto_hobby_sub VALUES ('hs110003','hm000011','시험/자격증');
INSERT INTO alto_hobby_sub VALUES ('hs110004','hm000011','취업스터디');
INSERT INTO alto_hobby_sub VALUES ('hs110005','hm000011','어학스터디');
INSERT INTO alto_hobby_sub VALUES ('hs110006','hm000011','기타');

INSERT INTO alto_hobby_sub VALUES ('hs120001','hm000012','현대');
INSERT INTO alto_hobby_sub VALUES ('hs120002','hm000012','기아');
INSERT INTO alto_hobby_sub VALUES ('hs120003','hm000012','르노');
INSERT INTO alto_hobby_sub VALUES ('hs120004','hm000012','GM');
INSERT INTO alto_hobby_sub VALUES ('hs120005','hm000012','쌍용');
INSERT INTO alto_hobby_sub VALUES ('hs120006','hm000012','일본차');
INSERT INTO alto_hobby_sub VALUES ('hs120007','hm000012','미국차');
INSERT INTO alto_hobby_sub VALUES ('hs120008','hm000012','유럽차');
INSERT INTO alto_hobby_sub VALUES ('hs120009','hm000012','바이크');

INSERT INTO alto_hobby_sub VALUES ('hs130001','hm000013','강아지');
INSERT INTO alto_hobby_sub VALUES ('hs130002','hm000013','고양이');
INSERT INTO alto_hobby_sub VALUES ('hs130003','hm000013','물고기');
INSERT INTO alto_hobby_sub VALUES ('hs130004','hm000013','조류');
INSERT INTO alto_hobby_sub VALUES ('hs130005','hm000013','파충류');
INSERT INTO alto_hobby_sub VALUES ('hs130006','hm000013','포유류');
INSERT INTO alto_hobby_sub VALUES ('hs130007','hm000013','기타');

INSERT INTO alto_hobby_sub VALUES ('hs140001','hm000014','동전/화폐');
INSERT INTO alto_hobby_sub VALUES ('hs140002','hm000014','우표');
INSERT INTO alto_hobby_sub VALUES ('hs140003','hm000014','피규어/장난감');
INSERT INTO alto_hobby_sub VALUES ('hs140004','hm000014','DP/LP');
INSERT INTO alto_hobby_sub VALUES ('hs140005','hm000014','운동화');
INSERT INTO alto_hobby_sub VALUES ('hs140006','hm000014','스티커/굿즈');
INSERT INTO alto_hobby_sub VALUES ('hs140007','hm000014','출판물');
INSERT INTO alto_hobby_sub VALUES ('hs140008','hm000014','기타');

-- 지역
DROP TABLE alto_area CASCADE CONSTRAINT;
CREATE TABLE alto_area(
	area_code	char(8) NOT NULL,
	name		varchar2(20) NOT NULL,
	PRIMARY KEY (area_code)
);

SELECT * FROM alto_area;
-- 지역 정보 추가
INSERT INTO ALTO_AREA VALUES ('area0001','온라인');
INSERT INTO ALTO_AREA VALUES ('area0002','강남구');
INSERT INTO ALTO_AREA VALUES ('area0003','강동구');
INSERT INTO ALTO_AREA VALUES ('area0004','강북구');
INSERT INTO ALTO_AREA VALUES ('area0005','강서구');

INSERT INTO ALTO_AREA VALUES ('area0006','관악구');
INSERT INTO ALTO_AREA VALUES ('area0007','광진구');
INSERT INTO ALTO_AREA VALUES ('area0008','구로구');
INSERT INTO ALTO_AREA VALUES ('area0009','금천구');
INSERT INTO ALTO_AREA VALUES ('area0010','노원구');

INSERT INTO ALTO_AREA VALUES ('area0011','도봉구');
INSERT INTO ALTO_AREA VALUES ('area0012','동대문구');
INSERT INTO ALTO_AREA VALUES ('area0013','동작구');
INSERT INTO ALTO_AREA VALUES ('area0014','마포구');
INSERT INTO ALTO_AREA VALUES ('area0015','서대문구');

INSERT INTO ALTO_AREA VALUES ('area0016','서초구');
INSERT INTO ALTO_AREA VALUES ('area0017','성동구');
INSERT INTO ALTO_AREA VALUES ('area0018','성북구');
INSERT INTO ALTO_AREA VALUES ('area0019','송파구');
INSERT INTO ALTO_AREA VALUES ('area0020','양천구');

INSERT INTO ALTO_AREA VALUES ('area0021','영등포구');
INSERT INTO ALTO_AREA VALUES ('area0022','용산구');
INSERT INTO ALTO_AREA VALUES ('area0023','은평구');
INSERT INTO ALTO_AREA VALUES ('area0024','종로구');
INSERT INTO ALTO_AREA VALUES ('area0025','중구');
INSERT INTO ALTO_AREA VALUES ('area0026','중랑구');

-- 회원
DROP TABLE alto_member CASCADE CONSTRAINT;
CREATE TABLE alto_member(
	mem_id	 varchar2(100) NOT NULL,
	mem_pwd	 varchar2(20) NOT NULL,
	mem_name varchar2(20) NOT NULL,
	gender	 char(1) 	 NOT NULL,
	birth	 DATE 		 NOT NULL,
	email	 varchar2(100) NOT NULL,
	phone	 char(11) NOT NULL,
	img		 varchar2(500) DEFAULT '기본이미지url',
	mem_open char(1) DEFAULT 'Y' NOT NULL,
	joindate DATE DEFAULT sysdate NOT NULL,
	authkey	 NUMBER DEFAULT 0 NOT NULL,
	PRIMARY KEY (mem_id)
);

-- 인증키 테이블
CREATE TABLE alto_member_auth(
	email	 varchar2(100) NOT NULL,
	authkey  varchar2(50)
);


-- 관심취미 대분류 최대 5개 / 소분류 (대분류 당)최대 5개
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

-- 활동지역 최대 3개
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

-- 모임
DROP TABLE alto_club CASCADE CONSTRAINT;
CREATE TABLE alto_club(
	club_code	char(8) NOT NULL,
	title	 	varchar2(100) NOT NULL,
	cate_m 		char(8) NOT NULL,
	cate_s	 	char(8) NOT NULL,
	area_code	char(8) NOT NULL,
	manager	 	varchar2(100) NOT NULL,
	member_num	number DEFAULT 1 NOT NULL,
	member_max	number DEFAULT 200 NOT NULL,
	img 		varchar2(500) DEFAULT '기본이미지url',
	intro 		varchar2(1000) NOT NULL,
	regidate 	DATE DEFAULT sysdate NOT NULL,
	member_out 	number DEFAULT 0 NOT NULL,
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

-- 가입
DROP TABLE alto_join CASCADE CONSTRAINT;
CREATE TABLE alto_join(
	join_code	char(8) NOT NULL,
	mem_id	 	varchar2(100) NOT NULL,
	club_code	char(8) NOT NULL,
	manager		char(1) DEFAULT 'N' NOT NULL,
	bookmark	char(1) DEFAULT 'Y' NOT NULL,
	regidate 	DATE DEFAULT sysdate NOT NULL,	
	PRIMARY KEY (join_code)
);

ALTER TABLE alto_join ADD CONSTRAINT join_member_fk FOREIGN KEY (mem_id)
REFERENCES alto_member (mem_id);

ALTER TABLE alto_join ADD CONSTRAINT join_club_fk FOREIGN KEY (club_code)
REFERENCES alto_club (club_code);

