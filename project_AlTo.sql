-- ���
DROP TABLE alto_hobby CASCADE CONSTRAINT;
CREATE TABLE alto_hobby(
	hobby_code	char(8) NOT NULL,
	name		varchar2(20) NOT NULL,
	PRIMARY KEY (hobby_code)
);

-- ��� ���� �߰�
INSERT INTO alto_hobby VALUES ('hm000001','â��');
INSERT INTO alto_hobby VALUES ('hm000002','��Ƽ��Ƽ');
INSERT INTO alto_hobby VALUES ('hm000003','�ƿ�����');
INSERT INTO alto_hobby VALUES ('hm000004','�丮');
INSERT INTO alto_hobby VALUES ('hm000005','����');
INSERT INTO alto_hobby VALUES ('hm000006','����');
INSERT INTO alto_hobby VALUES ('hm000007','��ȭ');
INSERT INTO alto_hobby VALUES ('hm000008','����');
INSERT INTO alto_hobby VALUES ('hm000009','����');
INSERT INTO alto_hobby VALUES ('hm000010','����/����');
INSERT INTO alto_hobby VALUES ('hm000011','����/Ŀ����');
INSERT INTO alto_hobby VALUES ('hm000012','��/�������');
INSERT INTO alto_hobby VALUES ('hm000013','�ݷ�����');
INSERT INTO alto_hobby VALUES ('hm000014','����');
INSERT INTO alto_hobby VALUES ('hm000015','��������');

SELECT * FROM alto_hobby

-- �Һз� ���
DROP TABLE alto_hobby_sub CASCADE CONSTRAINT;
CREATE TABLE alto_hobby_sub(
	hobby_sub_code	char(8) NOT NULL,
	hobby_code		char(8) NOT NULL,
	name			varchar2(30) NOT NULL,
	PRIMARY KEY (hobby_sub_code)
);

ALTER TABLE alto_hobby_sub ADD CONSTRAINT hobby_sub_fk FOREIGN KEY (hobby_code)
REFERENCES alto_hobby (hobby_code);

-- �Һз� ��� ���� �߰�
INSERT INTO alto_hobby_sub VALUES ('hs010001','hm000001','�����');
INSERT INTO alto_hobby_sub VALUES ('hs010002','hm000001','�ö����Ʈ');
INSERT INTO alto_hobby_sub VALUES ('hs010003','hm000001','Ķ���׶���');
INSERT INTO alto_hobby_sub VALUES ('hs010004','hm000001','�߰�/�ڼ�');
INSERT INTO alto_hobby_sub VALUES ('hs010005','hm000001','����');
INSERT INTO alto_hobby_sub VALUES ('hs010006','hm000001','ĵ��/��ǻ��');
INSERT INTO alto_hobby_sub VALUES ('hs010007','hm000001','��/ȭ��ǰ');
INSERT INTO alto_hobby_sub VALUES ('hs010008','hm000001','���/��ź');
INSERT INTO alto_hobby_sub VALUES ('hs010009','hm000001','���װ���');
INSERT INTO alto_hobby_sub VALUES ('hs010010','hm000001','�Ǽ��縮/����');
INSERT INTO alto_hobby_sub VALUES ('hs010011','hm000001','����ũ��/����');
INSERT INTO alto_hobby_sub VALUES ('hs010012','hm000001','Ű��Ʈ/�����');
INSERT INTO alto_hobby_sub VALUES ('hs010013','hm000001','��Ÿ');

INSERT INTO alto_hobby_sub VALUES ('hs020001','hm000002','�ｺ/PT/GX');
INSERT INTO alto_hobby_sub VALUES ('hs020002','hm000002','�䰡/�ʶ��׽�');
INSERT INTO alto_hobby_sub VALUES ('hs020003','hm000002','����');
INSERT INTO alto_hobby_sub VALUES ('hs020004','hm000002','������');
INSERT INTO alto_hobby_sub VALUES ('hs020005','hm000002','��/����');
INSERT INTO alto_hobby_sub VALUES ('hs020006','hm000002','Ŭ���̹�');
INSERT INTO alto_hobby_sub VALUES ('hs020007','hm000002','��������̺�/����');
INSERT INTO alto_hobby_sub VALUES ('hs020008','hm000002','��Ű/����');
INSERT INTO alto_hobby_sub VALUES ('hs020009','hm000002','�߿ܽ�����');
INSERT INTO alto_hobby_sub VALUES ('hs020010','hm000002','���⽺����');
INSERT INTO alto_hobby_sub VALUES ('hs020011','hm000002','�ǳ�������');

INSERT INTO alto_hobby_sub VALUES ('hs030001','hm000003','���');
INSERT INTO alto_hobby_sub VALUES ('hs030002','hm000003','ķ��/����ŷ');
INSERT INTO alto_hobby_sub VALUES ('hs030003','hm000003','����');
INSERT INTO alto_hobby_sub VALUES ('hs030004','hm000003','Ʈ��ŷ');

