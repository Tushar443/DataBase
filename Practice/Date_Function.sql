create table datetable(
	hiredate datetime
);

insert into datetable values('2019-10-15'),
('2019-12-31'),
('2019-03-15');

select * from datetable;

select sysdate() from dual;

select now() from dual;

select now(),sysdate(),sleep(2),now(),sysdate();

select adddate(sysdate(),7); 

select adddate(sysdate(),-7); 

select datediff(sysdate(),hiredate) from datetable;

select date_add(hiredate,interval 2 month) from datetable;

select date_add(hiredate,interval -2 month) from datetable;

select date_add(hiredate,interval 1 year) from datetable;

select dayname(sysdate());

select addtime(hiredate,'1') from datetable;

select addtime(hiredate,'01:00:00') from datetable;


