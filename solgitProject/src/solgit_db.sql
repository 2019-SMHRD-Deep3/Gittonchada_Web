-- ������ �������� solgit ���� ����
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

-- �������� �Խ���
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
'�������� �Դϴ�.',
'���� �������� 2020/05/01 ���� �̿��� �����˴ϴ�.',
sysdate,
0);

select * from notice;

-- �Խ��� ���
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
    REFERENCES BOARD (Board_Idx) ON DELETE CASCADE
);

CREATE SEQUENCE Reply_SEQ
START WITH 1
INCREMENT BY 1;

INSERT INTO REPLY
VALUES(
Reply_SEQ.nextval,
'admin@naver.com',
'123',
'��� 1',
sysdate,
1,
1
);

select * from reply;
delete from reply where reply_idx=29;
-- ���� ������ ����
drop table Load_File;
drop sequence File_seq;

CREATE TABLE Load_File
(   File_seq          NUMBER            NOT NULL, 
    File_name         VARCHAR2(50)      NOT NULL, 
    File_local        VARCHAR2(50)      NOT NULL,
    File_content      VARCHAR2(1000)    NULL,
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
'���� ������.csv',
'���� ������',
'�𵨸� : gitdongcha',
sysdate,
'�����',
1
);
select * from LOAD_FILE;
delete from load_file where file_seq=2;
UPDATE Load_File SET file_check = 'Ȯ�οϷ�' WHERE file_seq = 3;










-- �������� ��--

insert into NOTICE
values(
notice_seq.nextval,
'������',
'�ֱ� ����',
'2020�� 5�� 11�� �ֱ� ���񽺰� ���µǾ����ϴ�. ���� ���� ��Ź�帳�ϴ�.',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'������',
'�������� �Դϴ�.',
'���� �������� 2020/05/01 ���� �̿��� �����˴ϴ�.',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'������',
'�Ͻ� ������',
'���� �Ͻ����� ������ַ� SMP���� ���񽺸� ����Ͻ� �� �����ϴ�. ���غ�Ź�帳�ϴ�.',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'������',
'2020 �ϰ� ��ũ��',
'5�� 13~14���� ��ũ������ ���� �������� ������ ������ ���غ�Ź�帳�ϴ�. <br>���ǻ����� �����ǿ� �����ֽø� �ִ��� ���� ���ϳ��� �����帮�ڽ��ϴ�. �����մϴ�.',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'������',
'�ֱ� �ۼ��� ����',
'5�� 11�� �ֱ� �ۼ��񽺰� ���µǾ����ϴ�. ���� ���� �ٶ��ϴ�. <br>���� ���� ���ϰ� �ֱ꼭�񽺸� ���غ�����',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'������',
'�������� ó����ħ ���� ����',
'10. �̿��� �� �����븮���� �Ǹ��� �� �����
��. �̿��� �� �� �����븮���� �������� ��ϵǾ� �ִ� �ڽ��� ���������� ��ȸ�ϰų� ������ �� ������, ���� ������ ��û�� ���� �ֽ��ϴ�.
��. �̿��� �� �� �����븮���� �̿����� �������� ��ȸ, ������ ���ؼ��� ��������������, ���� ����(����öȸ)�� ���ؼ��� ��ȸ��Ż�𡱸� Ŭ���Ͽ� ���� Ȯ�� ������ ��ġ�� �� ���� ����, ���� �Ǵ� Ż�� �����ϸ�, Ȥ�� ������������å���ڿ��� ����, ��ȭ �Ǵ� ���ڿ����� ���� ó���� �����մϴ�.
��. �̿��� �� �� �����븮���� ���������� ������ ���� ������ ��û�Ͻ� ��쿡�� ������ �Ϸ��ϱ� ������ ���� ���������� �̿� �Ǵ� �������� �ʽ��ϴ�. ���� �߸��� ���������� ��3�ڿ��� �̹� ������ ��쿡�� ���� ó������� ��3�ڿ��� ��ü ���� �����Ͽ� ������ �̷�������� �մϴ�.
��. ȸ��� �̿��� �� �� �����븮���� ��û�� ���� ���� �Ǵ� ������ ���������� ��5. ���������� ���� �� �̿�Ⱓ���� ��õ� �ٿ� ���� ó���ϰ�, �� ���� �뵵�� ���� �Ǵ� �̿��� �� ������ ó���ϰ� �ֽ��ϴ�.',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'������',
'�ֱ� 2020 ����Ʈ�̵�����簳�߿� �ֿ���� ����',
'���Ե��� ������� �¾籤1�����, �ֱ��� 2020 ����Ʈ�̵�����簳�߿� ����������Ʈ �ֿ������ �����Ͽ����ϴ�. <br> �����ε� �����ϴ� �ֱ��� �ǰڽ��ϴ�. �����մϴ�.',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'������',
'����, �ֱ꿡 �����ϸ� ����Ƽ�� ����!',
'5�� �� �� ��, �ֱ� �¾籤 �������񽺿� �����Ͻ� �е��� ���� ����Ƽ���� �帳�ϴ�. ���� ��û ��Ź�帳�ϴ�. <br> ���������̴� ���ѷ��ּ���~',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'������',
'������ �λ縻',
'������ �ݰ����ϴ�. <br> �ֱ� ���񽺿� �湮���ּż� �����մϴ�. �����ε�  ���� ���ɰ� ���� ��Ź�帳�ϴ�. ^^*',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'������',
'������ �λ縻',
'������ �ݰ����ϴ�. <br> �ֱ� ���񽺿� �湮���ּż� �����մϴ�. �����ε�  ���� ���ɰ� ���� ��Ź�帳�ϴ�. ^^*',
sysdate,
0);













