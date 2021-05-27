--DDL data definition language
--create, drop, alter --생성 삭제 변경
--DML data manipulation language
--select, insert, update, delete
--DCL data manipulation language
--grant, revoke
--TCL tool command language
--commit, rollback

--문자 - char,varchar2
--숫자 - number
--날짜 - date
--이미지 동영상 binary

create table emp01
(
    empno number(4),
    ename varchar2(20),
    sal number(7,2)
);
--테이블을 만들겠다는 선언, 컬럼의 타입(값의 유형)을 정해준다.
--empno number의 숫자를 안붙이면 7바이트 사용
--ename varchar() 알파벳은 1바이트 한글은 2바이트이다.
--number(7,2) 총 7자리의 숫자를 표현하되 2자리는 실수로 표기하겠다.

select *
from emp01;

desc emp01;
--테이블의 유형조회

--기존테이블을 이용해서 테이블 만들기 (복제도 가능) 서브쿼리로 만든다.(복사할때 많이 사용)
create table emp02
as
select * from emp; --여기서 나오는 것과 똑같은 내용의 테이블을 만들겠다.

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
--이런데이터 없으니 갖고오지마라. 빈데이터 만들어라.

desc emp06;

select *
from emp06;

desc emp01;

--컬럼요소를 변경가능 추가 삭제 수정
alter table emp01
add(job varchar2(9));

--컬럼타입변경(이미 데이터를 가지고 있는 경우엔 안된다.)
alter table emp01
modify(job VARCHAR2(30));

--컬럽 삭제 (컬럼을 꼭 적어줘야 한다)
alter table emp01
drop column job;

--테이블 삭제
drop table emp01;

select *
from emp01;

select *
from emp02;

--컬럼은 놔두고 값(데이터)만 삭제
truncate table emp02;

--딕셔너리 뷰 - 내가한일에대한 내역을 볼 수 있다.
--USEL_xxxx (나의 계정만)
--ALL_xxxx (권한 위임 받은거)
--DBA_xxxx (관리자 권한을 가진 계정만)
--xxxx 대상설정

desc user_tables;

select TABLE_NAME
from user_tables
order by table_name desc;
--현재 스콧계정이 생성해놓은 테이블 이름을 조회할 수 있다.

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

--insert 신규로 데이터 추가

desc emp01;