INSERT INTO alto_hobby_sub VALUES ('hs040001','hm000004','����');
INSERT INTO alto_hobby_sub VALUES ('hs040002','hm000004','����ŷ');
INSERT INTO alto_hobby_sub VALUES ('hs040003','hm000004','����');
INSERT INTO alto_hobby_sub VALUES ('hs040004','hm000004','Ŀ��/Ƽ');
INSERT INTO alto_hobby_sub VALUES ('hs040005','hm000004','�ַ�');
INSERT INTO alto_hobby_sub VALUES ('hs040006','hm000004','��Ǫ��');

INSERT INTO alto_hobby_sub VALUES ('hs050001','hm000005','�¶��ΰ���');
INSERT INTO alto_hobby_sub VALUES ('hs050002','hm000005','�������');

INSERT INTO alto_hobby_sub VALUES ('hs060001','hm000006','����');
INSERT INTO alto_hobby_sub VALUES ('hs060002','hm000006','��Ÿ');
INSERT INTO alto_hobby_sub VALUES ('hs060003','hm000006','�巳');
INSERT INTO alto_hobby_sub VALUES ('hs060004','hm000006','�ǾƳ�');
INSERT INTO alto_hobby_sub VALUES ('hs060005','hm000006','�׿� �Ǳ⿬��');
INSERT INTO alto_hobby_sub VALUES ('hs060006','hm000006','���/����');
INSERT INTO alto_hobby_sub VALUES ('hs060007','hm000006','�ۻ�/�۰�');
INSERT INTO alto_hobby_sub VALUES ('hs060008','hm000006','Ŭ����');
INSERT INTO alto_hobby_sub VALUES ('hs060009','hm000006','����');
INSERT INTO alto_hobby_sub VALUES ('hs060010','hm000006','��/����/DJ');
INSERT INTO alto_hobby_sub VALUES ('hs060011','hm000006','�׿� �帣');

INSERT INTO alto_hobby_sub VALUES ('hs070001','hm000007','����');
INSERT INTO alto_hobby_sub VALUES ('hs070002','hm000007','����');
INSERT INTO alto_hobby_sub VALUES ('hs070003','hm000007','��ȭ');
INSERT INTO alto_hobby_sub VALUES ('hs070004','hm000007','����');
INSERT INTO alto_hobby_sub VALUES ('hs070005','hm000007','��Ƽ/�佺Ƽ��');
INSERT INTO alto_hobby_sub VALUES ('hs070006','hm000007','����/��������');

INSERT INTO alto_hobby_sub VALUES ('hs080001','hm000008','����');
INSERT INTO alto_hobby_sub VALUES ('hs080002','hm000008','�ؿ�');
INSERT INTO alto_hobby_sub VALUES ('hs080003','hm000008','����/���');
INSERT INTO alto_hobby_sub VALUES ('hs080004','hm000008','��Ű��');
INSERT INTO alto_hobby_sub VALUES ('hs080005','hm000008','��������');

INSERT INTO alto_hobby_sub VALUES ('hs090001','hm000009','��ο�');
INSERT INTO alto_hobby_sub VALUES ('hs090002','hm000009','������');
INSERT INTO alto_hobby_sub VALUES ('hs090003','hm000009','ȯ��');
INSERT INTO alto_hobby_sub VALUES ('hs090004','hm000009','��ȸ');
INSERT INTO alto_hobby_sub VALUES ('hs090005','hm000009','��ɱ��');
INSERT INTO alto_hobby_sub VALUES ('hs090006','hm000009','���⵿����ȣ');

INSERT INTO alto_hobby_sub VALUES ('hs100001','hm000010','DSLR');
INSERT INTO alto_hobby_sub VALUES ('hs100002','hm000010','�ʸ�ī�޶�');
INSERT INTO alto_hobby_sub VALUES ('hs100003','hm000010','������ī�޶�');
INSERT INTO alto_hobby_sub VALUES ('hs100004','hm000010','��������');

INSERT INTO alto_hobby_sub VALUES ('hs110001','hm000011','��������');
INSERT INTO alto_hobby_sub VALUES ('hs110002','hm000011','����ġ/�߼�');
INSERT INTO alto_hobby_sub VALUES ('hs110003','hm000011','����/�ڰ���');
INSERT INTO alto_hobby_sub VALUES ('hs110004','hm000011','������͵�');
INSERT INTO alto_hobby_sub VALUES ('hs110005','hm000011','���н��͵�');
INSERT INTO alto_hobby_sub VALUES ('hs110006','hm000011','��Ÿ');

INSERT INTO alto_hobby_sub VALUES ('hs120001','hm000012','����');
INSERT INTO alto_hobby_sub VALUES ('hs120002','hm000012','���');
INSERT INTO alto_hobby_sub VALUES ('hs120003','hm000012','����');
INSERT INTO alto_hobby_sub VALUES ('hs120004','hm000012','GM');
INSERT INTO alto_hobby_sub VALUES ('hs120005','hm000012','�ֿ�');
INSERT INTO alto_hobby_sub VALUES ('hs120006','hm000012','�Ϻ���');
INSERT INTO alto_hobby_sub VALUES ('hs120007','hm000012','�̱���');
INSERT INTO alto_hobby_sub VALUES ('hs120008','hm000012','������');
INSERT INTO alto_hobby_sub VALUES ('hs120009','hm000012','����ũ');

