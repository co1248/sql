--��������
select dname --��������
from dept
where deptno = (
                select deptno --��������
                from emp
                where ename = 'SMITH'
                );

select ename,sal
from emp
where sal = max(sal); --�׷��Լ��� where���� ����� �� ����.
--�׷��Լ��� ����Ʈ���� �׷�����Ҷ� �غ������� �� �� �ִ�.

select ename,sal
from emp
where sal = (
             select max(sal)
             from emp
             );
--������� �������� ������ Ȱ���Ѵ�.

--������ �������� (��ȸ����� �ϳ��� ����)
--������ �������� (��ȸ����� �������� ����) in, all, any, some(any�� ����) ...

select deptno
from emp
where sal >= 3000;
--��ȸ����� 2�� 10,20�� ���´�.
--�׷��� �Ʒ��� = ���� ������ ���� in�����ڸ� ����Ѵ�.
select ename,sal,deptno
from emp
where deptno in (
                select deptno
                from emp
                where sal >= 3000
                ); --in or��Ż���� ������

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
--all �� �������� �����ϴ� ���� ��� �����ؼ� 

select ename,sal
from emp
where sal > any (
            select sal
            from emp
            where deptno = 30
            );
--any �ּҰ����� �� ���� �޴�

--������(job) manager�� ����� ���� �μ��� �μ���ȣ�� �μ���� ������ ����ϼ���
select *
from dept
where deptno in (
                select deptno
                from emp
                where lower(job) = 'manager'
);
--lower() �� �ҹ��ڷ� �ٲ��ش�.

--����Ŭ�� �����ϴ� �÷� rownum
--rownum�� �������� �ݵ�� 1�� �����ϴ� ������ ������ �Ѵ�.
--��� ������ 1���� ó���Ѵ�.
--rownum�� �����·� ���� ����Ѵ�.
create or replace view view_hire
as
select empno,ename,hiredate
from emp
order by hiredate asc;

select rownum, v.* --�÷�����Ʈ �Ѳ����� ���� �÷� �� �߰��Ҷ� ��Ī�� �̿��Ѵ�.
from view_hire v --��Ī �ѹ����� ��� ��Ī���� ����Ѵ�.
where rownum <=5;

--select rownum, view_hire.*
--from view_hire
--where rownum <=5;

--select rownum, v.*
--from view_hire v
--where rownum >=2 and rownum <=4;
--rownum ���ǹ����ȿ� �ݵ�� 1�� ���ԵǾ� �־�� �Ѵ�.

--�ζ��κ�
--�並 ������ �ʰ� �ӽ�Ŀ����������.
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