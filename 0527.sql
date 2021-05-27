--DDL data definition language
--create, drop, alter --���� ���� ����
--DML data manipulation language
--select, insert, update, delete
--DCL data manipulation language
--grant, revoke
--TCL tool command language
--commit, rollback

--���� - char,varchar2
--���� - number
--��¥ - date
--�̹��� ������ binary

create table emp01
(
    empno number(4),
    ename varchar2(20),
    sal number(7,2)
);
--���̺��� ����ڴٴ� ����, �÷��� Ÿ��(���� ����)�� �����ش�.
--empno number�� ���ڸ� �Ⱥ��̸� 7����Ʈ ���
--ename varchar() ���ĺ��� 1����Ʈ �ѱ��� 2����Ʈ�̴�.
--number(7,2) �� 7�ڸ��� ���ڸ� ǥ���ϵ� 2�ڸ��� �Ǽ��� ǥ���ϰڴ�.

select *
from emp01;

desc emp01;
--���̺��� ������ȸ

--�������̺��� �̿��ؼ� ���̺� ����� (������ ����) ���������� �����.(�����Ҷ� ���� ���)
create table emp02
as
select * from emp; --���⼭ ������ �Ͱ� �Ȱ��� ������ ���̺��� ����ڴ�.

desc emp02;

select *
from emp02;

create table emp03
as
select empno, ename
from emp;

desc emp03;

select *
from emp03;

create table emp05
as
select *
from emp
where deptno = 10;

desc emp05;

select *
from emp05;

create table emp06
as
select *
from emp
where 1 = 0;
--�̷������� ������ �����������. ������ ������.

desc emp06;

select *
from emp06;

desc emp01;

--�÷���Ҹ� ���氡�� �߰� ���� ����
alter table emp01
add(job varchar2(9));

--�÷�Ÿ�Ժ���(�̹� �����͸� ������ �ִ� ��쿣 �ȵȴ�.)
alter table emp01
modify(job VARCHAR2(30));

--�÷� ���� (�÷��� �� ������� �Ѵ�)
alter table emp01
drop column job;

--���̺� ����
drop table emp01;

select *
from emp01;

select *
from emp02;

--�÷��� ���ΰ� ��(������)�� ����
truncate table emp02;

--��ųʸ� �� - �������Ͽ����� ������ �� �� �ִ�.
--USEL_xxxx (���� ������)
--ALL_xxxx (���� ���� ������)
--DBA_xxxx (������ ������ ���� ������)
--xxxx �����

desc user_tables;

select TABLE_NAME
from user_tables
order by table_name desc;
--���� ��������� �����س��� ���̺� �̸��� ��ȸ�� �� �ִ�.

select TABLE_NAME
from user_views
order by table_name desc;

desc all_tables;

select OWNER, TABLE_NAME
from all_tables
order by table_name desc;

create table emp01
as
select *
from emp
where 1=0;

--insert �űԷ� ������ �߰�

desc emp01;

