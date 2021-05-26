SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;
-- 조건절 where <,>,<=,>=,=,!=,<>

SELECT
    *
FROM
    emp
WHERE
    deptno = 10;
--숫자 문자 날짜를 값으로 많이 쓴다.

SELECT
    *
FROM
    emp
WHERE
    ename = 'FORD';
--문자를 사용할땐 ''로 묶어줘야 한다. 비교식에 들어가는 문자는 대소문자를 가린다.

SELECT
    empno,
    ename,
    sal
FROM
    emp
WHERE
    ename = 'SMITH';

--날짜정보에는 눈에 보이지 않아도 연월일 시분초가 다들어가있다.
SELECT
    *
FROM
    emp
WHERE
    hiredate <= '1981/11/17';
--문자와 날짜정보는 반드시 ''를 찍어줘야 한다.

--논리연산자 and,or,not
SELECT
    *
FROM
    emp
WHERE
    deptno = 10
    OR job = 'MANAGER';

SELECT
    *
FROM
    emp
WHERE
    NOT deptno = 10;

SELECT
    *
FROM
    emp
WHERE
    deptno <> 10;

SELECT
    *
FROM
    emp
WHERE
        sal <= 3000
    AND sal >= 2000;

SELECT
    *
FROM
    emp
WHERE
    sal > 3000
    OR sal < 2000;

SELECT
    *
FROM
    emp
WHERE
    empno = 7499
    OR empno = 7566
    OR empno = 7844;

--where sal <= 3000 and sal >= 2000;
SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;
--자신을 포함한다.

SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;

SELECT
    *
FROM
    emp
WHERE
    hiredate BETWEEN '81/02/01' AND '81/06/30';

--where empno = 7499 or empno = 7566 or empno = 7844;
SELECT
    *
FROM
    emp
WHERE
    empno IN ( 7499, 7566, 7844 );

SELECT
    *
FROM
    emp
WHERE
    empno NOT IN ( 7499, 7566, 7844 );

--와일드카드(LIKE % , _)
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'M%';

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%A%';

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_A_';
--_굴자 하나를 의미한다. 글자가 3글자 여야한다. &있기만 하면 된다.

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_A%';
--2번째 글자가 무조건 a인 사람.

SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '_A%';


--where comm = 'null';
--null는 연산할 수 없다.
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;

SELECT
    *
FROM
    emp
WHERE
    comm IS NOT NULL;

SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;

--오른차순정렬asc(생략가능) 내림차순정렬desc
SELECT
    *
FROM
    emp
ORDER BY
    sal ASC;

SELECT
    *
FROM
    emp
ORDER BY
    sal DESC;

SELECT
    *
FROM
    emp
ORDER BY
    ename DESC;

SELECT
    *
FROM
    emp
WHERE
    deptno = 30
ORDER BY
    sal DESC,
    ename DESC;
--order절은 무조건 마지막에 와야한다.

SELECT
    - 10,
    abs(- 10)
FROM
    dual;
--abs절대값을 만들어 내는 함수

SELECT
    round(34.5678)
FROM
    dual;

SELECT
    round(34.5678, 2)
FROM
    dual;
--소수점 이하 2번째자리까지 보이게 반올림(3번째자리에서 반올림)

SELECT
    trunc(34.5678)
FROM
    dual;
--소수점을 버리는 함수

SELECT
    trunc(34.5678, 2)
FROM
    dual;

SELECT
    mod(27, 2)
FROM
    dual;
--앞에 주어진 숫자를 뒤에 주어진 숫자로 나누면 나머지

SELECT
    *
FROM
    emp
WHERE
    mod(empno, 2) <> 0;
--사번이 홀수인 사원

SELECT
    length('oracle')
FROM
    dual;
--문자열의 길이

SELECT
    substr('Welcome to Oracle', 4, 3)
FROM
    dual;
--4 시작위치(1부터 시작함) 3 3개를 가져온다.


SELECT
    substr('Welcome to Oracle', -4, 3)
FROM
    dual;

select substr(hiredate,1,2) 년도, substr(hiredate,4,2) 월, substr(hiredate,7,2) 일
from emp;

select *
from emp
where substr(hiredate,4,2) = 09;

--where hiredate between '1987/01/01' and '1987/12/31'
select *
from emp
where substr(hiredate,1,2) = 87;

select instr('welcome to oracle','o',6,2)
from dual;
--js의indexOf 와 instr는 같은 역활을 한다. 6번째 위치부터 시작해서 2번째걸 선택해서 글자순서를 알려준다.

select *
from emp
where ename LIKE '__R%';

select *
from emp
where instr(ename,'R',3,1) = 3;

select *
from emp
where substr(ename,3,1) = 'R';

select sysdate
from dual;

select sysdate -1 어제, sysdate + 1 내일
from dual;

select round(sysdate - hiredate) 
from emp;
--일수가 나온다.

