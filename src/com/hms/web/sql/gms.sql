--***********************
--2017.8.2
--[1]MAJOR_TAB
--[2]SUBJECT_TAB
--[3]MEMBER_TAB
--[4]PROF_TAB
--[5]STUDENT_TAB
--[6]GRADE_TAB
--[7]BOARD_TAB
--***********************

select * from member;
select * from major;



--***********************
--[3]MEMBER_TAB
--2017.8.2
--member_id,name,password,
--ssn,regdate,major_id,
--phone,email,profile
--***********************
CREATE TABLE Member(
	member_id VARCHAR2(20),
	name VARCHAR2(10),
	password VARCHAR2(10),
	ssn VARCHAR2(15),
	phone VARCHAR2(10),
	email VARCHAR2(10),
	profile VARCHAR2(10)
	regdate DATE,
	PRIMARY KEY(id)
);

INSERT INTO Member(id, name, password, ssn, regdate)
VALUES('hong', '홍길동', '1', '860305-1234567', SYSDATE);
INSERT INTO Member(id, name, password, ssn, regdate)
VALUES('kim', '김유신', '1', '900606-1232323', SYSDATE);
INSERT INTO Member(id, name, password, ssn, regdate)
VALUES('dong', '홍길동', '1', '700707-1234545', SYSDATE);
INSERT INTO Member(id, name, password, ssn, regdate)
VALUES('gil', '홍길동', '1', '600808-1235858', SYSDATE);
INSERT INTO Member(id, name, password, ssn, regdate)
VALUES('111', '박지성', '1', '911212-1234567', SYSDATE);
INSERT INTO Member(id, name, password, ssn, regdate)
VALUES('222', '이영표', '1', '821212-2234567', SYSDATE);
INSERT INTO Member(id, name, password, ssn, regdate)
VALUES('333', '임요환', '1', '731212-2234567', SYSDATE);
INSERT INTO Member(id, name, password, ssn, regdate)
VALUES('444', '서인국', '1', '641212-2234567', SYSDATE);
INSERT INTO Member(id, name, password, ssn, regdate)
VALUES('555', '정우성', '1', '551212-2234567', SYSDATE);
INSERT INTO Member(id, name, password, ssn, regdate)
VALUES('666', '장동건', '1', '461212-2234567', SYSDATE);
INSERT INTO Member(id, name, password, ssn, regdate)
VALUES('888', '김우열', '1', '701212-2234567', SYSDATE);

SELECT * FROM Member;
SELECT * FROM Member WHERE name='홍길동';
SELECT COUNT(*) AS count FROM Member;

UPDATE MEMBER
SET password='2'
WHERE id='hong';

DELETE FROM MEMBER WHERE id 



--***********************
--BOARD_TAB
--2017.8.2
--게시판테이블
--userId, name, title
--***********************
INSERT INTO Board(article_seq,id,title, content,hitcount,regdate)
VALUES(seq.nextval,'hong','홍길동 안녕',
'사랑의 이상은',0,SYSDATE);
INSERT INTO Board(article_seq,id,title, content,hitcount,regdate)
VALUES(seq.nextval,'kim','김유신 안녕',
'있는 가는',0,SYSDATE);
INSERT INTO Board(article_seq,id,title, content,hitcount,regdate)
VALUES(seq.nextval,'dong','dong 안녕',
'용기가 풀이 뛰노는 가장 운다.',0,SYSDATE);
INSERT INTO Board(article_seq,id,title, content,hitcount,regdate)
VALUES(seq.nextval,'gil','gil 안녕',
'미인을 낙원을 커다란 않는 할지라도 때에',0,SYSDATE);
INSERT INTO Board(article_seq,id,title, content,hitcount,regdate)
VALUES(article_seq.nextval,'111','박지성 안녕',
'얼음에 청춘의 있으며',0,SYSDATE);
INSERT INTO Board(article_seq,id,title, content,hitcount,regdate)
VALUES(article_seq.nextval,'222','이영표 안녕',
'인간에 청춘 발휘하기 있으랴?',0,SYSDATE);
INSERT INTO Board(article_seq,id,title, content,hitcount,regdate)
VALUES(article_seq.nextval,'222','이영표 안녕',
'그들의 위하여서',0,SYSDATE);
INSERT INTO Board(article_seq,id,title, content,hitcount,regdate)
VALUES(article_seq.nextval,'222','이영표 안녕',
'봄바람을 뛰노는 쓸쓸하랴',0,SYSDATE);
INSERT INTO Board(article_seq,id,title, content,hitcount,regdate)
VALUES(article_seq.nextval,'222','이영표 안녕',
'열락의 인간에 이상의 봄바람이다',0,SYSDATE);
INSERT INTO Board(article_seq,id,title, content,hitcount,regdate)
VALUES(article_seq.nextval,'333','임요환 안녕',
'인도하겠다는 피는 이 이상',0,SYSDATE);





