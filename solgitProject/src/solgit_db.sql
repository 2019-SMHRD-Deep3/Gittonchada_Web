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
    member_Phone      NUMBER     		NOT NULL, 
    member_name    VARCHAR(1000)    NOT NULL, 
    member_Date       DATE             NOT NULL, 
    member_Manager	    	NUMBER		    	NULL,
    CONSTRAINT MEMBER_PK1 PRIMARY KEY (member_Seq)
);



INSERT INTO member
VALUES
    (
    member_Seq.nextval,
    'Member_email 1', 
    'Member_pw 1', 
    010-0000-0000, 
    'Member_name 1', 
    '05/03/23',
    1
    );

INSERT INTO member
VALUES
    (
    member_Seq.nextval,
    'admin@naver.com', 
    '1', 
    010-0000-0000, 
    'Member_name 1', 
    '05/03/23',
    1
    );
    
select * from member;


select * from MEMBER where MEMBER_EMAIL='admin@naver.com' and MEMBER_PW='1';

