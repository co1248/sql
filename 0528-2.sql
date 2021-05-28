create table emp01
(
    empno number(4) constraint emp01_empno_pk primary key,
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2) constraint emp01_deptno_fk references dept01(deptno)
);

create table dept01
(
    deptno number(2) constraint dept01_deptno_pk primary key,
    dname varchar2(14),
    loc varchar2(13)
);

create table salgrade01
(
    grade NUMBER,
    losal NUMBER,
    hisal NUMBER
);

insert into dept01
values (10,'ACCOUNTING','NEW YORK');
insert into dept01
values (20,'RESEARCH','DALLAS');
insert into dept01
values (30,'SALES','CHICAGO');
insert into dept01
values (40,'OPERATIONS','BOSTON');

insert into emp01
values (7369, 'SMITH', 'CLERK', 7902, '80/12/17', 800, NULL, 20);
insert into emp01
values (7499, 'ALLEN', 'SALESMAN', 7698, '81/02/20', 1600, 300, 30);
insert into emp01
values (7521, 'WARD', 'SALESMAN', 7698, '81/02/22', 1250, 500, 30);
insert into emp01
values (7566, 'JONES', 'MANAGER', 7839, '81/04/02', 2975, NULL, 20);

select *
from dept01;

select *
from emp01;

update emp01
set deptno = 10
where ename = 'SMITH';

commit;

delete from emp01
where deptno = 30;

rollback;
