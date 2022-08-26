/* 공인중개사회원 */
DROP TABLE REAUSER 
	CASCADE CONSTRAINTS;

/* 개인회원 */
DROP TABLE GENERICUSER 
	CASCADE CONSTRAINTS;

/* 공인중개사회원 이미지 */
DROP TABLE REAIMAGE 
	CASCADE CONSTRAINTS;

/* 매물이미지 */
DROP TABLE SALEIMAGE 
	CASCADE CONSTRAINTS;

/* 공인중개사 매물일정관리 */
DROP TABLE REASCHEDULE 
	CASCADE CONSTRAINTS;

/* 공인중개사 후기 */
DROP TABLE REVIEW 
	CASCADE CONSTRAINTS;

/* 북마크 */
DROP TABLE BOOKMARK 
	CASCADE CONSTRAINTS;

/* 공인중개사 소개 게시판 */
DROP TABLE REAINTROBOARD 
	CASCADE CONSTRAINTS;

/* 매물 */
DROP TABLE SALE 
	CASCADE CONSTRAINTS;

/* 거래유형 */
DROP TABLE TYPE 
	CASCADE CONSTRAINTS;

/* 관리자 */
DROP TABLE ADMIN 
	CASCADE CONSTRAINTS;

/* 회원코드 */
DROP TABLE USERCODE 
	CASCADE CONSTRAINTS;

/* 공인중개사 회사 이미지 */
DROP TABLE OFFICEIMAGE 
	CASCADE CONSTRAINTS;

/* 공인중개사회원 */
CREATE TABLE REAUSER (
	REAId VARCHAR2(30) NOT NULL, /* 공인중개사 아이디 */
	REAPwd VARCHAR2(30) NOT NULL, /* 공인중개사 비밀번호 */
	REAName VARCHAR2(20) NOT NULL, /* 공인중개사 이름 */
	REAPhoneNum VARCHAR2(30) NOT NULL, /* 공인중개사 휴대폰번호 */
	officeName VARCHAR2(30) NOT NULL, /* 사무소 이름 */
	officeAddr VARCHAR2(100) NOT NULL, /* 사무소 주소 */
	officeDetailAddr VARCHAR2(100) NOT NULL, /* 사무소 상세주소 */
	officeHp VARCHAR2(30) NOT NULL, /* 사무소 전화번호 */
	regNum VARCHAR2(20) NOT NULL, /* 사업자등록번호 */
	USERCODE VARCHAR(10) NOT NULL /* 회원코드 */
);

COMMENT ON TABLE REAUSER IS '공인중개사회원';

COMMENT ON COLUMN REAUSER.REAId IS '공인중개사 아이디';

COMMENT ON COLUMN REAUSER.REAPwd IS '공인중개사 비밀번호';

COMMENT ON COLUMN REAUSER.REAName IS '공인중개사 이름';

COMMENT ON COLUMN REAUSER.REAPhoneNum IS '공인중개사 휴대폰번호';

COMMENT ON COLUMN REAUSER.officeName IS '사무소 이름';

COMMENT ON COLUMN REAUSER.officeAddr IS '사무소 주소';

COMMENT ON COLUMN REAUSER.officeDetailAddr IS '사무소 상세주소';

COMMENT ON COLUMN REAUSER.officeHp IS '사무소 전화번호';

COMMENT ON COLUMN REAUSER.regNum IS '사업자등록번호';

COMMENT ON COLUMN REAUSER.USERCODE IS '회원코드';

CREATE UNIQUE INDEX PK_REAUSER
	ON REAUSER (
		REAId ASC
	);

ALTER TABLE REAUSER
	ADD
		CONSTRAINT PK_REAUSER
		PRIMARY KEY (
			REAId
		);

