SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;
-- ������ where <,>,<=,>=,=,!=,<>

SELECT
    *
FROM
    emp
WHERE
    deptno = 10;
--���� ���� ��¥�� ������ ���� ����.

SELECT
    *
FROM
    emp
WHERE
    ename = 'FORD';
--���ڸ� ����Ҷ� ''�� ������� �Ѵ�. �񱳽Ŀ� ���� ���ڴ� ��ҹ��ڸ� ������.

SELECT
    empno,
    ename,
    sal
FROM
    emp
WHERE
    ename = 'SMITH';

--��¥�������� ���� ������ �ʾƵ� ������ �ú��ʰ� �ٵ��ִ�.
SELECT
    *
FROM
    emp
WHERE
    hiredate <= '1981/11/17';
--���ڿ� ��¥������ �ݵ�� ''�� ������ �Ѵ�.

--�������� and,or,not
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
--�ڽ��� �����Ѵ�.

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

--���ϵ�ī��(LIKE % , _)
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
--_���� �ϳ��� �ǹ��Ѵ�. ���ڰ� 3���� �����Ѵ�. &�ֱ⸸ �ϸ� �ȴ�.

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_A%';
--2��° ���ڰ� ������ a�� ���.

SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '_A%';


--where comm = 'null';
--null�� ������ �� ����.
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

--������������asc(��������) ������������desc
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
--order���� ������ �������� �;��Ѵ�.

SELECT
    - 10,
    abs(- 10)
FROM
    dual;
--abs���밪�� ����� ���� �Լ�

SELECT
    round(34.5678)
FROM
    dual;

SELECT
    round(34.5678, 2)
FROM
    dual;
--�Ҽ��� ���� 2��°�ڸ����� ���̰� �ݿø�(3��°�ڸ����� �ݿø�)

SELECT
    trunc(34.5678)
FROM
    dual;
--�Ҽ����� ������ �Լ�

SELECT
    trunc(34.5678, 2)
FROM
    dual;

SELECT
    mod(27, 2)
FROM
    dual;
--�տ� �־��� ���ڸ� �ڿ� �־��� ���ڷ� ������ ������

SELECT
    *
FROM
    emp
WHERE
    mod(empno, 2) <> 0;
--����� Ȧ���� ���

SELECT
    length('oracle')
FROM
    dual;
--���ڿ��� ����

SELECT
    substr('Welcome to Oracle', 4, 3)
FROM
    dual;
--4 ������ġ(1���� ������) 3 3���� �����´�.


SELECT
    substr('Welcome to Oracle', -4, 3)
FROM
    dual;

select substr(hiredate,1,2) �⵵, substr(hiredate,4,2) ��, substr(hiredate,7,2) ��
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
--js��indexOf �� instr�� ���� ��Ȱ�� �Ѵ�. 6��° ��ġ���� �����ؼ� 2��°�� �����ؼ� ���ڼ����� �˷��ش�.

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

select sysdate -1 ����, sysdate + 1 ����
from dual;

select round(sysdate - hiredate) 
from emp;
--�ϼ��� ���´�.

select round((sysdate - hiredate) /365) 
from emp;

select ename,hiredate,trunc(MONTHS_BETWEEN(SYSDATE,hiredate))
from emp;
--MONTHS_BETWEEN(SYSDATE,hiredate) �� ��¥���� ���� ��� �������� �˷��ش�.

--�׷��Լ�(�ݴ� �����Լ�) - sum,avg,nax,min
select sum(sal)
from emp;

select avg(sal)
from emp;

select max(sal),min(sal)
from emp;

select ename,max(sal)
from emp;
--�׷��Լ��� �Ϲ��÷��� �Բ� ���� ����. �÷��� �ִ� ���� ��ȸ�Ǵ� ���� ���ƾ��Ѵ�.

select count(empno)
from emp;

select count(comm)
from emp;
--�׷��Լ��� null�����ʹ� ���� ����Ѵ�.

select count(comm),count(*)
from emp;

select count(distinct job)
from emp;
--distinct�ߺ� ����

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
--�μ��� �׷��� ����� 2000�̻��� �׷�

select deptno,max(sal),min(sal)
from emp
group by deptno
having max(sal) >= 2900;

--����(�ΰ� �̻��� ���̺��� ����ؼ� �����͸� ��ȸ�ϴ� ��)

select ename, e.deptno, dname
from emp e, dept d
where e.deptno = d.deptno
and ename = 'ALLEN';
--deptno�Ѵٿ� ���� ������ ��� ���������� �� ��������Ѵ�.
--�������� ��Ī �ٿ��� ���

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

-- ������ ����
-- cross join, equi join, non equi join, v, self join

--self join �����̺�ȿ� ������ �ִµ� ������������ �������� ��
select e.ename || '�� �Ŵ����� ' || m.ename || '�Դϴ�.'
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
-- ������ where <,>,<=,>=,=,!=,<>

SELECT
    *
FROM
    emp
WHERE
    deptno = 10;
--���� ���� ��¥�� ������ ���� ����.

SELECT
    *
