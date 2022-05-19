create database dbtexam_a;
use dbtexam_a;

CREATE TABLE dept (
    deptno int NOT NULL,
    dname varchar(14),
    loc varchar(13)
);

INSERT INTO dept (deptno, dname, loc) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept (deptno, dname, loc) VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO dept (deptno, dname, loc) VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO dept (deptno, dname, loc) VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE emp (
    empno int NOT NULL,
    ename varchar(10),
    job varchar(9),
    mgr int,
    hiredate date,
    sal int,
    comm int,
    deptno int
);

INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7369, 'SMITH', 'CLERK', 7902, '1980-12-17 00:00:00', 800, NULL, 20);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20 00:00:00', 1600, 300, 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22 00:00:00', 1250, 500, 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7566, 'JONES', 'MANAGER', 7839, '1981-04-02 00:00:00', 2975, NULL, 20);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28 00:00:00', 1250, 1400, 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01 00:00:00', 2850, NULL, 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09 00:00:00', 2450, NULL, 10);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19 00:00:00', 3000, NULL, 20);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17 00:00:00', 5000, NULL, 10);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08 00:00:00', 1500, 0, 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7876, 'ADAMS', 'CLERK', 7788, '1987-05-23 00:00:00', 1100, NULL, 20);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7900, 'JAMES', 'CLERK', 7698, '1981-12-03 00:00:00', 950, NULL, 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7902, 'FORD', 'ANALYST', 7566, '1981-12-03 00:00:00', 3000, NULL, 20);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7934, 'MILLER', 'CLERK', 7782, '1982-01-23 00:00:00', 1300, NULL, 10);



select * from emp;
select * from dept;

select ename from emp where job='clerk' or job='salesman' or job='analyst' and sal>3000;


 select empno,ename,hiredate from emp order by 3;
 
 select deptno,sum(sal) from emp group by deptno;

select empno,ename,deptno from emp where deptno in(10,20);

select ename from emp where substr(ename,1,1) like 's' or substr(ename,-1,1) like 'd';
create table temp (
c_empno int,
c_ename varchar(10),
c_job varchar(10),
c_mgr int,
c_hiredate date,
c_sal int,
c_comm int,
c_deptno int
);

delimiter //
	   create procedure emp_details ()
	   begin
	declare c_empno int ;
    declare c_ename varchar(10);
    declare c_job varchar(9);
    declare c_mgr int;
    declare c_hiredate date;
    declare c_sal int;
    declare c_comm int;
    declare c_deptno int;
		declare  c1 cursor for select * from emp;
        declare flag int default 1;
        declare continue handler for not found set flag=0;
         open c1;
        c_loop : loop
			fetch c1 into c_empno,c_ename,c_job,c_mgr,c_hiredate,c_sal,c_comm,c_deptno;
			if flag =0 then
				leave c_loop;
			else
          
            insert into temp values(c_empno,c_ename,c_job,c_mgr,c_hiredate,c_sal,c_comm,c_deptno);
          
		end loop c_loop;
        close c1;
	   end; //
delimiter ;

call emp_details();

select * from temp;






