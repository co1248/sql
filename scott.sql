select ename,sal,comm,sal * 12,sal * 12 + nvl(comm,0) as "연  봉"
from emp;

select *
from dept;

select deptno 부서번호, dname 부서명, loc 근무지역
from dept;

select deptno
from emp;

select DISTINCT deptno
from emp;

select DISTINCT job
from emp;