/* 개인회원 */
CREATE TABLE GENERICUSER (
	userId VARCHAR2(30) NOT NULL, /* 개인회원 아이디 */
	userPwd VARCHAR2(30) NOT NULL, /* 개인회원 비밀번호 */
	userName VARCHAR2(20) NOT NULL, /* 개인회원 이름 */
	frontResNum VARCHAR2(6) NOT NULL, /* 주민번호 앞자리 */
	backResNum VARCHAR2(7) NOT NULL, /* 주민번호 뒷자리 */
	userPhoneNum VARCHAR2(30) NOT NULL, /* 개인회원 휴대폰번호 */
	userAddr VARCHAR2(100) NOT NULL, /* 개인회원 주소 */
	userDetailAddr VARCHAR2(100) NOT NULL, /* 개인회원 상세주소 */
	USERCODE VARCHAR(10) NOT NULL /* 회원코드 */
);

COMMENT ON TABLE GENERICUSER IS '개인회원';

COMMENT ON COLUMN GENERICUSER.userId IS '개인회원 아이디';

COMMENT ON COLUMN GENERICUSER.userPwd IS '개인회원 비밀번호';

COMMENT ON COLUMN GENERICUSER.userName IS '개인회원 이름';

COMMENT ON COLUMN GENERICUSER.frontResNum IS '주민번호 앞자리';

COMMENT ON COLUMN GENERICUSER.backResNum IS '주민번호 뒷자리';

COMMENT ON COLUMN GENERICUSER.userPhoneNum IS '개인회원 휴대폰번호';

COMMENT ON COLUMN GENERICUSER.userAddr IS '개인회원 주소';

COMMENT ON COLUMN GENERICUSER.userDetailAddr IS '개인회원 상세주소';

COMMENT ON COLUMN GENERICUSER.USERCODE IS '회원코드';

CREATE UNIQUE INDEX PK_GENERICUSER
	ON GENERICUSER (
		userId ASC
	);

ALTER TABLE GENERICUSER
	ADD
		CONSTRAINT PK_GENERICUSER
		PRIMARY KEY (
			userId
		);

/* 공인중개사회원 이미지 */
CREATE TABLE REAIMAGE (
	REAId VARCHAR2(30) NOT NULL, /* 공인중개사 아이디 */
	reaImgOriginName VARCHAR2(20), /* 공인중개사회원 사진 원본 파일명 */
	reaImgSaveName VARCHAR2(20) /* 공인중개사회원 사진 저장 파일명 */
);

COMMENT ON TABLE REAIMAGE IS '공인중개사회원 이미지';

COMMENT ON COLUMN REAIMAGE.REAId IS '공인중개사 아이디';

COMMENT ON COLUMN REAIMAGE.reaImgOriginName IS '공인중개사회원 사진 원본 파일명';

COMMENT ON COLUMN REAIMAGE.reaImgSaveName IS '공인중개사회원 사진 저장 파일명';

CREATE UNIQUE INDEX PK_REAIMAGE
	ON REAIMAGE (
		REAId ASC
	);

ALTER TABLE REAIMAGE
	ADD
		CONSTRAINT PK_REAIMAGE
		PRIMARY KEY (
			REAId
		);

/* 매물이미지 */
CREATE TABLE SALEIMAGE (
	saleImgOriginName1 VARCHAR2(300), /* 매물사진 원본 파일명1 */
	saleImgSaveName1 VARCHAR2(300), /* 매물사진 저장 파일명1 */
	saleImgOriginName2 VARCHAR2(300), /* 매물사진 원본 파일명2 */
	saleImgSaveName2 VARCHAR2(300), /* 매물사진 저장 파일명2 */
	saleImgOriginName3 VARCHAR2(300), /* 매물사진 원본 파일명3 */
	saleImgSaveName3 VARCHAR2(300), /* 매물사진 저장 파일명3 */
	aptNum VARCHAR2(20) /* 매물번호 */
);

COMMENT ON TABLE SALEIMAGE IS '매물이미지';

COMMENT ON COLUMN SALEIMAGE.saleImgOriginName1 IS '매물사진 원본 파일명1';

COMMENT ON COLUMN SALEIMAGE.saleImgSaveName1 IS '매물사진 저장 파일명1';

COMMENT ON COLUMN SALEIMAGE.saleImgOriginName2 IS '매물사진 원본 파일명2';

