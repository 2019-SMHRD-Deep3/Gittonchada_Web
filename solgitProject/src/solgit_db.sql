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
'댓글 1',
sysdate,
1,
1
);

select * from reply;
delete from reply where reply_idx=29;
-- 과거 발전량 정보
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
'광주 발전량.csv',
'광주 광역시',
'모델명 : gitdongcha',
sysdate,
'대기중',
1
);
select * from LOAD_FILE;
delete from load_file where file_seq=2;
UPDATE Load_File SET file_check = '확인완료' WHERE file_seq = 3;










-- 공지사항 글--

insert into NOTICE
values(
notice_seq.nextval,
'관리자',
'솔깃 오픈',
'2020년 5월 11일 솔깃 서비스가 오픈되었습니다. 많은 관심 부탁드립니다.',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'관리자',
'공지사항 입니다.',
'서비스 점검으로 2020/05/01 서비스 이용이 중지됩니다.',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'관리자',
'일시 점검중',
'현재 일시적인 접속장애로 SMP예측 서비스를 사용하실 수 없습니다. 양해부탁드립니다.',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'관리자',
'2020 하계 워크샵',
'5월 13~14일은 워크샵으로 인해 정상적인 업무가 어려우니 양해부탁드립니다. <br>문의사항은 고객분의에 남겨주시면 최대한 빠른 시일내에 연락드리겠습니다. 감사합니다.',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'관리자',
'솔깃 앱서비스 오픈',
'5월 11일 솔깃 앱서비스가 오픈되었습니다. 많은 관심 바랍니다. <br>더욱 쉽고 편리하게 솔깃서비스를 접해보세요',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'관리자',
'개인정보 처리방침 변경 공지',
'10. 이용자 및 법정대리인의 권리와 그 행사방법
가. 이용자 및 그 법정대리인은 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며, 가입 해지를 요청할 수도 있습니다.
나. 이용자 및 그 법정대리인은 이용자의 개인정보 조회, 수정을 위해서는 “정보수정”을, 가입 해지(동의철회)를 위해서는 “회원탈퇴”를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능하며, 혹은 개인정보관리책임자에게 서면, 전화 또는 전자우편을 통한 처리가 가능합니다.
다. 이용자 및 그 법정대리인이 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 합니다.
라. 회사는 이용자 및 그 법정대리인의 요청에 의해 해지 또는 삭제된 개인정보를 “5. 개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고, 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'관리자',
'솔깃 2020 스마트미디어인재개발원 최우수상 수상',
'고객님들의 사랑으로 태양광1위기업, 솔깃이 2020 스마트미디어인재개발원 최종프로젝트 최우수상을 수상하였습니다. <br> 앞으로도 발전하는 솔깃이 되겠습니다. 감사합니다.',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'관리자',
'지금, 솔깃에 가입하면 기프티콘 증정!',
'5월 한 달 간, 솔깃 태양광 예측서비스에 가입하신 분들을 위해 기프티콘을 드립니다. 많은 신청 부탁드립니다. <br> 한정수량이니 서둘러주세요~',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'관리자',
'관리자 인사말',
'여러분 반갑습니다. <br> 솔깃 서비스에 방문해주셔서 감사합니다. 앞으로도  많은 관심과 성원 부탁드립니다. ^^*',
sysdate,
0);
insert into NOTICE
values(
notice_seq.nextval,
'관리자',
'관리자 인사말',
'여러분 반갑습니다. <br> 솔깃 서비스에 방문해주셔서 감사합니다. 앞으로도  많은 관심과 성원 부탁드립니다. ^^*',
sysdate,
0);













--커뮤니티 샘플
INSERT INTO Board VALUES ( board_idx.nextval, '^^*',  '^^', '100키로 미만 접수 일자', '100키로 미만 접수 일자 늦춰졌다는 소리를 들었는데...<br>진짜인가요??',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '태양광',  '123', '고정가격 입찰', '고정가격 입찰하려고 정보 입력중인제 인버터 모델을 아무리 찾아보도 안나오는데 저같은 사업주분들 계실까요?? ㅜㅠ<br>신재생 에너지 센터 전화연결도 안되네요',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '어부',  'zxc', '오늘도 좋은 발전량^^', '안녕하세요 <br> 오늘도 다들 좋은 발전량 만드시길 바랍니다~~',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '이람보',  '123123', '입찰가', '입찰가 3원이 예를 들어 165랑 167원이 가중치 1.5하니 3천원 차이나는데<br>월 수익 얼마나 차이나는걸까요?',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '2020',  '220', '배전반 전원 꺼지는 문제', '혹시 한번씩 배전반 전원이 꺼지는 분 있으신가요?<br>작년에 두번 꺼지더니 오늘 또 꺼졌네요..',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '야스옹',  'abc', '주택지원 사업', '주택지원사업으로 태양광을 설치하면 상계거래 가능한가요?<br>태양광 시공사 홈페이지 방문하다가 주택지원사업은 상계거래가 불가능합니다라는 안내가 있던데 참여업체가 아니라서 그러는 건가요??',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '고정가격',  'aaa', '2020상반기 입찰가', '2020상반기 100kW이상 1MW이하 장기계약 입찰 평균가 159.178원<br>통계학적으로 계산했습니다ㅋㅋㅋ<br>19년 하반기 평균가 150.473원 경쟁률 11.79:1<br>20년 상반기 예상 경쟁률 7.28:1',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '솔라',  'solar', 'ESS 배터리 이용률 질문이요', 'ESS에 배터리 이용률이라는게 정확히 어떤걸 의미하나요??<br> 말 그대로 배터리 차징 몇퍼센트까지 할건지 정하는 건가요??',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '태양소리',  '123', 'Rps 설비확인 신청 문의좀요..', '3월 13일에 사용전 검사하고 오늘에서야 rps접수하려고 하는데 한달치 소멸한건가요??? <br> 실제 상업 운전은 3우러 21일인데 기준이 뭔가요??ㅠㅠ<br>사용전 검사일 기준 1달 이후에 설비신청을 넣으시면 1달동안 발전된 REC는 이미 날라갔다고 보면 되나요?',  sysdate,   1,  '1',  1);
INSERT INTO Board VALUES ( board_idx.nextval, '좋은날',  '111', 'sma 인버터 에러', 'sma인버터 에러뜨고 멈췄습니다ㅠㅠㅠ<br>현재 50키로짜리 인버터 3개, A인버터 2개 1기 발전소, B인버터 1개 1기발전소중 A인버터 2개 에러, A분전반에 콘센트로 연결된 인터넷 모니터링 기기도 전원 다운<br>재부팅해도 인버터 에러메세지 뜨네요.. ',  sysdate,   1,  '1',  1);







