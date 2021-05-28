--서브쿼리
select dname --메인쿼리
from dept
where deptno = (
                select deptno --서브쿼리
                from emp
                where ename = 'SMITH'
                );

select ename,sal
from emp
where sal = max(sal); --그룹함수는 where절에 사용할 수 없다.
--그룹함수는 셀렉트절과 그룹바이할때 해빙절에만 쓸 수 있다.

select ename,sal
from emp
where sal = (
             select max(sal)
             from emp
             );
--결과값을 조건절의 값으로 활용한다.

--단일행 서브쿼리 (조회결과가 하나인 형태)
--다중행 서브쿼리 (조회결과가 여러개인 형태) in, all, any, some(any와 같다) ...

select deptno
from emp
where sal >= 3000;
--조회결과가 2개 10,20이 나온다.
--그래서 아래에 = 쓰면 에러가 나고 in연산자를 사용한다.
select ename,sal,deptno
from emp
where deptno in (
                select deptno
                from emp
                where sal >= 3000
                ); --in or대신사용한 연산자

select ename,sal
from emp
where sal > (
            select max(sal)
            from emp
            where deptno = 30
            );
      
select ename,sal
from emp
where sal > all (
            select sal
            from emp
            where deptno = 30
            );
--all 이 쿼리문에 실행하는 값을 모두 포함해서 

select ename,sal
from emp
where sal > any (
            select sal
            from emp
            where deptno = 30
            );
--any 최소값보다 더 많이 받는

--직급이(job) manager인 사람이 속한 부서의 부서번호와 부서명과 지역을 출력하세요
select *
from dept
where deptno in (
                select deptno
                from emp
                where lower(job) = 'manager'
);
--lower() 다 소문자로 바꿔준다.

--오라클이 제공하는 컬럼 rownum
--rownum의 조건절엔 반드시 1을 포함하는 조건을 가져야 한다.
--모든 조건을 1부터 처리한다.
--rownum은 뷰형태로 만들어서 사용한다.
create or replace view view_hire
as
select empno,ename,hiredate
from emp
order by hiredate asc;

select rownum, v.* --컬럼데이트 한꺼번에 쓰고 컬럼 또 추가할때 별칭을 이용한다.
from view_hire v --별칭 한번쓰면 계속 별칭으로 써야한다.
where rownum <=5;

--select rownum, view_hire.*
--from view_hire
--where rownum <=5;

--select rownum, v.*
--from view_hire v
--where rownum >=2 and rownum <=4;
--rownum 조건범위안에 반드시 1이 포함되어 있어야 한다.

--인라인뷰
--뷰를 만들지 않고 임시커리문을쓴다.
select rm, empno, ename, hiredate
from (
      select rownum rm, v1.*
      from (
            select empno, ename, hiredate
            from emp
            order by hiredate asc
           ) v1
     )
where rm >=2 and rm <=4;