insert into emp01 (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values(1111, 'ȫ�浿', '�л�', 9999, '21/05/27', 100, 30, 10);

select *
from emp01;

--�ش����̺� �ִ� ��� �÷��� �� ����ϰ� �� ���� ������ ������ �� �ִ�.
insert into emp01
values(2222, '�ڱ浿', '�л�', 8888, '21/05/27', 200, 10, 20);

insert into emp01 (EMPNO, ENAME, SAL)
values(3333, '��浿', 300);

desc dept;
--DEPTNO�� �ݵ�� ���� �����Ѵ�. NOT NULL

insert into dept (DNAME, LOC)
values ('�λ��', '����');
--��������

--update ������ ����

update emp01
set deptno = 40; --�ٲ��� ����, ���� �ٲٴ� ������ �÷�
--insert update delete ���� �÷��� ���� �� �ٲ��.

select *
from emp01;

commit;
--Ʈ������(transaction) ����� ������ Ȯ��(����)
--Ʈ������(transaction,tx)�� ����� �ܺο����� ���� �ִ�.

update emp01
set deptno = 20;

rollback;
--�������·� �����ִ� ��� Ŀ�����ķ� ���ư���

drop table emp01;

create table emp01
as
select * from emp;

select *
from emp01;

--Ư�� ������ �����ϴ� �����͸� ������Ʈ (����)
update emp01
set deptno = 30
where deptno = 10;

commit;

update emp01
set sal = sal*1.1
where sal >= 3000;

update emp01
set sal = sal*1.1, comm = 10000
where sal >= 3000;

update emp01
set hiredate = sysdate
where hiredate like '82%';
--where hiredate between '1982/01/01' and '1982/12/31';
--where substr(hiredate,1,2) = 82; ��¥�� �����ؼ� ''���� ����ȴ�.

--������ ���� truncate table emp01;�� ������ ���� ����. truncate�����Ұ� �ѹ�ȵ�
--Oracle Database�� MySQL�� �Ϻ� ���丮�� ������ TRUNCATE �� �ڵ����� Ŀ���� �Ѵ�. TRUNCATE�� ������ �ѹ��� �� ����.
delete from emp01;

select * from emp01;

rollback;

delete from emp01
where deptno = 30;

commit;

--create�� �ڵ�Ŀ�Ե�
create table dept01
as
select * from dept;

delete from dept01;

select * from dept01;

rollback;

select * from dept01;

--���������� �÷��� ����
--5����������
--not null -> c �������Է� �ʼ�
--unique -> u �ߺ��Ұ�, null�ߺ����
--primary key -> p not null,unique ����Ű
--foreign key -> r ���̺� ��������
--check -> c �������� �������� ex���� 1~14�ǰ�
--2���̻� ���������� ������ �� �ִ�. ��ųʸ����� �����̿��� �� ��ȸ����.�񼭳ʸ����� ������� �����ش�.


desc dept;

--���������� Ȯ���ϴ� ���̺�
--user_constraints

desc user_constraints;

select constraint_name, constraint_type, table_name
from user_constraints;
--����̺� ����������� �ִ����� �����ش�.

--�÷������� Ȯ���ϴ� ��ųʸ�, Ÿ���� �� �� ����.
select *
from user_cons_columns;
--constraint_name���� ���Ѵ�.

select u.table_name, constraint_type, column_name
from user_constraints u, user_cons_columns c
where u.constraint_name = c.constraint_name;
--�������� ��ȸ����

drop table emp01;

create table emp01 (
    empno number(4) not null,
    ename varchar2(20) not null,
    job varchar2(30),
    deptno number(2)
);

desc emp01;

--�÷��� �����ϸ� ���� �� �־�����Ѵ�. ������λ�� '' or NULL
insert into emp01
values (111,'ȫ�浿','',NULL);

select * from emp01;

--������
insert into emp01(empno, ename)
values(2222,'�ڱ浿');

drop table emp03;

create table emp03 (
    empno number(4) unique not null,
    ename varchar2(20) not null,
    job varchar2(30),
    deptno number(2)
);

insert into emp03
values (111,'ȫ�浿','sales',10);

select * from emp03;

insert into emp03
values (111,'�ڱ浿','doctor',20);

insert into emp03
values (null,'�ڱ浿','doctor',30);

--����Ŭ�ý��ۿ��� �������ǿ� �̸��� �ٿ��ش�.

create table emp04
(
    empno number(4) constraint emp04_empno_uk unique,
    ename varchar2(20) constraint emp04_empno_nn not null,
    job varchar2(30),
    deptno number(2)
);
--constraint �������� ���̺��̸�_�÷���_������� ���������̸��� �ش�.

insert into emp04
values (111,'ȫ�浿','sales',10);

insert into emp04
values (111,'�ڱ浿','doctor',20);

select * from emp04;

--���������� �̸��� �� �������� ���� �̸��� �� �� ����.

select constraint_name, constraint_type, table_name
from user_constraints;

select *
from user_cons_columns;

select u.table_name, constraint_type, column_name
from user_constraints u, user_cons_columns c
where u.constraint_name = c.constraint_name
order by table_name;

--����Ű �����̸Ӹ�Ű not null + unique

drop table emp05;

create table emp05
(
    empno number(4) constraint emp05_empno_pk primary key,
    ename varchar2(20) constraint emp05_ename_nn not null,
    job varchar2(30),
    deptno number(2)
);

desc emp05;

insert into emp05
values (111,'ȫ�浿','sales',10);

insert into emp05
values (111,'�ڱ浿','doctor',20);

insert into emp05
values (null,'�ڱ浿','doctor',20);

--2���̻��� ���̺��� �־���Ѵ�. �����̸��� �÷��� �ʿ�(������ �����Ǿ� �Ѵ�.) �ڽĿ��Ը� �����ϸ� �ȴ�.
--�θ� �÷��� �ݵ�� �����̸Ӹ� Ű �ؾ� �Ѵ�.

insert into emp(empno,ename,deptno)
values(5000,'asb',50);

select constraint_name, constraint_type, table_name, r_constraint_name
from user_constraints
where table_name in ('DEPT','EMP');

select *
from user_cons_columns;

select u.table_name, column_name, constraint_type, r_constraint_name
from user_constraints u, user_cons_columns c
where u.constraint_name = c.constraint_name
--and c.table_name in ('DEPT','EMP')
order by table_name;

drop table emp06;

--�ܷ�Ű ���� �θ��� ���� �ִ°����θ� ���� ������ ������.
create table emp06
(
    empno number(4) constraint emp06_empno_pk primary key,
    ename varchar2(20) constraint emp06_ename_nn not null,
    job varchar2(30),
    deptno number(2) constraint emp06_deptno_fk references dept(deptno)
);

insert into emp06(empno,ename,deptno)
values(5000,'asb',40);

--������������ ���� ������ ���Ѵ�.
create table emp07
(
    empno number(4) constraint emp07_empno_pk primary key,
    ename varchar2(20) constraint emp07_ename_nn not null,
    sal number(7,2) constraint emp07_sal_ck check(sal between 500 and 5000),
    gender varchar2(1) constraint emp07_gender_ck check(gender in ('M','F'))
);

insert into emp07
values(111,'acb',800,'M');

--�� �ӽ÷� ��� ���, ���Ȼ����� �÷���������
--������ �������� ���̺��� �����Ҷ� ���
create table dept_copy
as
select * from dept;

create table emp_copy
as
select * from emp;

--���������� ���������� �������� �ʴ´�.
--���Ŀ� ���������� �߰� �� �� �ִ�.
--or replace �ɼ� ��������

--��������� �丸��� ������ ���� �ʾҴ�. �ý������� ���� ������ �ش�.
--or replace ������ ��������ִ� �信���� �����̸����� ���ο� ������ ������ �����ϰ� ���ش�.
create or replace view emp_view30
as
select empno, ename, sal, deptno, job
from emp_copy
where deptno = 30;

--�������� �ƴϴ�. ��� �������̺��̰� �������̺��� �а� ���� ������ �����ϴ�.
--��κ��� ��� ���� �뵵�θ� ��� �����ϰ� �س��´�. 
--�����̺��� ������ ��������� ����, ������ �ٲ��� ���Ѵ�.  
--�����̺�emp_view30�� delete�ϸ� �������̺��� ����emp_copy�� ��������.
--�����̺��� �̸��� �ߺ��� �� ����. �÷��� �߰��Ҽ��ִ�.
select * from emp_view30;

drop view emp_view30; --�������̺��� �������� �ʴ´�.

--user_views / TEXT ���� �������� ����. ��ųʸ��� �̿��ؼ�
desc user_views;

select VIEW_NAME, TEXT
from user_views;

--�ε����� �������� �˻��� �ӵ��� ���̱����� ��ü
--�ε����� �ش����̺��� �÷��� ���� Ư���÷��� ��������� ��ȸ�ӵ��� ����������.
--�����̸Ӹ�Ű�� �ڵ����� �ε����� �����ȴ�.

select index_name, table_name, column_name
from user_ind_columns
where table_name in ('EMP06','DEPT');

desc user_indexes;

select INDEX_NAME, TABLE_NAME
from user_indexes;

drop table emp01;

create table emp01
as
select * from emp;

select index_name, table_name, column_name
from user_ind_columns
where table_name in ('EMP01');

insert into emp01
select * from emp01;

insert into emp01 (empno , ename)
values(1111,'aaa');

select * from emp01
where ename = 'aaa';


--create index emp01_ename
--on ���̺��̸�(�÷���);
create index emp01_ename
on emp01(ename);

select * from emp01
where ename = 'aaa';

select index_name, table_name, column_name
from user_ind_columns
where table_name in ('EMP01');
--�ε����� �����ͷ��� ����� �� �ڷ��϶�, 3~5���� �̳��� �����͸� �˻��Ҷ� ���
--����� ��ȭ�� �Ͼ�� ���̺��� ȿ���� ����(�˻��� �̿�Ǵ� ���̺� ���ַ� ���)

