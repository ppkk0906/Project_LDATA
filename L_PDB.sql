-- purprd2 ���̺� -> �� ����, �б⺰�� �׷�ȭ
-- create table purprd2 as
select a.����ȣ ID, ���� category, sum(���űݾ�) sum, count(distinct ��������) count, to_char(��������, 'yyyy') Y, to_char(��������, 'q') Q
from purprd A, product_class2 b
where a.�Һз��ڵ� = b."�Һз��ڵ�"
group by a.����ȣ, ����, to_char(��������, 'yyyy'), to_char(��������, 'q')
order by a."����ȣ";
-- purprd_3539m ���̺� -> 35~39 ������ ���ų�����
-- create table purprd_3539m as
select a.���޻�, ��������ȣ, a."����ȣ", ��������, ���űݾ�, ��������, b.����, b.�ߺз���, b.�Һз���
from purprd a, product_class2 b, customer c
where c."����ȣ"=a."����ȣ" and b."�Һз��ڵ�" = a."�Һз��ڵ�" and c."����"='M' and c."���ɴ�"='35��~39��'
order by a.����ȣ;

select ����ȣ, "���޻�", sum(���űݾ�), count(distinct ��������), ��������
from purprd_3539m
group by ����ȣ, ���޻�, ��������
order by ����ȣ, ���޻�;

--��� Ȯ��
select a."����ȣ", c.��������, c."���ɴ�",c."����", b.����, TO_CHAR(a."��������", 'YYYY'),ROUND(TO_CHAR(a."��������", 'Q')/2), sum(a."���űݾ�"), count(a."���űݾ�")
from purprd a, product_class2 b, customer c
where a.����ȣ(+) = c.����ȣ and a."�Һз��ڵ�" = b.�Һз��ڵ� and a.���޻� <> 'D' and c.���ɴ� in ('40��~44��', '45��~49��', '50��~54��') and c.���� = 'F'
group by  a."����ȣ", c.��������, c."���ɴ�",c."����", b.����, TO_CHAR(a."��������", 'YYYY'),ROUND(TO_CHAR(a."��������", 'Q')/2)
order by a."����ȣ", b.����, TO_CHAR(a."��������", 'YYYY'),ROUND(TO_CHAR(a."��������", 'Q')/2);
--ä�ο��� ���̺� �����
--drop table channel2;
create table channel2 as
select ����ȣ, sum(�̿�Ƚ��) �̿�Ƚ������
from channel
group by ����ȣ
order by ����ȣ;
--����ʿ��� ���̺� �����
--drop table membership2;
create table membership2 as
SELECT distinct ����ȣ, ���Գ��
from membership
order by ����ȣ;
--����� �̿����� ���̺� �����
create table competitor2 as
select ����ȣ, ���޻�, count(���޻�) ������̿�Ƚ��, to_date('2015/12/31', 'yyyy/mm/dd') - max(�̿���) �ֽż�
from competitor
group by ����ȣ, ���޻�
order by ����ȣ, ���޻�;
commit;

select ����ȣ
from customer
where ����='F' and ���ɴ� in ('40��~44��', '45��~49��', '50��~54��')
order by ����ȣ;

select
from competitor2 a, customer b
where a.����ȣ = b.����ȣ and ����='F' and ���ɴ� in ('40��~44��', '45��~49��', '50��~54��)
