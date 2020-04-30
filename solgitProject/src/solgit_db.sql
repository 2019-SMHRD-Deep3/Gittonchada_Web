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
    'Y', 
    null);
select * from BOARD;