COMMENT ON COLUMN SALEIMAGE.saleImgSaveName2 IS '매물사진 저장 파일명2';

COMMENT ON COLUMN SALEIMAGE.saleImgOriginName3 IS '매물사진 원본 파일명3';

COMMENT ON COLUMN SALEIMAGE.saleImgSaveName3 IS '매물사진 저장 파일명3';

COMMENT ON COLUMN SALEIMAGE.aptNum IS '매물번호';

/* 공인중개사 매물일정관리 */
CREATE TABLE REASCHEDULE (
	scheNum NUMBER NOT NULL, /* 일정번호 */
	scheDate TIMESTAMP NOT NULL, /* 날짜 */
	CONTENT VARCHAR2(1000), /* 내용 */
	REAId VARCHAR2(30) /* 공인중개사 아이디 */
);

COMMENT ON TABLE REASCHEDULE IS '공인중개사 매물일정관리';

COMMENT ON COLUMN REASCHEDULE.scheNum IS '일정번호';

COMMENT ON COLUMN REASCHEDULE.scheDate IS '날짜';

COMMENT ON COLUMN REASCHEDULE.CONTENT IS '내용';

COMMENT ON COLUMN REASCHEDULE.REAId IS '공인중개사 아이디';

CREATE UNIQUE INDEX PK_REASCHEDULE
	ON REASCHEDULE (
		scheNum ASC,
		scheDate ASC
	);

ALTER TABLE REASCHEDULE
	ADD
		CONSTRAINT PK_REASCHEDULE
		PRIMARY KEY (
			scheNum,
			scheDate
		);

/* 공인중개사 후기 */
CREATE TABLE REVIEW (
	reviewNum NUMBER NOT NULL, /* 게시글번호 */
	userId VARCHAR2(30) NOT NULL, /* 개인회원 아이디 */
	REAId VARCHAR2(30) NOT NULL, /* 공인중개사 아이디 */
	reviewContent VARCHAR2(3000), /* 내용 */
	reviewDate DATE /* 날짜 */
);

COMMENT ON TABLE REVIEW IS '공인중개사 후기';

COMMENT ON COLUMN REVIEW.reviewNum IS '게시글번호';

COMMENT ON COLUMN REVIEW.userId IS '개인회원 아이디';

COMMENT ON COLUMN REVIEW.REAId IS '공인중개사 아이디';

COMMENT ON COLUMN REVIEW.reviewContent IS '내용';

COMMENT ON COLUMN REVIEW.reviewDate IS '날짜';

CREATE UNIQUE INDEX PK_REVIEW
	ON REVIEW (
		reviewNum ASC,
		userId ASC,
		REAId ASC
	);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT PK_REVIEW
		PRIMARY KEY (
			reviewNum,
			userId,
			REAId
		);

/* 북마크 */
CREATE TABLE BOOKMARK (
	userId VARCHAR2(30) NOT NULL, /* 개인회원 아이디 */
	aptNum VARCHAR2(20) NOT NULL, /* 매물번호 */
	bookDate DATE /* 날짜 */
);

COMMENT ON TABLE BOOKMARK IS '북마크';

COMMENT ON COLUMN BOOKMARK.userId IS '개인회원 아이디';

COMMENT ON COLUMN BOOKMARK.aptNum IS '매물번호';

COMMENT ON COLUMN BOOKMARK.bookDate IS '날짜';

CREATE UNIQUE INDEX PK_BOOKMARK
	ON BOOKMARK (
		aptNum ASC
	);

ALTER TABLE BOOKMARK
	ADD
		CONSTRAINT PK_BOOKMARK
		PRIMARY KEY (
			aptNum
		);

/* 공인중개사 소개 게시판 */
CREATE TABLE REAINTROBOARD (
	REAId VARCHAR2(30) NOT NULL, /* 공인중개사 아이디 */
	subject VARCHAR2(100), /* 제목 */
	content VARCHAR2(3000) /* 내용 */
);

