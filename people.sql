create table people(
	id varchar2(50) primary key,
	pw varchar2(50) not null,
	name varchar2(15) not null,
	gender varchar2(6) not null,
	age number(3) not null,
	genre varchar2(50)
);

select * from people;

insert into people values('admin','1234','관리자','남자','30',null);