--Ŀ�´�Ƽ ����
INSERT INTO Board VALUES ( board_idx.nextval, '^^*',  '^^', '100Ű�� �̸� ���� ����', '100Ű�� �̸� ���� ���� �������ٴ� �Ҹ��� ����µ�...<br>��¥�ΰ���??',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '�¾籤',  '123', '�������� ����', '�������� �����Ϸ��� ���� �Է������� �ι��� ���� �ƹ��� ã�ƺ��� �ȳ����µ� ������ ����ֺе� ��Ǳ��?? �̤�<br>����� ������ ���� ��ȭ���ᵵ �ȵǳ׿�',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '���',  'zxc', '���õ� ���� ������^^', '�ȳ��ϼ��� <br> ���õ� �ٵ� ���� ������ ����ñ� �ٶ��ϴ�~~',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '�̶���',  '123123', '������', '������ 3���� ���� ��� 165�� 167���� ����ġ 1.5�ϴ� 3õ�� ���̳��µ�<br>�� ���� �󸶳� ���̳��°ɱ��?',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '2020',  '220', '������ ���� ������ ����', 'Ȥ�� �ѹ��� ������ ������ ������ �� �����Ű���?<br>�۳⿡ �ι� �������� ���� �� �����׿�..',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '�߽���',  'abc', '�������� ���', '��������������� �¾籤�� ��ġ�ϸ� ���ŷ� �����Ѱ���?<br>�¾籤 �ð��� Ȩ������ �湮�ϴٰ� ������������� ���ŷ��� �Ұ����մϴٶ�� �ȳ��� �ִ��� ������ü�� �ƴ϶� �׷��� �ǰ���??',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '��������',  'aaa', '2020��ݱ� ������', '2020��ݱ� 100kW�̻� 1MW���� ����� ���� ��հ� 159.178��<br>����������� ����߽��ϴ٤�����<br>19�� �Ϲݱ� ��հ� 150.473�� ����� 11.79:1<br>20�� ��ݱ� ���� ����� 7.28:1',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '�ֶ�',  'solar', 'ESS ���͸� �̿�� �����̿�', 'ESS�� ���͸� �̿���̶�°� ��Ȯ�� ��� �ǹ��ϳ���??<br> �� �״�� ���͸� ��¡ ���ۼ�Ʈ���� �Ұ��� ���ϴ� �ǰ���??',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '�¾�Ҹ�',  '123', 'Rps ����Ȯ�� ��û ��������..', '3�� 13�Ͽ� ����� �˻��ϰ� ���ÿ����� rps�����Ϸ��� �ϴµ� �Ѵ�ġ �Ҹ��Ѱǰ���??? <br> ���� ��� ������ 3�췯 21���ε� ������ ������??�Ф�<br>����� �˻��� ���� 1�� ���Ŀ� �����û�� �����ø� 1�޵��� ������ REC�� �̹� ���󰬴ٰ� ���� �ǳ���?',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '������',  '111', 'sma �ι��� ����', 'sma�ι��� �����߰� ������ϴ٤ФФ�<br>���� 50Ű��¥�� �ι��� 3��, A�ι��� 2�� 1�� ������, B�ι��� 1�� 1��������� A�ι��� 2�� ����, A�����ݿ� �ܼ�Ʈ�� ����� ���ͳ� ����͸� ��⵵ ���� �ٿ�<br>������ص� �ι��� �����޼��� �߳׿�.. ',  sysdate,   1,  '1',  1);