COMMENT ON TABLE REAINTROBOARD IS '공인중개사 소개 게시판';

COMMENT ON COLUMN REAINTROBOARD.REAId IS '공인중개사 아이디';

COMMENT ON COLUMN REAINTROBOARD.subject IS '제목';

COMMENT ON COLUMN REAINTROBOARD.content IS '내용';

CREATE UNIQUE INDEX PK_REAINTROBOARD
	ON REAINTROBOARD (
		REAId ASC
	);

ALTER TABLE REAINTROBOARD
	ADD
		CONSTRAINT PK_REAINTROBOARD
		PRIMARY KEY (
			REAId
		);

/* 매물 */
CREATE TABLE SALE (
	aptNum VARCHAR2(20) NOT NULL, /* 매물번호 */
	APTSIZE VARCHAR2(10), /* 면적 */
	TYPE VARCHAR2(10), /* 거래유형 */
	ADDR VARCHAR2(200), /* 지번주소 */
	ROADADDR VARCHAR2(200), /* 도로명주소 */
	APTNAME VARCHAR2(100), /* 아파트이름 */
	APTDONG VARCHAR2(10), /* 동 */
	APTHO VARCHAR2(10), /* 호수 */
	PRICE VARCHAR2(20), /* 거래금액 */
	DIRECTION VARCHAR2(20), /* 향 */
	ETC VARCHAR2(3000), /* 매물특징 */
	isContract VARCHAR2(10), /* 계약여부 */
	REAId VARCHAR2(30) /* 공인중개사 아이디 */
);

COMMENT ON TABLE SALE IS '매물';

COMMENT ON COLUMN SALE.aptNum IS '매물번호';

COMMENT ON COLUMN SALE.APTSIZE IS '면적';

COMMENT ON COLUMN SALE.TYPE IS '거래유형';

COMMENT ON COLUMN SALE.ADDR IS '지번주소';

COMMENT ON COLUMN SALE.ROADADDR IS '도로명주소';

COMMENT ON COLUMN SALE.APTNAME IS '아파트이름';

COMMENT ON COLUMN SALE.APTDONG IS '동';

COMMENT ON COLUMN SALE.APTHO IS '호수';

COMMENT ON COLUMN SALE.PRICE IS '거래금액';

COMMENT ON COLUMN SALE.DIRECTION IS '향';

COMMENT ON COLUMN SALE.ETC IS '매물특징';

COMMENT ON COLUMN SALE.isContract IS '계약여부';

COMMENT ON COLUMN SALE.REAId IS '공인중개사 아이디';

CREATE UNIQUE INDEX PK_SALE
	ON SALE (
		aptNum ASC
	);

ALTER TABLE SALE
	ADD
		CONSTRAINT PK_SALE
		PRIMARY KEY (
			aptNum
		);

/* 거래유형 */
CREATE TABLE TYPE (
	type VARCHAR2(10) NOT NULL /* 거래유형 */
);

COMMENT ON TABLE TYPE IS '거래유형';

COMMENT ON COLUMN TYPE.type IS '거래유형';

CREATE UNIQUE INDEX PK_TYPE
	ON TYPE (
		type ASC
	);

ALTER TABLE TYPE
	ADD
		CONSTRAINT PK_TYPE
		PRIMARY KEY (
			type
		);

/* 관리자 */
CREATE TABLE ADMIN (
	adminId VARCHAR2(30) NOT NULL, /* 관리자 아이디 */
	adminPwd VARCHAR2(30) NOT NULL, /* 관리자 비밀번호 */
	USERCODE VARCHAR(10) NOT NULL /* 회원코드 */
);

COMMENT ON TABLE ADMIN IS '관리자';

COMMENT ON COLUMN ADMIN.adminId IS '관리자 아이디';

COMMENT ON COLUMN ADMIN.adminPwd IS '관리자 비밀번호';

COMMENT ON COLUMN ADMIN.USERCODE IS '회원코드';

