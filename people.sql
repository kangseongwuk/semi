create table people(
	id varchar2(50) primary key,
	pw varchar2(50) not null,
	name varchar2(15) not null,
	gender varchar2(6) not null,
	age number(3) not null,
	genre varchar2(1000) not null
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

create table people(
    ID   varchar2(50) primary key not null,
    PW   varchar2(50) not null,
    NAME   varchar2(15) not null,
    GENDER   varchar2(6) not null,
    AGE   number(3) not null,
    GENRE   varchar2(50) not null
);

select * from people;

desc people;

drop table people;

commit;

insert into people values('admin', '1234', 'admin1', 'M', 30, 'comic');
insert into people values('aaa', '1234', 'aaa', 'F', 26, 'horror');

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