--***********************
--[2]SUBJECT_TAB
--2017.8.2
--subj_id,title,major_id
--***********************
--DDL


CREATE TABLE Subject(
	subj_id VARCHAR2(10),
	title VARCHAR2(10),
	PRIMARY KEY(subj_id) 
)
SELECT* FROM MEMBER WHERE name ='홍길동';

INSERT INTO MEMBER (ID, PASSWORD, SSN, REGDATE) VALUES (66,66,66,SYSDATE);

INSERT INTO BOARD(ID,%s,%s,%s,%s,%s) VALUES(?, ?, ?,SYSDATE,article_seq,?);

SELECT * FROM MEMBER;
SELECT * FROM Board;

SELECT COUNT(*) FROM BOARD;
SELECT * FROM Board WHERE id= 'hong'
UPDATE Board SET title = 'bonjour',content='comment cava' WHERE article_seq=1000;

SELECT id FROM Board WHERE id LIKE 

SELECT DISTINCT id
FROM BOARD
WHERE id LIKE '%o%'

SELECT * FROM MEMBER ORDER BY SSN ASC;

SELECT SUM(ARTICLE_SEQ) FROM BOARD

SELECT * FROM MEMBER m, BOARD b 
WHERE m.id=b.id
ORDER BY ARTICLE_SEQ DESC;

SELECT DISTINCT ssn, name 
FROM MEMBER m, Board b
WHERE m.id=b.id AND ROWNUM <= 2
ORDER BY SSN DESC;

DROP SEQUENCE article_Seq;

CREATE SEQUENCE seq
	START WITH		2000
	INCREMENT BY 	1
	NOCACHE
	NOCYCLE;

--***********************
--[1]MAJOR_TAB
--2017.8.2
--article_seq, id,title
--content,hitcont,regdate
--***********************
--DDL



--***********************
--[4]PROF_TAB
--2017.8.2
--member_id,salary
--***********************
--DDL
CREATE TABLE Prof(
	member_id VARCHAR2(10),
	salary VARCHAR2(8),
	PRIMARY KEY(member_id),
	FOREIGN KEY(member_id) REFERENCES Member(member_id)
	ON DELETE CASCADE
);


--***********************
--[5]STUDENT_TAB
--2017.8.2
--member_id,stu_no
--***********************
--DDL
CREATE TABLE Student(
	member_id VARCHAR2(10),
	stu_no VARCHAR2(8),
	PRIMARY KEY(member_id),
	FOREIGN KEY(member_id) REFERENCES Member(member_id)
	ON DELETE CASCADE
);
--***********************
--[6]GRADE_TAB
--2017.8.2
--member_id,stu_no
--***********************
--DDL	

CREATE TABLE Grade(
	grade_seq NUMBER,
	score VARCHAR2(3),
	exam_date VARCHAR2(12),
	subj_id VARCHAR2(10),
	member_id VARCHAR2(10),
	PRIMARY KEY(grade_seq),
	FOREIGN KEY(MEMBER_ID) REFERENCES Member(member_id)
		ON DELETE CASCADE,
	FOREIGN KEY(subj_id) REFERENCES Subject(Subj_id)
		ON DELETE CASCADE
)

Drop TABLE Grade;

	
delete form prof where member_id='hong';

INSERT INTO Grade(grade_seq,score,exam_data,subj_id,member_id)
VALUES(seq.nextval,'90','2017-03','java','kim');


select *from STUD;
select *from member;
select *from major;

drop table student;
select * from student;

create view student (num,id,name,ssn,regdate,phone,email,title)
as
select rownum, t.*
from (select
a.member_id, a.name, rpad(substr(a.ssn,1,8),14,'*') ssn,
	to_char(a.regdate,'yyyy-MM-dd') regdate, a.phone, a.email,
	listagg(s.title,',') within group(order by s.title) title
from member a
left join major m on a.member_id like m.member_id
left join subject s on m.subj_id like s.subj_id
group by a.member_id, a.name, a.ssn, a.regdate, a.phone,a.email
order by regdate
)t
order by rownum desc;








