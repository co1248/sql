desc dba_tables;

select table_name, owner
from dba_tables;

--��������� �丸��� ������ ��
grant create view
to scott;

--�ý��۰��������� ���� ���������
create user human
identified by human;

--������ �ش�.(�� 20~30�� ������ ��)
grant connect, resource
to human;