/* 회원코드 */
CREATE TABLE USERCODE (
	USERCODE VARCHAR(10) NOT NULL, /* 회원코드 */
	USERTYPE VARCHAR2(30) NOT NULL /* 회원구분 */
);

COMMENT ON TABLE USERCODE IS '회원코드';

COMMENT ON COLUMN USERCODE.USERCODE IS '회원코드';

COMMENT ON COLUMN USERCODE.USERTYPE IS '회원구분';

CREATE UNIQUE INDEX PK_USERCODE
	ON USERCODE (
		USERCODE ASC
	);

ALTER TABLE USERCODE
	ADD
		CONSTRAINT PK_USERCODE
		PRIMARY KEY (
			USERCODE
		);

/* 공인중개사 회사 이미지 */
CREATE TABLE OFFICEIMAGE (
	REAId VARCHAR2(30) NOT NULL, /* 공인중개사 아이디 */
	officeImgOriginName VARCHAR2(20), /* 회사 소개 사진 원본 파일명 */
	officeImgSaveName VARCHAR2(20) /* 회사 소개 사진 저장 파일명 */
);

COMMENT ON TABLE OFFICEIMAGE IS '공인중개사 회사 이미지';

COMMENT ON COLUMN OFFICEIMAGE.REAId IS '공인중개사 아이디';

COMMENT ON COLUMN OFFICEIMAGE.officeImgOriginName IS '회사 소개 사진 원본 파일명';

COMMENT ON COLUMN OFFICEIMAGE.officeImgSaveName IS '회사 소개 사진 저장 파일명';

CREATE UNIQUE INDEX PK_OFFICEIMAGE
	ON OFFICEIMAGE (
		REAId ASC
	);

ALTER TABLE OFFICEIMAGE
	ADD
		CONSTRAINT PK_OFFICEIMAGE
		PRIMARY KEY (
			REAId
		);

ALTER TABLE REAUSER
	ADD
		CONSTRAINT FK_USERCODE_TO_REAUSER
		FOREIGN KEY (
			USERCODE
		)
		REFERENCES USERCODE (
			USERCODE
		);

ALTER TABLE GENERICUSER
	ADD
		CONSTRAINT FK_USERCODE_TO_GENERICUSER
		FOREIGN KEY (
			USERCODE
		)
		REFERENCES USERCODE (
			USERCODE
		);

ALTER TABLE REAIMAGE
	ADD
		CONSTRAINT FK_REAUSER_TO_REAIMAGE
		FOREIGN KEY (
			REAId
		)
		REFERENCES REAUSER (
			REAId
		);

ALTER TABLE SALEIMAGE
	ADD
		CONSTRAINT FK_SALE_TO_SALEIMAGE
		FOREIGN KEY (
			aptNum
		)
		REFERENCES SALE (
			aptNum
		);

ALTER TABLE REASCHEDULE
	ADD
		CONSTRAINT FK_REAUSER_TO_REASCHEDULE
		FOREIGN KEY (
			REAId
		)
		REFERENCES REAUSER (
			REAId
		);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_GENERICUSER_TO_REVIEW
		FOREIGN KEY (
			userId
		)
		REFERENCES GENERICUSER (
			userId
		);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_REAUSER_TO_REVIEW
		FOREIGN KEY (
			REAId
		)
		REFERENCES REAUSER (
			REAId
		);

ALTER TABLE BOOKMARK
	ADD
		CONSTRAINT FK_SALE_TO_BOOKMARK
		FOREIGN KEY (
			aptNum
		)
		REFERENCES SALE (
			aptNum
		);

ALTER TABLE BOOKMARK
	ADD
		CONSTRAINT FK_GENERICUSER_TO_BOOKMARK
		FOREIGN KEY (
			userId
		)
		REFERENCES GENERICUSER (
			userId
		);

ALTER TABLE REAINTROBOARD
	ADD
		CONSTRAINT FK_REAUSER_TO_REAINTROBOARD
		FOREIGN KEY (
			REAId
		)
		REFERENCES REAUSER (
			REAId
		);

