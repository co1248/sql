desc dba_tables;

select table_name, owner
from dba_tables;

--스콧계정에 뷰만드는 권한을 줌
grant create view
to scott;

--시스템계정에서만 가능 계정만들기
create user human
identified by human;

--권한을 준다.(약 20~30개 권한을 줌)
grant connect, resource
to human;