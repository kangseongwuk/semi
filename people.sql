-- table people

create table people(
    ID   varchar2(50) primary key not null,
    PW   varchar2(50) not null,
    NAME   varchar2(15) not null,
    GENDER   varchar2(6) not null,
    AGE   number(3) not null,
    GENRE   varchar2(150) not null
);

drop table people;
select * from people;

insert into people values('admin','1234','관리자','남자','30','all');
insert into people values('aaa','1234','관리자','남자','30','all');
insert into people values('bbb','1234','관리자','남자','30','all');
insert into people values('ccc','1234','관리자','남자','30','all');
insert into people values('ddd','1234','관리자','남자','30','all');
insert into people values('eee','1234','관리자','남자','30','all');
insert into people values('fff','1234','관리자','남자','30','all');

alter table people modify(genre varchar2(150));

commit;

-- table board
create table board(
   B_NO   number primary key,
   WRITER   varchar2(50) not null,
   SUBJECT   varchar2(300) not null,
   password varchar(15) not null,
   REG_DATE   date, 
   REF   number, 
   RE_STEP   number, 
   RE_LEVEL   number,
   READCOUNT   number,
   CONTENT   varchar2(500) not null
);

select * from board;

create sequence board_num
   start with 1
   increment by 1
   minvalue 1
   maxvalue 1000
   cycle;
   
drop sequence board_num;

drop table board;

insert into board values(board_num.nextval, 'admin', '공지사항', '1234', sysdate, 1, 1, 1, 0, '안녕하세요.');

--------------------------------------------------------------------------------------------------


--table movie
create table movie(
   mno varchar2(7) primary key not null,
   title varchar2(500) not null,
   genre varchar2(1000) not null,
   country varchar2(500) not null,
   runtime varchar2(500) not null,
   age varchar2(500) not null,
    opendate varchar2(500) not null,
    director varchar2(500) not null,
    actor varchar2(500) not null,
    story varchar2(2000) not null,
    poster varchar2(500) not null,
    love number(2,1) not null
);    
        --12개   ROUND("값", "자리수")
insert into movie values('23138','죽어도 좋은 경험','드라마','국내','95분','청소년 관람불가','2021-07-15','김기영','윤여정, 이탐미, 현길수','수로 아이를 잃은 ‘여정’은 우연히 만난 ‘명자’가 남편의 외도로  억울하게 이혼당했다는 사실을 알게 된다.   모든 비밀과 진실을 알고 있는 ‘여정’은 ‘명자’와 치밀한 계획 아래  서로 상대방의 남편을 살해한다는 범죄를 공모한다.   독을 품은 두 여자의 광기 어린 복수극이 시작된다!','/images/movie.png','7.9');

    drop table movie;
    
    select * from movie;

-----------

--table reword
  create table reword(
   rno varchar2(7) primary key not null,
   mno varchar2(7)  not null,
   title varchar2(500) not null,
   grade number(2,1) not null,
   writing varchar2(1000) not null
);


drop table reword;

--다시 만든 버전
create table reword(
    rno number primary key,
    mno varchar2(7)  not null,
    title varchar2(500) not null, --mno, title 겹치는 것 아닌가?
    grade number(2,1) not null,
    writing varchar2(1000) not null
    --FOREIGN KEY (title) REFERENCES movie(mno)
);

select * from reword;

--reword 시퀀스
create sequence reword_num
   start with 2
   increment by 1
   minvalue 1
   maxvalue 1000
   cycle;
   
drop sequence reword_num;   
   
-- foreign key 연결
alter table reword
add constraint fk_title foreign key (mno) references movie(mno);

insert into reword values('1','23138','죽어도 좋은 경험', 5,'재미있어요');






--테이블에 외래키 제약조건을 비활성화
alter table reword
disable constraint fk_title;

--테이블에 외래키 제약조건을 활성화
alter table reword
enable constraint fk_title;

--테이블 모든 데이터 삭제
truncate table reword;

--테이블에 외래키 제약조건 삭제
alter table reword
drop constraint fk_title cascade;

commit;

select * from movie where mno='0' order by mno;