ALTER TABLE SALE
	ADD
		CONSTRAINT FK_TYPE_TO_SALE
		FOREIGN KEY (
			TYPE
		)
		REFERENCES TYPE (
			type
		);

ALTER TABLE SALE
	ADD
		CONSTRAINT FK_REAUSER_TO_SALE
		FOREIGN KEY (
			REAId
		)
		REFERENCES REAUSER (
			REAId
		);

ALTER TABLE ADMIN
	ADD
		CONSTRAINT FK_USERCODE_TO_ADMIN
		FOREIGN KEY (
			USERCODE
		)
		REFERENCES USERCODE (
			USERCODE
		);

ALTER TABLE OFFICEIMAGE
	ADD
		CONSTRAINT FK_REAUSER_TO_OFFICEIMAGE
		FOREIGN KEY (
			REAId
		)
		REFERENCES REAUSER (
			REAId
		);
    
--------------------------------------------------------------------------------

-- USERCODE 생성
INSERT INTO USERCODE VALUES (
  'A00', '관리자'
);
INSERT INTO USERCODE VALUES (
  'U01', '개인회원'
);
INSERT INTO USERCODE VALUES (
  'U02', '공인중개사회원'
);
INSERT INTO USERCODE VALUES (
  'B01', '개인블랙회원'
);
INSERT INTO USERCODE VALUES (
  'B02', '공인중개사블랙회원'
);

-- 관리자 계정 생성   'A00', '관리자'
INSERT INTO ADMIN VALUES (
  'ododo', '1004', 'A00'
);
INSERT INTO ADMIN VALUES (
  'hgoguma', '1004', 'A00'
);
INSERT INTO ADMIN VALUES (
  'jeje', '1004', 'A00'
);
INSERT INTO ADMIN VALUES (
  'keem', '1004', 'A00'
);

COMMIT;
-- 관리자 계정 생성까지 COMMIT

-- 거래유형 생성 '매매', '전세'
INSERT INTO TYPE VALUES (
  '매매'
);
INSERT INTO TYPE VALUES (
  '전세'
);

COMMIT;
-- 거래유형 입력까지 COMMIT

-- 시퀀스 번호 생성
CREATE SEQUENCE SEQ_APTNUM -- 매물번호 시퀀스 생성
  START WITH 1
  INCREMENT BY 1;
CREATE SEQUENCE SEQ_REVIEW -- 후기글 시퀀스 생성
  START WITH 1
  INCREMENT BY 1;
CREATE SEQUENCE SEQ_SCHEDULE -- 일정관리 시퀀스 생성
  START WITH 1
  INCREMENT BY 1;
  
COMMIT;
-- 시퀀스 번호 생성까지 COMMIT

-- 개인회원 계정 생성  'U01', '개인회원'
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser001','1004','홍수아','961220','2222222','010-3333-3333','서울시 관악구 국회단지길 52','301호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser002','1004','류현진','870325','1234567','010-3181-1611','서울시 강남구 봉은사로63길 47','602호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser003','1004','박지성','810225','1036624','010-6353-6662','서울시 강남구 언주로30길 26','1111호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser004','1004','김영권','900227','1963336','010-3303-9964','서울시 송파구 가락로 187','909호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser005','1004','이지은','930516','2003692','010-1004-3265','서울시 서초구 반포대로 275','1004호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser006','1004','여진구','970813','1078771','010-1996-1175','서울시 강동구 성안로25길 55','301호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser007','1004','한혜진','830323','2963365','010-6355-8558','서울시 서초구 강남대로6길 148','1006호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser008','1004','이수현','990504','2033623','010-4525-8877','서울시 성동구 둘레11길 1','1101호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser009','1004','이찬혁','960912','1058585','010-9969-3361','서울시 성동구 둘레11길 1','1101호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser010','1004','이영애','710131','2096336','010-1312-9896','서울시 종로구 평창길 3','1층',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser011','1004','현빈','820925','1063989','010-8558-1234','서울시 서초구 강남대로2길 24','702호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser012','1004','손예진','820111','2102003','010-9663-1223','서울시 서초구 신반포로 270','1301호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser013','1004','김태리','900424','2102236','010-9974-3660','서울시 성북구 성북로6가길 23','304호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser014','1004','류준열','860925','1015584','010-7220-2124','서울 강남구 도곡로 404','2009호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser015','1004','이동휘','850722','1033269','010-6636-4422','서울 강동구 천호대로 1077','2104호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser016','1004','강동원','810118','1022552','010-6633-1119','서울시 강남구 영동대로 319','705호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser017','1004','이혜리','940609','2111536','010-9966-3337','서울시 성동구 난계로 100','1010호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser018','1004','서지혜','840824','2113365','010-9669-7774','서울시 강동구 구천면로 192','701호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser019','1004','박보영','900212','2236961','010-1336-9998','서울시 강남구 강남대로 272','804호',(select usercode from usercode where usercode='U01'));
insert into genericuser(userid,userpwd,username,frontResNum,backResNum,userPhoneNum,useraddr,userDetailAddr,userCode) 
  values('guser020','1004','조정석','801226','1115887','010-8859-0258','서울시 강남구 언주로 420','306호',(select usercode from usercode where usercode='U01'));