FROM
    emp
WHERE
    ename = 'FORD';
--���ڸ� ����Ҷ� ''�� ������� �Ѵ�. �񱳽Ŀ� ���� ���ڴ� ��ҹ��ڸ� ������.

SELECT
    empno,
    ename,
    sal
FROM
    emp
WHERE
    ename = 'SMITH';

--��¥�������� ���� ������ �ʾƵ� ������ �ú��ʰ� �ٵ��ִ�.
SELECT
    *
FROM
    emp
WHERE
    hiredate <= '1981/11/17';
--���ڿ� ��¥������ �ݵ�� ''�� ������ �Ѵ�.

--�������� and,or,not
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
--�ڽ��� �����Ѵ�.

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

--���ϵ�ī��(LIKE % , _)
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
--_���� �ϳ��� �ǹ��Ѵ�. ���ڰ� 3���� �����Ѵ�. &�ֱ⸸ �ϸ� �ȴ�.

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_A%';
--2��° ���ڰ� ������ a�� ���.

SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '_A%';


--where comm = 'null';
--null�� ������ �� ����.
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

--������������asc(��������) ������������desc
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
--order���� ������ �������� �;��Ѵ�.

SELECT
    - 10,
    abs(- 10)
FROM
    dual;
--abs���밪�� ����� ���� �Լ�

SELECT
    round(34.5678)
FROM
    dual;

SELECT
    round(34.5678, 2)
FROM
    dual;
--�Ҽ��� ���� 2��°�ڸ����� ���̰� �ݿø�(3��°�ڸ����� �ݿø�)

SELECT
    trunc(34.5678)
FROM
    dual;
--�Ҽ����� ������ �Լ�

SELECT
    trunc(34.5678, 2)
FROM
    dual;

SELECT
    mod(27, 2)
FROM
    dual;
--�տ� �־��� ���ڸ� �ڿ� �־��� ���ڷ� ������ ������

SELECT
    *
FROM
    emp
WHERE
    mod(empno, 2) <> 0;
--����� Ȧ���� ���

SELECT
    length('oracle')
FROM
    dual;
--���ڿ��� ����

SELECT
    substr('Welcome to Oracle', 4, 3)
FROM
    dual;
--4 ������ġ(1���� ������) 3 3���� �����´�.


SELECT
    substr('Welcome to Oracle', -4, 3)
FROM
    dual;

select substr(hiredate,1,2) �⵵, substr(hiredate,4,2) ��, substr(hiredate,7,2) ��
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
--js��indexOf �� instr�� ���� ��Ȱ�� �Ѵ�. 6��° ��ġ���� �����ؼ� 2��°�� �����ؼ� ���ڼ����� �˷��ش�.

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

select sysdate -1 ����, sysdate + 1 ����
from dual;

select round(sysdate - hiredate) 
from emp;
--�ϼ��� ���´�.

select round((sysdate - hiredate) /365) 
from emp;

select ename,hiredate,trunc(MONTHS_BETWEEN(SYSDATE,hiredate))
from emp;
--MONTHS_BETWEEN(SYSDATE,hiredate) �� ��¥���� ���� ��� �������� �˷��ش�.

--�׷��Լ�(�ݴ� �����Լ�) - sum,avg,nax,min
select sum(sal)
from emp;

select avg(sal)
from emp;

select max(sal),min(sal)
from emp;

select ename,max(sal)
from emp;
--�׷��Լ��� �Ϲ��÷��� �Բ� ���� ����. �÷��� �ִ� ���� ��ȸ�Ǵ� ���� ���ƾ��Ѵ�.

select count(empno)
from emp;

select count(comm)
from emp;
--�׷��Լ��� null�����ʹ� ���� ����Ѵ�.

select count(comm),count(*)
from emp;

select count(distinct job)
from emp;
--distinct�ߺ� ����

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
--�μ��� �׷��� ����� 2000�̻��� �׷�

select deptno,max(sal),min(sal)
from emp
group by deptno
having max(sal) >= 2900;

--����(�ΰ� �̻��� ���̺��� ����ؼ� �����͸� ��ȸ�ϴ� ��)

select ename, e.deptno, dname
from emp e, dept d
where e.deptno = d.deptno
and ename = 'ALLEN';
--deptno�Ѵٿ� ���� ������ ��� ���������� �� ��������Ѵ�.
--�������� ��Ī �ٿ��� ���

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

-- ������ ����
-- cross join, equi join, non equi join, out join, self join

--self join �����̺�ȿ� ������ �ִµ� ������������ �������� ��
select e.ename || '�� �Ŵ����� ' || m.ename || '�Դϴ�.'
from emp e, emp m
where e.mgr = m.empno;

select f.ename
from emp w, emp f
where w.deptno = f.deptno
and w.ename = 'FORD' 
and f.ename <> 'FORD';

--out join
select e.ename || '�� �Ŵ����� ' || m.ename || '�Դϴ�.'
from emp e, emp m
where e.mgr = m.empno(+);
--mgr�� null������ �ְ� empno�� �� ������ �ִ�.