INSERT INTO alto_hobby_sub VALUES ('hs130001','hm000013','������');
INSERT INTO alto_hobby_sub VALUES ('hs130002','hm000013','�����');
INSERT INTO alto_hobby_sub VALUES ('hs130003','hm000013','�����');
INSERT INTO alto_hobby_sub VALUES ('hs130004','hm000013','����');
INSERT INTO alto_hobby_sub VALUES ('hs130005','hm000013','�����');
INSERT INTO alto_hobby_sub VALUES ('hs130006','hm000013','������');
INSERT INTO alto_hobby_sub VALUES ('hs130007','hm000013','��Ÿ');

INSERT INTO alto_hobby_sub VALUES ('hs140001','hm000014','����/ȭ��');
INSERT INTO alto_hobby_sub VALUES ('hs140002','hm000014','��ǥ');
INSERT INTO alto_hobby_sub VALUES ('hs140003','hm000014','�ǱԾ�/�峭��');
INSERT INTO alto_hobby_sub VALUES ('hs140004','hm000014','DP/LP');
INSERT INTO alto_hobby_sub VALUES ('hs140005','hm000014','�ȭ');
INSERT INTO alto_hobby_sub VALUES ('hs140006','hm000014','��ƼĿ/����');
INSERT INTO alto_hobby_sub VALUES ('hs140007','hm000014','���ǹ�');
INSERT INTO alto_hobby_sub VALUES ('hs140008','hm000014','��Ÿ');

-- ����
DROP TABLE alto_area CASCADE CONSTRAINT;
CREATE TABLE alto_area(
	area_code	char(8) NOT NULL,
	name		varchar2(20) NOT NULL,
	PRIMARY KEY (area_code)
);

SELECT * FROM alto_area;
-- ���� ���� �߰�
INSERT INTO ALTO_AREA VALUES ('area0001','�¶���');
INSERT INTO ALTO_AREA VALUES ('area0002','������');
INSERT INTO ALTO_AREA VALUES ('area0003','������');
INSERT INTO ALTO_AREA VALUES ('area0004','���ϱ�');
INSERT INTO ALTO_AREA VALUES ('area0005','������');

INSERT INTO ALTO_AREA VALUES ('area0006','���Ǳ�');
INSERT INTO ALTO_AREA VALUES ('area0007','������');
INSERT INTO ALTO_AREA VALUES ('area0008','���α�');
INSERT INTO ALTO_AREA VALUES ('area0009','��õ��');
INSERT INTO ALTO_AREA VALUES ('area0010','�����');

INSERT INTO ALTO_AREA VALUES ('area0011','������');
INSERT INTO ALTO_AREA VALUES ('area0012','���빮��');
INSERT INTO ALTO_AREA VALUES ('area0013','���۱�');
INSERT INTO ALTO_AREA VALUES ('area0014','������');
INSERT INTO ALTO_AREA VALUES ('area0015','���빮��');

INSERT INTO ALTO_AREA VALUES ('area0016','���ʱ�');
INSERT INTO ALTO_AREA VALUES ('area0017','������');
INSERT INTO ALTO_AREA VALUES ('area0018','���ϱ�');
INSERT INTO ALTO_AREA VALUES ('area0019','���ı�');
INSERT INTO ALTO_AREA VALUES ('area0020','��õ��');

INSERT INTO ALTO_AREA VALUES ('area0021','��������');
INSERT INTO ALTO_AREA VALUES ('area0022','��걸');
INSERT INTO ALTO_AREA VALUES ('area0023','����');
INSERT INTO ALTO_AREA VALUES ('area0024','���α�');
INSERT INTO ALTO_AREA VALUES ('area0025','�߱�');
INSERT INTO ALTO_AREA VALUES ('area0026','�߶���');

-- ȸ��
DROP TABLE alto_member CASCADE CONSTRAINT;
CREATE TABLE alto_member(
	mem_id	 varchar2(100) NOT NULL,
	mem_pwd	 varchar2(20) NOT NULL,
	mem_name varchar2(20) NOT NULL,
	gender	 char(1) 	 NOT NULL,
	birth	 DATE 		 NOT NULL,
	email	 varchar2(100) NOT NULL,
	phone	 char(11) NOT NULL,
	img		 varchar2(500) DEFAULT '�⺻�̹���url',
	mem_open char(1) DEFAULT 'Y' NOT NULL,
	joindate DATE DEFAULT sysdate NOT NULL,
	authkey	 NUMBER DEFAULT 0 NOT NULL,
	PRIMARY KEY (mem_id)
);

-- ����Ű ���̺�
CREATE TABLE alto_member_auth(
	email	 varchar2(100) NOT NULL,
	authkey  varchar2(50)
);


-- ������� ��з� �ִ� 5�� / �Һз� (��з� ��)�ִ� 5��
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

-- Ȱ������ �ִ� 3��
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

-- ����
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
	img 		varchar2(500) DEFAULT '�⺻�̹���url',
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

-- ����
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