select round((sysdate - hiredate) /365) 
from emp;

select ename,hiredate,trunc(MONTHS_BETWEEN(SYSDATE,hiredate))
from emp;
--MONTHS_BETWEEN(SYSDATE,hiredate) 두 날짜간에 달이 몇달 차이인지 알려준다.

--그룹함수(반대 단일함수) - sum,avg,nax,min
select sum(sal)
from emp;

select avg(sal)
from emp;

select max(sal),min(sal)
from emp;

select ename,max(sal)
from emp;
--그룹함수는 일반컬럼과 함께 쓸수 없다. 컬럼에 있는 것의 조회되는 수가 같아야한다.

select count(empno)
from emp;

select count(comm)
from emp;
--그룹함수는 null데이터는 빼고 계산한다.

select count(comm),count(*)
from emp;

select count(distinct job)
from emp;
--distinct중복 제거

--select
--from
--where
--group by
--order by

select deptno,avg(sal),sum(sal)
from emp
group by deptno;

select deptno,avg(sal)
from emp
group by deptno
having avg(sal) >= 2000;
--부서별 그룹의 평균이 2000이상인 그룹

select deptno,max(sal),min(sal)
from emp
group by deptno
having max(sal) >= 2900;

--조인(두개 이상의 테이블을 사용해서 데이터를 조회하는 것)

select ename, e.deptno, dname
from emp e, dept d
where e.deptno = d.deptno
and ename = 'ALLEN';
--deptno둘다에 값이 있으면 어디서 가져오는지 꼭 적어줘야한다.
--프롬절에 별칭 붙여서 사용

select ename, hiredate
from emp e, dept d
where e.deptno = d.deptno
and dname = 'ACCOUNTING';

select *
from emp;

select *
from dept;

select *
from salgrade;

--non equi join
select ename,dname,grade
from emp e,dept d,salgrade s
where e.deptno = d.deptno
and e.sal BETWEEN s.losal and s.hisal;

-- 조인의 종류
-- cross join, equi join, non equi join, v, self join

--self join 한테이블안에 정보가 있는데 한쿼리문으로 쓸수없을 때
select e.ename || '의 매니져는 ' || m.ename || '입니다.'
from emp e, emp m
where e.mgr = m.empno;

select f.ename
from emp w, emp f
where w.deptno = f.deptno
and w.ename = 'FORD' 
and f.ename <> 'FORD';

--SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;
-- 조건절 where <,>,<=,>=,=,!=,<>

SELECT
    *
FROM
    emp
WHERE
    deptno = 10;
--숫자 문자 날짜를 값으로 많이 쓴다.

SELECT
    *
FROM
    emp
WHERE
    ename = 'FORD';
--문자를 사용할땐 ''로 묶어줘야 한다. 비교식에 들어가는 문자는 대소문자를 가린다.

SELECT
    empno,
    ename,
    sal
FROM
    emp
WHERE
    ename = 'SMITH';

--날짜정보에는 눈에 보이지 않아도 연월일 시분초가 다들어가있다.
SELECT
    *
FROM
    emp
WHERE
    hiredate <= '1981/11/17';
--문자와 날짜정보는 반드시 ''를 찍어줘야 한다.

--논리연산자 and,or,not
SELECT
    *
FROM
    emp
WHERE
    deptno = 10
    OR job = 'MANAGER';

SELECT
    *
FROM
    emp
WHERE
    NOT deptno = 10;

SELECT
    *
FROM
    emp
WHERE
    deptno <> 10;

SELECT
    *
FROM
    emp
WHERE
        sal <= 3000
    AND sal >= 2000;

SELECT
    *
FROM
    emp
WHERE
    sal > 3000
    OR sal < 2000;

SELECT
    *
FROM
    emp
WHERE
    empno = 7499
    OR empno = 7566
    OR empno = 7844;

--where sal <= 3000 and sal >= 2000;
SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;
--자신을 포함한다.

SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;

SELECT
    *
FROM
    emp
WHERE
    hiredate BETWEEN '81/02/01' AND '81/06/30';

--where empno = 7499 or empno = 7566 or empno = 7844;
SELECT
    *
FROM
    emp
WHERE
    empno IN ( 7499, 7566, 7844 );

SELECT
    *
FROM
    emp
WHERE
    empno NOT IN ( 7499, 7566, 7844 );

--와일드카드(LIKE % , _)
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'M%';

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%A%';

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_A_';
--_굴자 하나를 의미한다. 글자가 3글자 여야한다. &있기만 하면 된다.

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_A%';
--2번째 글자가 무조건 a인 사람.

SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '_A%';


--where comm = 'null';
--null는 연산할 수 없다.
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;

SELECT
    *
FROM
    emp
WHERE
    comm IS NOT NULL;

SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;

--오른차순정렬asc(생략가능) 내림차순정렬desc
SELECT
    *
FROM
    emp
ORDER BY
    sal ASC;

SELECT
    *
