-- purprd2 테이블 -> 새 기준, 분기별로 그룹화
-- create table purprd2 as
select a.고객번호 ID, 구분 category, sum(구매금액) sum, count(distinct 구매일자) count, to_char(구매일자, 'yyyy') Y, to_char(구매일자, 'q') Q
from purprd A, product_class2 b
where a.소분류코드 = b."소분류코드"
group by a.고객번호, 구분, to_char(구매일자, 'yyyy'), to_char(구매일자, 'q')
order by a."고객번호";
-- purprd_3539m 테이블 -> 35~39 남성의 구매내역만
-- create table purprd_3539m as
select a.제휴사, 영수증번호, a."고객번호", 구매일자, 구매금액, 거주지역, b.구분, b.중분류명, b.소분류명
from purprd a, product_class2 b, customer c
where c."고객번호"=a."고객번호" and b."소분류코드" = a."소분류코드" and c."성별"='M' and c."연령대"='35세~39세'
order by a.고객번호;

select 고객번호, "제휴사", sum(구매금액), count(distinct 구매일자), 거주지역
from purprd_3539m
group by 고객번호, 제휴사, 거주지역
order by 고객번호, 제휴사;

--대상 확대
select a."고객번호", c.거주지역, c."연령대",c."성별", b.구분, TO_CHAR(a."구매일자", 'YYYY'),ROUND(TO_CHAR(a."구매일자", 'Q')/2), sum(a."구매금액"), count(a."구매금액")
from purprd a, product_class2 b, customer c
where a.고객번호(+) = c.고객번호 and a."소분류코드" = b.소분류코드 and a.제휴사 <> 'D' and c.연령대 in ('40세~44세', '45세~49세', '50세~54세') and c.성별 = 'F'
group by  a."고객번호", c.거주지역, c."연령대",c."성별", b.구분, TO_CHAR(a."구매일자", 'YYYY'),ROUND(TO_CHAR(a."구매일자", 'Q')/2)
order by a."고객번호", b.구분, TO_CHAR(a."구매일자", 'YYYY'),ROUND(TO_CHAR(a."구매일자", 'Q')/2);
--채널여부 테이블 만들기
--drop table channel2;
create table channel2 as
select 고객번호, sum(이용횟수) 이용횟수총합
from channel
group by 고객번호
order by 고객번호;
--멤버십여부 테이블 만들기
--drop table membership2;
create table membership2 as
SELECT distinct 고객번호, 가입년월
from membership
order by 고객번호;
--경쟁사 이용정보 테이블 만들기
create table competitor2 as
select 고객번호, 제휴사, count(제휴사) 경쟁사이용횟수, to_date('2015/12/31', 'yyyy/mm/dd') - max(이용년월) 최신성
from competitor
group by 고객번호, 제휴사
order by 고객번호, 제휴사;
commit;

select 고객번호
from customer
where 성별='F' and 연령대 in ('40세~44세', '45세~49세', '50세~54세')
order by 고객번호;

select
from competitor2 a, customer b
where a.고객번호 = b.고객번호 and 성별='F' and 연령대 in ('40세~44세', '45세~49세', '50세~54세)
