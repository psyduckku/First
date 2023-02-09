--부모테이블
CREATE TABLE USERS(
	ID VARCHAR2(12) PRIMARY KEY, PSWD VARCHAR2(15) NOT NULL,
	NAME VARCHAR2(12) NOT NULL, NICK VARCHAR2(20) NOT NULL,
	GRADE VARCHAR2(10) DEFAULT '준회원', 	PHONE VARCHAR2(12) NOT NULL, 
	ADDR VARCHAR2(100), JOINDATE DATE DEFAULT SYSDATE
)

-- idx, id, pswd, name, nick, grade, phone, phone2, account, addr, post, joindate
-- 멤버추가
INSERT INTO USERS 
(id, pswd , name , nick , phone, addr)
VALUES( 'admin','qwe123', '강호동','회원1입니다', '01012341234', '경기도 용인시 기흥구 띵띵띵 띵띵띵띵띵@ 305-110');
INSERT INTO USERS 
(id, pswd , name , nick , phone, addr)
VALUES('apple','qwe123', '김애플','아이폰조아', '01043214321', '경기도 수원시 영통구 띵띵띵 띵띵띵띵띵@ 203-104');
INSERT INTO USERS 
(id, pswd , name , nick , phone, addr)
VALUES('carrot','qwe123', '차윤석','차둘기', '01033234432', '경기도 용인시 처인구 띵띵띵 띵띵띵띵 102-332')