FROM
    emp
ORDER BY
    sal DESC;

SELECT
    *
FROM
    emp
ORDER BY
    ename DESC;

SELECT
    *
FROM
    emp
WHERE
    deptno = 30
ORDER BY
    sal DESC,
    ename DESC;
--order절은 무조건 마지막에 와야한다.

SELECT
    - 10,
    abs(- 10)
FROM
    dual;
--abs절대값을 만들어 내는 함수

SELECT
    round(34.5678)
FROM
    dual;

SELECT
    round(34.5678, 2)
FROM
    dual;
--소수점 이하 2번째자리까지 보이게 반올림(3번째자리에서 반올림)

SELECT
    trunc(34.5678)
FROM
    dual;
--소수점을 버리는 함수

SELECT
    trunc(34.5678, 2)
FROM
    dual;

SELECT
    mod(27, 2)
FROM
    dual;
--앞에 주어진 숫자를 뒤에 주어진 숫자로 나누면 나머지

SELECT
    *
FROM
    emp
WHERE
    mod(empno, 2) <> 0;
--사번이 홀수인 사원

SELECT
    length('oracle')
FROM
    dual;
--문자열의 길이

SELECT
    substr('Welcome to Oracle', 4, 3)
FROM
    dual;
--4 시작위치(1부터 시작함) 3 3개를 가져온다.


SELECT
    substr('Welcome to Oracle', -4, 3)
FROM
    dual;

select substr(hiredate,1,2) 년도, substr(hiredate,4,2) 월, substr(hiredate,7,2) 일
from emp;

select *
from emp
where substr(hiredate,4,2) = 09;

--where hiredate between '1987/01/01' and '1987/12/31'
select *
from emp
where substr(hiredate,1,2) = 87;

select instr('welcome to oracle','o',6,2)
from dual;
--js의indexOf 와 instr는 같은 역활을 한다. 6번째 위치부터 시작해서 2번째걸 선택해서 글자순서를 알려준다.

select *
from emp
where ename LIKE '__R%';

select *
from emp
where instr(ename,'R',3,1) = 3;

select *
from emp
where substr(ename,3,1) = 'R';

select sysdate
from dual;

select sysdate -1 어제, sysdate + 1 내일
from dual;

select round(sysdate - hiredate) 
from emp;
--일수가 나온다.

select round((sysdate - hiredate) /365) 
from emp;

select ename,hiredate,trunc(MONTHS_BETWEEN(SYSDATE,hiredate))
from emp;
--MONTHS_BETWEEN(SYSDATE,hiredate) 두 날짜간에 달이 몇달 차이인지 알려준다.

--그룹함수(반대 단일함수) - sum,avg,nax,min
select sum(sal)
from emp;

select avg(sal)
from emp;

select max(sal),min(sal)
from emp;

select ename,max(sal)
from emp;
--그룹함수는 일반컬럼과 함께 쓸수 없다. 컬럼에 있는 것의 조회되는 수가 같아야한다.

select count(empno)
from emp;

select count(comm)
from emp;
--그룹함수는 null데이터는 빼고 계산한다.

select count(comm),count(*)
from emp;

select count(distinct job)
from emp;
--distinct중복 제거

--select
--from
--where
--group by
--order by

select deptno,avg(sal),sum(sal)
from emp
group by deptno;

select deptno,avg(sal)
from emp
group by deptno
having avg(sal) >= 2000;
--부서별 그룹의 평균이 2000이상인 그룹

select deptno,max(sal),min(sal)
from emp
group by deptno
having max(sal) >= 2900;

--조인(두개 이상의 테이블을 사용해서 데이터를 조회하는 것)

select ename, e.deptno, dname
from emp e, dept d
where e.deptno = d.deptno
and ename = 'ALLEN';
--deptno둘다에 값이 있으면 어디서 가져오는지 꼭 적어줘야한다.
--프롬절에 별칭 붙여서 사용

select ename, hiredate
from emp e, dept d
where e.deptno = d.deptno
and dname = 'ACCOUNTING';

select *
from emp;

select *
from dept;

select *
from salgrade;

--non equi join
select ename,dname,grade
from emp e,dept d,salgrade s
where e.deptno = d.deptno
and e.sal BETWEEN s.losal and s.hisal;

-- 조인의 종류
-- cross join, equi join, non equi join, out join, self join

--self join 한테이블안에 정보가 있는데 한쿼리문으로 쓸수없을 때
select e.ename || '의 매니져는 ' || m.ename || '입니다.'
from emp e, emp m
where e.mgr = m.empno;

select f.ename
from emp w, emp f
where w.deptno = f.deptno
and w.ename = 'FORD' 
and f.ename <> 'FORD';

--out join
select e.ename || '의 매니져는 ' || m.ename || '입니다.'
from emp e, emp m
where e.mgr = m.empno(+);
--mgr에 null정보가 있고 empno는 다 정보가 있다.