insert into emp01 (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values(1111, '홍길동', '학생', 9999, '21/05/27', 100, 30, 10);

select *
from emp01;

--해당테이블에 있는 모든 컬럼을 다 사용하고 다 값을 넣을때 생략할 수 있다.
insert into emp01
values(2222, '박길동', '학생', 8888, '21/05/27', 200, 10, 20);

insert into emp01 (EMPNO, ENAME, SAL)
values(3333, '고길동', 300);

desc dept;
--DEPTNO는 반드시 값이 들어가야한다. NOT NULL

insert into dept (DNAME, LOC)
values ('인사부', '서울');
--제약조건

--update 데이터 수정

update emp01
set deptno = 40; --바뀔값을 세팅, 수정 바꾸는 단위는 컬럼
--insert update delete 쓰면 컬럼의 값이 다 바뀐다.

select *
from emp01;

commit;
--트렌젝션(transaction) 변경된 정보를 확정(저장)
--트렌젝션(transaction,tx)을 해줘야 외부에서도 볼수 있다.

update emp01
set deptno = 20;

rollback;
--원래상태로 돌려주는 기능 커밋직후로 돌아간다

drop table emp01;

create table emp01
as
select * from emp;

select *
from emp01;

--특정 조건을 만족하는 데이터를 업데이트 (수정)
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
--where substr(hiredate,1,2) = 82; 날짜는 유연해서 ''빼도 적용된다.

--데이터 삭제 truncate table emp01;는 데이터 전부 삭제. truncate복구불가 롤백안됨
--Oracle Database와 MySQL의 일부 스토리지 엔진은 TRUNCATE 후 자동으로 커밋을 한다. TRUNCATE의 삭제는 롤백할 수 없다.
delete from emp01;

select * from emp01;

rollback;

delete from emp01
where deptno = 30;

commit;

--create문 자동커밋됨
create table dept01
as
select * from dept;

delete from dept01;

select * from dept01;

rollback;

select * from dept01;

--제약조건은 컬럼에 적용
--5대제약조건
--not null -> c 데이터입력 필수
--unique -> u 중복불가, null중복허용
--primary key -> p not null,unique 유일키
--foreign key -> r 테이블간 제약조건
--check -> c 범위설정 제약조건 ex성별 1~14의값
--2개이상에 제약조건을 적용할 수 있다. 딕셔너리에서 낫널이외의 것 조회가능.딕서너리에선 약식으로 보여준다.


desc dept;

--제약조건을 확인하는 테이블
--user_constraints

desc user_constraints;

select constraint_name, constraint_type, table_name
from user_constraints;
--어떤테이블에 어떤제약조건이 있는지만 보여준다.

--컬럼정보를 확인하는 딕셔너리, 타입을 알 수 없다.
select *
from user_cons_columns;
--constraint_name으로 비교한다.

select u.table_name, constraint_type, column_name
from user_constraints u, user_cons_columns c
where u.constraint_name = c.constraint_name;
--조인으로 조회가능

drop table emp01;

create table emp01 (
    empno number(4) not null,
    ename varchar2(20) not null,
    job varchar2(30),
    deptno number(2)
);

desc emp01;

--컬럼을 생략하면 값을 다 넣어줘야한다. 명시적널사용 '' or NULL
insert into emp01
values (111,'홍길동','',NULL);

select * from emp01;

--묵시적
insert into emp01(empno, ename)
values(2222,'박길동');

drop table emp03;

create table emp03 (
    empno number(4) unique not null,
    ename varchar2(20) not null,
    job varchar2(30),
    deptno number(2)
);

insert into emp03
values (111,'홍길동','sales',10);

select * from emp03;

insert into emp03
values (111,'박길동','doctor',20);

insert into emp03
values (null,'박길동','doctor',30);

--오라클시스템에서 제약조건에 이름을 붙여준다.

create table emp04
(
    empno number(4) constraint emp04_empno_uk unique,
    ename varchar2(20) constraint emp04_empno_nn not null,
    job varchar2(30),
    deptno number(2)
);
--constraint 제약조건 테이블이름_컬럼명_마음대로 제약조건이름을 준다.

insert into emp04
values (111,'홍길동','sales',10);

insert into emp04
values (111,'박길동','doctor',20);

select * from emp04;

--제약조건의 이름은 한 계정에서 같은 이름을 쓸 수 없다.

select constraint_name, constraint_type, table_name
from user_constraints;

select *
from user_cons_columns;

select u.table_name, constraint_type, column_name
from user_constraints u, user_cons_columns c
where u.constraint_name = c.constraint_name
order by table_name;

--유일키 프라이머리키 not null + unique

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
values (111,'홍길동','sales',10);

insert into emp05
values (111,'박길동','doctor',20);

insert into emp05
values (null,'박길동','doctor',20);

--2개이상의 테이블이 있어야한다. 같은이름의 컬럼이 필요(조인이 섭립되야 한다.) 자식에게만 적용하면 된다.
--부모 컬러은 반드시 프라이머리 키 해야 한다.

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

--외래키 설정 부모의 값이 있는것으로만 값의 범위가 결정됨.
create table emp06
(
    empno number(4) constraint emp06_empno_pk primary key,
    ename varchar2(20) constraint emp06_ename_nn not null,
    job varchar2(30),
    deptno number(2) constraint emp06_deptno_fk references dept(deptno)
);

insert into emp06(empno,ename,deptno)
values(5000,'asb',40);

--범위한정으로 값의 제한을 가한다.
create table emp07
(
    empno number(4) constraint emp07_empno_pk primary key,
    ename varchar2(20) constraint emp07_ename_nn not null,
    sal number(7,2) constraint emp07_sal_ck check(sal between 500 and 5000),
    gender varchar2(1) constraint emp07_gender_ck check(gender in ('M','F'))
);

insert into emp07
values(111,'acb',800,'M');

--뷰 임시로 잠깐 사용, 보안상으로 컬럼열람제한
--실제로 물리적인 테이블이 존재할때 사용
create table dept_copy
as
select * from dept;

create table emp_copy
as
select * from emp;

--서브쿼리문 제약조건이 딸려오지 않는다.
--추후에 제약조건을 추가 할 수 있다.
--or replace 옵션 생략가능

--스콧계정은 뷰만드는 권한을 주지 않았다. 시스템으로 가서 권한을 준다.
--or replace 기존에 만들어져있는 뷰에대한 같은이름으로 새로운 형태의 변경을 가능하게 해준다.
create or replace view emp_view30
as
select empno, ename, sal, deptno, job
from emp_copy
where deptno = 30;

--쿼리문이 아니다. 뷰는 가상테이블이고 원본테이블이 읽고 쓰고 수정이 가능하다.
--대부분의 뷰는 보는 용도로만 사용 가능하게 해놓는다. 
--뷰테이블은 데이터 제어까지만 가능, 구조를 바꾸진 못한다.  
--뷰테이블emp_view30을 delete하면 원본테이블의 정보emp_copy가 지워진다.
--뷰테이블은 이름이 중복될 수 없다. 컬럼을 추가할수있다.
select * from emp_view30;

drop view emp_view30; --원본테이블이 지워지지 않는다.

--user_views / TEXT 실제 쿼리문을 본다. 딕셔너리를 이용해서
desc user_views;

select VIEW_NAME, TEXT
from user_views;

--인덱스는 데이터의 검색의 속도를 높이기위한 객체
--인덱스는 해당테이블의 컬럼에 생성 특정컬럼을 사용했을때 조회속도가 빨라지게함.
--프라이머리키는 자동으로 인덱스가 생성된다.

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
--on 테이블이름(컬럼명);
create index emp01_ename
on emp01(ename);

select * from emp01
where ename = 'aaa';

select index_name, table_name, column_name
from user_ind_columns
where table_name in ('EMP01');
--인덱스는 데이터량이 충분히 들어간 자료일때, 3~5프로 이내의 데이터를 검색할때 사용
--빈번히 변화가 일어나는 테이블은 효과가 적다(검색에 이용되는 테이블 위주로 사용)

