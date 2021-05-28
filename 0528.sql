select TABLE_NAME
from user_tables
order by table_name desc;

desc user_constraints;

select constraint_name, constraint_type, table_name
from user_constraints;

select *
from salgrade;

select ename,dname,grade
from emp e,dept d,salgrade s
where e.deptno = d.deptno
and e.sal BETWEEN s.losal and s.hisal;

desc user_indexes;
desc user_views;

desc all_indexes;
desc all_views;

--system계정에서 조회
desc dba_indexes;
desc dba_views;

create index emp_ename
on emp(ename);

select index_name, table_name
from user_ind_columns
where table_name in ('EMP');

drop index emp_ename;

--인덱스는 데이터의 검색의 속도를 높이기위한 객체로 해당테이블의 컬럼에 생성하며 특정컬럼을 사용했을때 조회속도가 빨라지게합니다.

create table empcopy
as
select * from emp;

create or replace view empview
as
select * from emp;

drop table empcopy;
drop view empview;