INSERT INTO USERS (id, pswd , name , nick , phone, addr) VALUES(#{id},#{pswd},#{name},#{nick},#{phone},#{addr})

--유저조회
select * from USERS WHERE ID=#{ID}
--

UPDATE USERS SET ID, PSWD, NAME, NICK, PHONE, ADDR WHERE ID=#{ID}


INSERT INTO USERS (IDX, ID, PSWD, NAME, NICK, GRADE, PHONE, PHONE2, ACCOUNT, ADDR, POST, JOINDATE) VALUES((SELECT nvl(max(idx),0)+1 FROM USERS),?,?,?,?,?,?,?,?,?,?,?)

SELECT * FROM USERS WHERE id=${id} and pswd=${pswd} 
--유저테이블 삭제
drop table users

CREATE TABLE ANIMALS(
ASEQ NUMBER(30) DEFAULT 0 PRIMARY KEY,
SIGUN_CD VARCHAR2(80),
SIGUN_NM VARCHAR2(80),
ABDM_IDNTFY_NO VARCHAR2(30),
RECEPT_DE DATE,
DISCVRY_PLC_INFO VARCHAR2(200),
STATE_NM VARCHAR2(80),
PBLANC_IDNTFY_NO VARCHAR2(80),
PBLANC_BEGIN_DE DATE,
PBLANC_END_DE DATE,
SPECIES_NM VARCHAR2(80),
COLOR_NM VARCHAR2(80),
AGE_INFO VARCHAR2(80),
BDWGH_INFO VARCHAR2(80),
SEX_NM VARCHAR2(50),
NEUT_YN VARCHAR2(50),
SFETR_INFO VARCHAR2(200),
SHTER_NM VARCHAR2(50),
SHTER_TELNO VARCHAR2(50),
PROTECT_PLC VARCHAR2(200),
REFINE_ROADNM_ADDR VARCHAR2(200),
REFINE_LOTNO_ADDR VARCHAR2(200),
REFINE_ZIP_CD VARCHAR2(50),
JURISD_INST_NM VARCHAR2(50),
IMAGE_COURS VARCHAR2(150)
)
-- 동물테이블 삭제
DROP TABLE ANIMALS
-- 동물테이블 조회
SELECT * FROM ANIMALS
-- 동물테이블 삽입
INSERT INTO ANIMALS
(ASEQ, SIGUN_CD, SIGUN_NM,ABDM_IDNTFY_NO, RECEPT_DE,DISCVRY_PLC_INFO, STATE_NM,PBLANC_IDNTFY_NO, PBLANC_BEGIN_DE, PBLANC_END_DE, SPECIES_NM, COLOR_NM, AGE_INFO, BDWGH_INFO, SEX_NM, NEUT_YN, SFETR_INFO, SHTER_NM, SHTER_TELNO, PROTECT_PLC, REFINE_ROADNM_ADDR, REFINE_LOTNO_ADDR, REFINE_ZIP_CD, JURISD_INST_NM, IMAGE_COURS) 
VALUES((SELECT NVL(MAX(ASEQ),0)+1 FROM ANIMALS), '41190', '부천시', '441386202200549', '20220717', '괴안동 99-7', '보호중', '경기-부천-2022-00451', '20220717', '20220727', '[개] 믹스견', '검', '2015(년생)', '5.3(Kg)', 'M','N', '검 많아서 경계심 있음', '24시아이동물메디컬', '032-677-5262', '경기도 부천시 오정구 원종동 229-8', '경기도 부천시 소사로 779', '경기도 부천시 원종동 229-8', '14427', '경기도 부천시','http://www.animal.go.kr/files/shelter/2022/07/202207171307579.jpg')

SELECT * FROM ANIMALS where SIGUN_CD ='41130' AND SPECIES_NM LIKE '%개%' 
 
SELECT * FROM ANIMALS

-- ASIDELIST 명단 검색
SELECT ASEQ, SPECIES_NM,TO_CHAR(PBLANC_BEGIN_DE,'YYYY/MM/DD') AS PBLANC_BEGIN_DE, TO_CHAR(PBLANC_END_DE,'YYYY/MM/DD') AS PBLANC_END_DE, SIGUN_NM, IMAGE_COURS, DISCVRY_PLC_INFO FROM
 (SELECT ASEQ, SPECIES_NM,PBLANC_BEGIN_DE,PBLANC_END_DE, SIGUN_NM, IMAGE_COURS, DISCVRY_PLC_INFO FROM ANIMALS
 ORDER BY PBLANC_END_DE) WHERE ROWNUM <=5 
 
 SELECT SPECIES_NM,PBLANC_BEGIN_DE,PBLANC_END_DE, SIGUN_NM, IMAGE_COURS, DISCVRY_PLC_INFO FROM ANIMALS
 ORDER BY PBLANC_END_DE
 

--입양후기 게시판 테이블 생성
CREATE TABLE ADOPT_BOARD(
SEQ NUMBER(30) DEFAULT 0 PRIMARY KEY,
ID VARCHAR2(12) NOT NULL,
TITLE VARCHAR2(20 char) NOT NULL,
CONTENT VARCHAR2(2000 char) NOT NULL,
REGDATE DATE DEFAULT SYSDATE,
CNT NUMBER(5) DEFAULT 0,
IMAGE_FILE_NAME VARCHAR2(50) DEFAULT NULL,
FLAG_POST NUMBER(1) DEFAULT 0,
CONSTRAINT APT_BD_FK_ID FOREIGN KEY(ID) REFERENCES USERS(ID)
)
/*
CREATE TABLE ADOPT_BOARD(
SEQ NUMBER(30) DEFAULT 0 PRIMARY KEY,
PARENT_SEQ NUMBER(10) DEFAULT 0,
DEPTH NUMBER(10) DEFAULT 1,
GPORD NUMBER(10) DEFAULT 1,
ID VARCHAR2(12) NOT NULL,
TITLE VARCHAR2(20 char) NOT NULL,
CONTENT VARCHAR2(2000 char) NOT NULL,
PSWD VARCHAR2(20) DEFAULT '0000',
REGDATE DATE DEFAULT SYSDATE,
CNT NUMBER(5) DEFAULT 0,
IMAGE_FILE_NAME VARCHAR2(50) DEFAULT NULL,
FLAG_POST NUMBER(1) DEFAULT 0,
CONSTRAINT APT_BD_FK_ID FOREIGN KEY(ID) REFERENCES USERS(ID)
)
*/




-- ADOPT_BOARD 삭제
DROP TABLE ADOPT_BOARD

--입양후기 게시판 테이블 확인
SELECT * FROM ADOPT_BOARD 
SELECT ROWNUM, SEQ, TITLE, CONTENT, ID, TO_CHAR(REGDATE,'YYYY/MM/DD') AS REGDATE , CNT FROM ADOPT_BOARD ORDER BY ROWNUM DESC

INSERT INTO ADOPT_BOARD(ID, SEQ, TITLE, CONTENT)VALUES('admin',(SELECT NVL(MAX(SEQ),0)+1 AS SEQ FROM ADOPT_BOARD), '테스트','여긴내용')
SELECT NVL(MAX(SEQ),0)+1 AS SEQ FROM ADOPT_BOARD


ALTER TABLE ADOPT_BOARD MODIFY(IMAGE_FILE_NAME DEFAULT NULL)

-- ADOPTBOARD 게시판 입력
INSERT INTO ADOPT_BOARD(ID, SEQ, PARENT_SEQ, DEPTH, GPORD,  TITLE, CONTENT)
VALUES('admin',(SELECT NVL(MAX(SEQ),0)+1 AS SEQ FROM ADOPT_BOARD), 0, 1, 1,'첫번째게시물','첫번째게시물');
INSERT INTO ADOPT_BOARD(ID, SEQ, PARENT_SEQ, DEPTH, GPORD,  TITLE, CONTENT)
VALUES('admin',(SELECT NVL(MAX(SEQ),0)+1 AS SEQ FROM ADOPT_BOARD), 0, 1, 1,'두번째게시물','두번째게시물');
INSERT INTO ADOPT_BOARD(ID, SEQ, PARENT_SEQ, DEPTH, GPORD,  TITLE, CONTENT)
VALUES('admin',(SELECT NVL(MAX(SEQ),0)+1 AS SEQ FROM ADOPT_BOARD), 1, 2, 2,'첫 댓글','첫 댓글');
INSERT INTO ADOPT_BOARD(ID, SEQ, PARENT_SEQ, DEPTH, GPORD,  TITLE, CONTENT)
VALUES('admin',(SELECT NVL(MAX(SEQ),0)+1 AS SEQ FROM ADOPT_BOARD), 1, 2, 3,'첫 댓글2','첫 댓글2');
INSERT INTO ADOPT_BOARD(ID, SEQ, PARENT_SEQ, DEPTH, GPORD,  TITLE, CONTENT)
VALUES('admin',(SELECT NVL(MAX(SEQ),0)+1 AS SEQ FROM ADOPT_BOARD), 1, 2, 4,'첫 댓글3','첫 댓글3');
INSERT INTO ADOPT_BOARD(ID, SEQ, PARENT_SEQ, DEPTH, GPORD,  TITLE, CONTENT)
VALUES('admin',(SELECT NVL(MAX(SEQ),0)+1 AS SEQ FROM ADOPT_BOARD), 2, 2, 2,'두째 댓글','두째 댓글');
INSERT INTO ADOPT_BOARD(ID, SEQ, PARENT_SEQ, DEPTH, GPORD,  TITLE, CONTENT)
VALUES('admin',(SELECT NVL(MAX(SEQ),0)+1 AS SEQ FROM ADOPT_BOARD), 2, 2, 3,'두째 댓글2','두째 댓글2');
INSERT INTO ADOPT_BOARD(ID, SEQ, PARENT_SEQ, DEPTH, GPORD,  TITLE, CONTENT)
VALUES('admin',(SELECT NVL(MAX(SEQ),0)+1 AS SEQ FROM ADOPT_BOARD), 4, 3, 4,'첫 댓글2에 대한 대댓글','첫 댓글2에 대한 댓글');
INSERT INTO ADOPT_BOARD(ID, SEQ, PARENT_SEQ, DEPTH, GPORD,  TITLE, CONTENT)
VALUES('admin',(SELECT NVL(MAX(SEQ),0)+1 AS SEQ FROM ADOPT_BOARD), 4, 3, 5,'첫 댓글2에 대한 대댓글2','첫 댓글2에 대한 댓글');
INSERT INTO ADOPT_BOARD(ID, SEQ, PARENT_SEQ, DEPTH, GPORD,  TITLE, CONTENT)
VALUES('admin',(SELECT NVL(MAX(SEQ),0)+1 AS SEQ FROM ADOPT_BOARD), 9, 4, 6,'첫 댓글2에 대한 대댓글2에 대한 댓글1','첫 댓글2에 대한 댓글');
--입력
INSERT INTO ADOPT_BOARD(ID, SEQ, PARENT_SEQ, DEPTH, GPORD,  TITLE, CONTENT)
VALUES(#{ID},(SELECT NVL(MAX(SEQ),0)+1 AS SEQ FROM ADOPT_BOARD), #{SEQ}, #{DEPTH}+1, #{GPORD}+1,#{TITLE},#{CONTENT});


--ADOPT_BOARD 계층형 만들기
--깊이에 따른 분류
SELECT  SEQ, PARENT_SEQ, GPORD, DEPTH, LPAD(' ', 4*(DEPTH-1)) || TITLE TITLE,
CONTENT, ID, TO_CHAR(REGDATE,'YYYY/MM/DD') AS REGDATE , CNT FROM ADOPT_BOARD START WITH PARENT_SEQ=0 CONNECT 
BY PRIOR SEQ=PARENT_SEQ ORDER SIBLINGS BY SEQ DESC, GPORD ASC

--순서에 따른 분류
SELECT  SEQ, PARENT_SEQ, GPORD, DEPTH, LPAD(' ', 4*(GPORD-1)) || TITLE TITLE, CONTENT, ID, TO_CHAR(REGDATE,'YYYY/MM/DD') AS REGDATE , CNT FROM ADOPT_BOARD 
START WITH PARENT_SEQ=0 CONNECT BY PRIOR SEQ=PARENT_SEQ ORDER SIBLINGS BY PARENT_SEQ DESC, GPORD ASC


SELECT DISTINCT ID FROM ADOPT_BOARD WHERE ID='admin'

--ADOPT_BOARD 게시판 목록조회
SELECT * FROM ADOPT_BOARD

--(구)리스트
SELECT ROWNUM, SEQ, TITLE, CONTENT, ID, TO_CHAR(REGDATE,'YYYY/MM/DD') AS REGDATE , CNT FROM ADOPT_BOARD ORDER BY ROWNUM DESC

--
SELECT LEVEL, SEQ, PARENT_SEQ, LPAD(' ', 4*(LEVEL-1)) || TITLE TITLE,
CONTENT, ID, TO_CHAR(REGDATE,'YYYY/MM/DD') AS REGDATE , CNT 
FROM ADOPT_BOARD START WITH PARENT_SEQ=0 CONNECT BY PRIOR SEQ=PARENT_SEQ;


SELECT LEVEL, SEQ, PARENT_NO, LPAD(' ', 4*(LEVEL-1)) || TITLE TITLE, CONTENT, ID, TO_CHAR(REGDATE,'YYYY/MM/DD') AS REGDATE , CNT 
FROM ADOPT_BOARD START WITH PARENT_NO=0 CONNECT BY PRIOR SEQ=PARENT_NO ORDER SIBLINGS BY SEQ DESC;

-- ADOPT_BOARD 게시글 BATIS 삽입
INSERT INTO ADOPT_BOARD(ID, SEQ, TITLE, CONTENT)
VALUES(#{ID},(SELECT NVL(MAX(SEQ),0)+1 AS SEQ FROM ADOPT_BOARD),#{TITLE},#{CONTENT})

INSERT INTO ADOPT_BOARD(ID, SEQ, TITLE, CONTENT)
VALUES((SELECT DISTINCT ID FROM USERS WHERE ID = #{ID}),(SELECT NVL(MAX(SEQ),0)+1 AS SEQ FROM ADOPT_BOARD),#{TITLE},#{CONTENT})

--ADOPT_BOARD 조회수 증가 CNT값 증가
UPDATE ADOPT_BOARD SET CNT= NVL(CNT,0)+1 WHERE SEQ=1
UPDATE ADOPT_BOARD SET CNT= NVL(CNT,0)+1 WHERE SEQ=#{SEQ}

SELECT ROWNUM, SEQ, TITLE, CONTENT, ID, TO_CHAR(REGDATE,'YYYY/MM/DD') AS REGDATE, CNT FROM ADOPT_BOARD WHERE SEQ =1

--ADOPT_BOARD / getAdoptBoard 상세 조회
SELECT ROWNUM, SEQ, TITLE, CONTENT, ID, TO_CHAR(REGDATE,'YYYY/MM/DD') AS REGDATE , CNT FROM ADOPT_BOARD WHERE SEQ =1
SELECT ROWNUM, SEQ, TITLE, CONTENT, ID, TO_CHAR(REGDATE,'YYYY/MM/DD') AS REGDATE , CNT FROM ADOPT_BOARD WHERE SEQ =#{SEQ}

--ADOPTBOARD게시글 수정하기. 수정클릭 - SELECT(불러옴) - 수정함 - UPDATE BOARD SET 
UPDATE ADOPT_BOARD SET TITLE='', CONTENT='' WHERE SEQ=
UPDATE ADOPT_BOARD SET TITLE=#{TITLE},CONTENT=#{CONTENT} WHERE SEQ=#{SEQ}

--POST FLAG 설정
UPDATE ADOPT_BOARD SET FLAG_POST = 0 WHERE SEQ=1
--POST FLAG 해제
UPDATE ADOPT_BOARD SET FLAG_POST = 1 WHERE SEQ=1
--POST FLAG 검색
SELECT TITLE, CONTENT FROM ADOPT_BOARD WHERE FLAG_POST=1

UPDATE ADOPT_BOARD SET FLAG_POST = #{FLAG_POST} WHERE SEQ=#{SEQ}


SELECT * FROM ADOPT_BOARD WHERE ROWRUM =5

DELETE * FROM ADOPT_REPLY_BOARD WHERE SEQ_REPLY=#{SEQ}

SELECT * FROM ADOPT_REPLY_BOARD WHERE SEQ=4

SELECT FLAG_POST, CASE WHEN FLAG_POST =1 THEN 0
ELSE 1 END AS CHECKPOST
FROM ADOPT_BOARD WHERE SEQ=1

DELETE FROM ADOPT_BOARD WHERE SEQ=1
DELETE FROM ADOPT_REPLY_BOARD WHERE SEQ_REPLY=1


SELECT * FROM ADOPT_BOARD WHERE SEQ=1
SELECT * FROM ADOPT_REPLY_BOARD WHERE SEQ=1
WHERE SEQ_REPLY=2


--ADOPTBOARD 댓글 게시판 댓글테이블
--ON DELETE CASCADE 는  SEQ, 즉 게시물이 지워지면 그와 관련된 댓글도 함께 지워진다.
CREATE TABLE ADOPT_REPLY_BOARD
(
	ID VARCHAR2(12), SEQ NUMBER(30) NOT NULL, 
	SEQ_REPLY NUMBER(30) DEFAULT 0, REGDATE DATE DEFAULT SYSDATE, REPLY VARCHAR2(100) NOT NULL,
	SEQ_LIKE NUMBER(30) DEFAULT 0, SEQ_DISLIKE NUMBER(30) DEFAULT 0,
	CONSTRAINT FK_ID FOREIGN KEY(ID) REFERENCES USERS(ID),
	CONSTRAINT FK_SEQ FOREIGN KEY(SEQ) REFERENCES ADOPT_BOARD(SEQ) ON DELETE CASCADE,
	CONSTRAINT PK_ADOPT_KEY PRIMARY KEY(SEQ, SEQ_REPLY)
)
--ADOPT_BOARD 댓글테이블 삭제
DROP TABLE ADOPT_REPLY_BOARD
--ADOPTBOARD 댓글테이블 입력
INSERT INTO ADOPT_REPLY_BOARD(ID, SEQ, SEQ_REPLY, REPLY)
VALUES('carrot', '1', (SELECT NVL(MAX(SEQ_REPLY),0)+1 FROM ADOPT_REPLY_BOARD), 'AA');
--댓글테이블 BATIS등록
INSERT INTO ADOPT_REPLY_BOARD(ID, SEQ, SEQ_REPLY, REPLY) VALUES(#{ID}, #{SEQ},(SELECT NVL(MAX(SEQ_REPLY),0)+1 AS SEQ_REPLY FROM ADOPT_REPLY_BOARD), #{REPLY})

INSERT INTO ADOPT_REPLY_BOARD(ID, SEQ, SEQ_REPLY, REPLY) VALUES(#{ID}, #{SEQ},(SELECT NVL(MAX(SEQ_REPLY),0)+1 AS SEQ_REPLY FROM ADOPT_REPLY_BOARD), #{REPLY})

--ADOPT_BOARD 댓글테이블 전체 조회
SELECT * FROM ADOPT_REPLY_BOARD

--ADOPT_BOARD 댓글테이블 뿌리기
SELECT ID, TO_CHAR(REGDATE, 'YYYY/MM/DD HH24:MI:SS') AS REGDATE, REPLY, SEQ_LIKE, SEQ_DISLIKE
FROM ADOPT_REPLY_BOARD WHERE SEQ=1
--댓글뿌리기 BATIS등록
SELECT ID, TO_CHAR(REGDATE, 'YYYY/MM/DD HH24:MI:SS') AS REGDATE, REPLY, SEQ_LIKE, SEQ_DISLIKE
FROM ADOPT_REPLY_BOARD WHERE SEQ=#{SEQ}

--특정 댓글만 찾기
SELECT * FROM ADOPT_REPLY_BOARD WHERE SEQ='1' AND SEQ_REPLY=(SELECT MAX(SEQ_REPLY) AS SEQ_REPLY FROM ADOPT_REPLY_BOARD WHERE SEQ='1')
SELECT * FROM ADOPT_REPLY_BOARD WHERE SEQ=#{SEQ} AND SEQ_REPLY=(SELECT MAX(SEQ_REPLY) AS SEQ_REPLY FROM ADOPT_REPLY_BOARD WHERE SEQ=#{SEQ})

-- 게시글
SELECT * FROM ANIMALS where SIGUN_CD ='41130' AND SPECIES_NM LIKE '%개%' 

--ANIMALBOARD 댓글 게시판 댓글테이블
CREATE TABLE ANIMALS_REPLY_BOARD
(
	ID VARCHAR2(12), ASEQ NUMBER(30) NOT NULL, 
	ASEQ_REPLY NUMBER(30) DEFAULT 0, REGDATE DATE DEFAULT SYSDATE, REPLY VARCHAR2(100) NOT NULL,
	ASEQ_LIKE NUMBER(30) DEFAULT 0, ASEQ_DISLIKE NUMBER(30) DEFAULT 0,
	CONSTRAINT FK_AID FOREIGN KEY(ID) REFERENCES USERS(ID),
	CONSTRAINT FK_ASEQ FOREIGN KEY(ASEQ) REFERENCES ANIMALS(ASEQ),
	CONSTRAINT PK_ARPLY_KEY PRIMARY KEY(ASEQ, ASEQ_REPLY) ON DELETE CASCADE
)
--ANIAMLREPLY 등록
INSERT INTO ANIMALS_REPLY_BOARD(ID, ASEQ, ASEQ_REPLY, REPLY) VALUES(#{ID}, #{ASEQ},(SELECT NVL(MAX(ASEQ_REPLY),0)+1 AS ASEQ_REPLY FROM ANIMALS_REPLY_BOARD), #{REPLY})
INSERT INTO ANIMALS_REPLY_BOARD(ID, ASEQ, ASEQ_REPLY, REPLY) VALUES('carrot', '1',(SELECT NVL(MAX(ASEQ_REPLY),0)+1 AS ASEQ_REPLY FROM ANIMALS_REPLY_BOARD), '여섯빠')
--ANIMALS댓글테이블 BATIS등록
INSERT INTO ANIMALS_REPLY_BOARD(ID, ASEQ, ASEQ_REPLY, REPLY) VALUES(ID=#{ID}, ASEQ=#{ASEQ},(SELECT NVL(MAX(ASEQ_REPLY),0)+1 AS ASEQ_REPLY FROM ANIMALS_REPLY_BOARD), REPLY=#{REPLY})
INSERT INTO ANIMALS_REPLY_BOARD(ID, ASEQ, ASEQ_REPLY, REPLY) VALUES(ID=#{ID}, ASEQ=#{ASEQ},(SELECT NVL(MAX(ASEQ_REPLY),0)+1 AS ASEQ_REPLY FROM ANIMALS_REPLY_BOARD), REPLY=#{REPLY})

--ANIAMLREPLY 뿌리기
SELECT ID, TO_CHAR(REGDATE, 'YYYY/MM/DD HH24:MI:SS') AS REGDATE, REPLY, ASEQ_LIKE, ASEQ_DISLIKE
FROM ANIMALS_REPLY_BOARD WHERE ASEQ=1
SELECT ID, TO_CHAR(REGDATE, 'YYYY/MM/DD HH24:MI:SS') AS REGDATE, REPLY, ASEQ_LIKE, ASEQ_DISLIKE
FROM ANIMALS_REPLY_BOARD WHERE ASEQ=#{ASEQ}

SELECT * FROM ANIMALS_REPLY_BOARD WHERE ASEQ='1'

--ANIMALREPLY 특정 댓글만 찾기
SELECT * FROM ANIMALS_REPLY_BOARD WHERE ASEQ=#{ASEQ} AND ASEQ_REPLY=(SELECT MAX(ASEQ_REPLY) AS ASEQ_REPLY FROM ANIMALS_REPLY_BOARD WHERE ASEQ=#{ASEQ})
--
-- 이미지파일 테이블 생성
CREATE TABLE IMAGE_FILE(
IMAGE_FILE_NO NUMBER, 
SEQ NUMBER(30) NOT NULL,  --조회로
ORIGINAL_FILE_NAME VARCHAR2(260 BYTE) NOT NULL,
STORED_FILE_NAME VARCHAR2(260 BYTE) NOT NULL,
FILE_SIZE NUMBER,
DEL_YN VARCHAR(1 BYTE) DEFAULT 'N' NOT NULL,
REGDATE DATE DEFAULT SYSDATE,
CONSTRAINT FK_IMG_SEQ FOREIGN KEY(SEQ) REFERENCES ADOPT_BOARD(SEQ) ON DELETE CASCADE,
CONSTRAINT PK_IMAGE_KEY PRIMARY KEY(SEQ, IMAGE_FILE_NO)
)
-- 이미지파일 테이블 삭제
DROP TABLE IMAGE_FILE

SELECT IMAGE_FILE_NO, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE FROM IMAGE_FILE WHERE SEQ = #{SEQ}
SELECT IMAGE_FILE_NO, STORED_FILE_NAME FROM IMAGE_FILE WHERE SEQ = 20

-- 이미지파일 테이블 삽입
INSERT INTO IMAGE_FILE(IMAGE_FILE_NO, SEQ, ORIGINAL_FILE_NAME, STORED_FILE_NAME,FILE_SIZE, DEL_YN)
VALUES((SELECT NVL(MAX(IMAGE_FILE_NO),0)+1 AS IMAGE_FILE_NO FROM IMAGE_FILE), (SELECT MAX(SEQ) AS SEQ FROM ADOPT_BOARD), 
'파일이름', '수정된파일이름',
135,'Y')

INSERT INTO IMAGE_FILE(IMAGE_FILE_NO, SEQ, ORIGINAL_FILE_NAME, STORED_FILE_NAME,FILE_SIZE)
VALUES((SELECT NVL(MAX(IMAGE_FILE_NO),0)+1 AS IMAGE_FILE_NO FROM IMAGE_FILE), (SELECT MAX(SEQ) AS SEQ FROM ADOPT_BOARD), 
#{ORIGINAL_FILE_NAME}, #{STORED_FILE_NAME}, #{FILE_SIZE})

SELECT * FROM IMAGE_FILE

SELECT STORED_FILE_NAME FROM IMAGE_FILE WHERE SEQ = 1
UNION ALL
SELECT NULL AS STORED_FILE_NAME
FROM DUAL WHERE NOT EXISTS (
SELECT STORED_FILE_NAME FROM IMAGE_FILE WHERE SEQ = 1
)

SELECT TITLE, FROM ADOPT_BOARD WHERE FLAG_POST = 1

-- MYBATIS
INSERT INTO IMAGE_FILE(IMAGE_FILE_NO, SEQ, IMAGE_FILE_NAME)
VALUES((SELECT NVL(MAX(IMAGE_FILE_NO),0)+1 FROM IMAGE_FILE), #{SEQ}, #{IMAGE_FILE_NAME})

--FILE NO SEQUENCE 생성
CREATE SEQUENCE SEQ_TB_FILE_NO
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE


--FLAG_POST select하기
SELECT FLAG_POST FROM ADOPT_BOARD WHERE #{SEQ}

SELECT A.SEQ, A.ID, A.TITLE, A.CONTENT, A.FLAG_POST, B.STORED_FILE_NAME FROM ADOPT_BOARD A INNER JOIN IMAGE_FILE B ON (A.SEQ=B.SEQ AND A.FLAG_POST=1)

SELECT A.SEQ, A.ID, A.TITLE, A.CONTENT, A.FLAG_POST, B.STORED_FILE_NAME FROM ADOPT_BOARD A INNER JOIN IMAGE_FILE B ON (A.SEQ=B.SEQ AND A.FLAG_POST=1)

ADOPT_BOARD
ID
TITLE
CONTENT

IMAGE_FILE
STORED_FILE_NAME



UPDATE ADOPT_BOARD SET CNT= NVL(CNT,0)+1 WHERE SEQ=#{SEQ}

UPDATE ADOPT_BOARD SET FLAG_POST=#{FLAG_POST} WHERE SEQ=#{SEQ}






--확장자 체크
SELECT SUBSTR(IMAGE_FILE_NAME, INSTR(IMAGE_FILE_NAME,'.',1, LENGTH(REPLACE(IMAGE_FILE_NAME,'.','..'))
- LENGTH(IMAGE_FILE_NAME)) + 1 ) FROM IMAGE_FILE WHERE IMAGE_FILE_NO=1

SELECT IMAGE_FILE_NO, IMAGE_FILE_NAME, SEQ FROM IMAGE_FILE WHERE SEQ=1

SELECT * 

--제약 조건 확인
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='USERS'
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='ADOPT_BOARD'
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='ADOPT_REPLY_BOARD'