COMMIT;
-- 개인회원 계정 생성까지 COMMIT

-- 공인중개사회원 계정 생성  'U02', '공인중개사회원'
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser001','1004', '구광모','010-1544-7777','LG부동산','서울시 강서구 마곡중앙10로 30','LG사이언스파크','02-1544-7777','502-11-01931',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser002','1004', '이재용','010-1588-3366','삼성부동산','서울시 강남구 테헤란로77길 11-9','삼성타워','02-1588-3366','124-81-00998',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser003','1004', '정의선','010-6000-6000','현대부동산','서울시 서초구 헌릉로 12','1층','080-600-6000','101-81-09147',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser004','1004', '최준영','010-2000-2000','기아부동산','서울시 서초구 헌릉로 12','2층','080-200-2000','119-81-02316',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser005','1004', '최태원','010-6400-0114','SK부동산','서울시 종로구 종로 26','SK빌딩','02-6400-0114','502-11-01931',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser006','1004', '최정우','010-4220-0114','포스코부동산','경상북도 포항시 남구 동해안로 6261','포스코','054-220-0114','540-20-21214',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser007','1004', '김승연','010-2729-1114','한화부동산','서울시 중구 청계천로 86','한화빌딩','02-729-1114','729-11-91114',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser008','1004', '허창수','010-2005-8125','GS부동산','서울시 강남구 논현로 508','GS타워','02-2005-8125','205-20-58125',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser009','1004', '김병원','010-2080-5114','농협부동산','서울시 중구 새문안로 16','농협타워','02-2080-5114','502-11-01931',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser010','1004', '장재영','010-1588-1234','신세계부동산','서울시 중구 소공로 63','LG사이언스파크','02-1588-1234','158-81-81234',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser011','1004', '손경식','010-7268-8114','CJ부동산','서울시 중구 소월로2길 12','CJ그룹','02-726-8114','104-81-26714',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser012','1004', '박정원','010-3398-0114','두산부동산','서울시 중구 장충단로 275','두산타워','02-3398-0114','339-81-80011',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser013','1004', '박현주','010-1588-0220','미래에셋부동산','서울시 영등포구 국제금융로 56','1층','02-1588-0220','305-81-08605',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser014','1004', '후세인','010-3772-5151','에쓰오일부동산','서울시 마포구 백범로 192','2층','02-3772-5151','236-81-04169',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser015','1004', '김남구','010-3276-6400','SK부동산','서울시 영등포구 의사당대로 88','한국투자증권빌딩','02-3276-6400','123-11-20031',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser016','1004', '이강인','010-2519-3314','영풍부동산','서울시 강남구 강남대로 542','영풍빌딩','02-519-3314','791-20-63100',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser017','1004', '박영규','010-1544-1900','교보부동산','서울시 종로구 종로 1','교보빌딩','02-1544-1900','102-81-11670',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser018','1004', '김범수','010-1899-1326','카카오부동산','제주특별자치도 제주시 첨단로 242','10층','02-1899-1326','123-45-12345',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser019','1004', '유석진','010-3677-3114','코오롱부동산','경기도 과천시 코오롱로 11','코오롱','02-3677-3114','367-73-73114',(select usercode from usercode where usercode='U02'));
insert into REAUSER(reaId,reaPwd,reaName,reaPhoneNum,officeName,officeAddr,officeDetailAddr,officeHp,regNum,userCode) 
  values('reauser020','1004', '한성숙','010-1588-3830','네이버부동산','경기도 성남시 분당구 불정로 6','네이버','02-1588-3830','712-81-71562',(select usercode from usercode where usercode='U02'));

