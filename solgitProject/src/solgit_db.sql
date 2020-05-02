-- 관리자 계정에서 solgit 유저 생성
--conn system/12345
--create user solgit identified by solgit
--User created.
--grant connect, resource, dba to solgit;
--Grant succeeded.


DROP TABLE BOARD;
DROP SEQUENCE BOARD_IDX;
CREATE TABLE BOARD
(
    Board_Idx        NUMBER           NOT NULL, 
    Board_ID         VARCHAR2(20)     NOT NULL, 
    Board_PW         VARCHAR2(20)     NULL, 
    Board_Title      VARCHAR2(100)     NOT NULL, 
    Board_Content    VARCHAR(1000)    NOT NULL, 
    Board_Date       DATE             NOT NULL, 
    Board_Hit        NUMBER           NOT NULL, 
    Lock_Post        CHAR(1)          NULL, 
    Member_Seq       NUMBER           NULL, 
    CONSTRAINT BOARD_PK PRIMARY KEY (Board_Idx)
);

CREATE SEQUENCE Board_Idx
START WITH 1
INCREMENT BY 1;

INSERT INTO Board
VALUES
    (
    board_idx.nextval,
    'Board_ID 1', 
    'Board_PW 1', 
    'Board_Title 1', 
    'Board_Content 1', 
    sysdate, 
    1, 
    'N', 
    1);
select * from BOARD;





DROP TABLE member CASCADE CONSTRAINT;
DROP SEQUENCE member_Seq;

CREATE SEQUENCE member_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE member
(
    member_Seq        NUMBER           NOT NULL, 
    member_Email         VARCHAR2(20)     NOT NULL, 
    member_PW         VARCHAR2(20)    NOT NULL, 
    member_birth       DATE             NOT NULL, 
    member_Phone      VARCHAR2(20)     		NOT NULL, 
    member_name    VARCHAR(1000)    NOT NULL, 
    member_Manager	    	NUMBER		    	NULL,
    CONSTRAINT MEMBER_PK1 PRIMARY KEY (member_Seq)
);



INSERT INTO member
VALUES
    (
    member_Seq.nextval,
    'M@a.com', 
    '4444', 
    '05/03/23',
    010-1111-0000, 
    'Member_name 1', 
    1
    );

INSERT INTO member
VALUES
    (
    member_Seq.nextval,
    'admin@naver.com', 
    '1', 
    '05/03/23',
    010-0000-0000, 
    'Member_name 1', 
    1
    );
    
select * from member;


select * from MEMBER where MEMBER_EMAIL='admin@naver.com' and MEMBER_PW='1';

-- 공지사항 게시판
drop table Notice;
drop sequence Notice_seq;

CREATE TABLE Notice
(   Notice_Idx         NUMBER            NOT NULL, 
    Notice_ID          VARCHAR2(20)      NOT NULL, 
    Notice_Title       VARCHAR2(100)      NOT NULL, 
    Notice_Content     VARCHAR2(1000)    NOT NULL, 
    Notice_Date        DATE              NOT NULL, 
    Notice_Hit         NUMBER            NOT NULL,
    CONSTRAINT Notice_PK1 PRIMARY KEY (Notice_Idx)
);

CREATE SEQUENCE Notice_SEQ
START WITH 1
INCREMENT BY 1;

insert into NOTICE
values(
notice_seq.nextval,
'admin@naver.com',
'공지사항 입니다.',
'서비스 점검으로 2020/05/01 서비스 이용이 중지됩니다.',
sysdate,
0);

select * from notice;

-- 게시판 댓글
drop table Reply
drop sequence Reply_seq;

CREATE TABLE Reply
(   Reply_Idx        NUMBER            NOT NULL, 
    Reply_ID         VARCHAR2(20)      NOT NULL, 
    Reply_PW         VARCHAR2(20)      NOT NULL, 
    Reply_Content    VARCHAR2(1000)    NOT NULL, 
    Reply_Date       DATE              NOT NULL, 
    Board_Idx        NUMBER            NOT NULL, 
    Member_Seq       NUMBER            NULL, 
    CONSTRAINT REPLY_PK PRIMARY KEY (Reply_Idx),
    CONSTRAINT REPLY_FK FOREIGN KEY (Board_Idx) 
    REFERENCES BOARD (Board_Idx)
);

CREATE SEQUENCE Reply_SEQ
START WITH 1
INCREMENT BY 1;

INSERT INTO REPLY
VALUES(
Reply_SEQ.nextval,
'admin@naver.com',
'123',
'댓글 1',
sysdate,
1,
1
);

select * from reply;

-- 과거 발전량 정보
drop table Load_File;
drop sequence File_seq;

CREATE TABLE Load_File
(   File_seq          NUMBER            NOT NULL, 
    File_name         VARCHAR2(20)      NOT NULL, 
    File_local        VARCHAR2(50)      NOT NULL, 
    File_date         DATE    NOT NULL, 
    File_check        VARCHAR2(20)              NOT NULL, 
    Member_Seq        NUMBER            NOT NULL, 
    CONSTRAINT FILE_PK PRIMARY KEY (File_seq),
    CONSTRAINT FILE_FK FOREIGN KEY (Member_Seq) 
    REFERENCES MEMBER (member_Seq)
);

CREATE SEQUENCE File_seq
START WITH 1
INCREMENT BY 1;

INSERT INTO Load_File
VALUES(
File_seq.nextval,
'광주 발전량.csv',
'광주 광역시',
sysdate,
'대기중',
1
);

select * from LOAD_FILE;