COMMIT;
-- 공인중개사회원 계정 생성까지 COMMIT

insert into sale(aptNum, aptSize, type, addr, roadAddr, aptName, aptDong, aptHo, price, direction, etc, isContract,reaId) 
  values(seq_aptNum.nextval, '24',(select type from type where type='매매'), '서울 강남구 역삼동 794-19', '서울 강남구 도곡로19길 17','역삼동, 강남 한솔아파트','105동','102호','140000','남동향','학군좋음,역삼역 10분,갭투자','무',(select reaid from reauser where reaid='drop4bit')); 
insert into sale(aptNum, aptSize, type, addr, roadAddr, aptName, aptDong, aptHo, price, direction, etc, isContract,reaId) 
  values(seq_aptNum.nextval, '24',(select type from type where type='매매'), '서울 강남구 역삼동 794-24', '서울 강남구 도곡로19길 13','역삼동, 역삼노블카운티아파트','103동','102호','140000','남동향','포베이구조,강남역 5분거리,수리완료','무',(select reaid from reauser where reaid='drop4bit')); 
insert into sale(aptNum, aptSize, type, addr, roadAddr, aptName, aptDong, aptHo, price, direction, etc, isContract,reaId) 
  values(seq_aptNum.nextval, '24',(select type from type where type='매매'), '서울 강남구 역삼동 681-46', '서울 강남구 선릉로107길 24','역삼동, 성영아파트 for U','105동','302호','160000','남향','로얄층 전망좋고 학군배정우수 삼성역세권 수혜아파트','무',(select reaid from reauser where reaid='drop4bit')); 
insert into sale(aptNum, aptSize, type, addr, roadAddr, aptName, aptDong, aptHo, price, direction, etc, isContract,reaId) 
  values(seq_aptNum.nextval, '24',(select type from type where type='매매'), '서울 강남구 역삼동 636-33', '서울 강남구 논현로101길 6','역삼동, 프리우스역삼아파트','103동','102호','140000','남동향','주인거주, 6개월 전 특 올수리,남향,로얄층,전망 좋은 집','무',(select reaid from reauser where reaid='drop4bit')); 
insert into sale(aptNum, aptSize, type, addr, roadAddr, aptName, aptDong, aptHo, price, direction, etc, isContract,reaId) 
  values(seq_aptNum.nextval, '24',(select type from type where type='매매'), '서울 강남구 역삼동 789-29', '서울 강남구 논현로71길 48','역삼동, 지석 천평대 아파트','103동','102호','140000','남동향','내부 깨끗하고 저렴한 급매매, 남서향','무',(select reaid from reauser where reaid='drop4bit'));
  
SELECT * FROM ADMIN;
SELECT * FROM BOOKMARK;
SELECT * FROM GENERICUSER;
SELECT * FROM OFFICEIMAGE;
SELECT * FROM REAIMAGE;
SELECT * FROM REAINTROBOARD;
SELECT * FROM REASCHEDULE;
SELECT * FROM REAUSER;
SELECT * FROM REVIEW;
SELECT * FROM SALE;
SELECT * FROM SALEIMAGE;
SELECT * FROM TYPE;
SELECT * FROM USERCODE;