# 매출감소 여성소객 예측모델 개발 및 솔루션
## 기획동기 및 주제선정
1. 이 회사의 매출의 80%는 여성 고객으로부터 나옴
2. 14년 대비 15년 구매가 감소한 여성고객은 7041명으로, 이는 전체 고객의 36%이며 여성고객의 44%이다 
### 주어진 데이터
1. 경쟁사 이용정보 (곡개번호, 제휴사, 제휴사의 경쟁사, 이용년월)
2. 고객 정보 (성별, 연령대, 거주지역)
3. 구매내역 정보
4. 고객의 멤버십 여부와 가입년월
5. 상품분류
6. 채널 이용정보
---
## 데이터 분석 및 모델링
### 종속변수
여성고객 15,898명 (이 중 매출감소 고객은 44.28%)
### 독립변수
1. 주요 구매회사/상품의 매출변화
    - '구매회사'는 구매내역의 제휴사 정보를 활용함
    - '구매품목'은 제휴사마다 다른 기준을 가지고 품목이 분류되어 있어서 네이버 쇼핑의 분류를 활용하여 10개 품목으로 재범주화함
2. 최근구매일/구매빈도/금액
    - '최근 구매일'은 구매내역의 최종 구매일자를 뜻함
    - '구매빈도'는 구매내역의 마트 방문횟수를 뜻함
    - '구매금액'은 2년동안 누적된 총 구매금액을 뜻함
3. 멤버십/온라인/경쟁사이용
    - '멤버십'은 고객의 멤버십 정보를 활용함
    - '온라인'은 고객의 온라인 이룔정보를 활용함
    - '경쟁사'는 고객의 경쟁사 이용정보를 활용함
---
## 타겟 고객 INSIGHT
1. 회사, 시기 및 품목별 구매 감소 vs 미감소 고객 (ppt참조)
    - 1위가 A사의 하반기 디지털/가전
    - 2위가 A사의 상반기 패션잡화

2. 패션의류/잡화의 경우 경쟁사 이용횟수 20회부터 매출액 변화가 음수로 변화

3. 매출 감소 고객은 멤버십 가입 1년초과 고객이 1년 이하인 고객에 비해 훨씬 많았음 (1년초과 68.6% vs 1년이하 31.4%)
---
## 제안 및 정리
pdf파일을 참조해주세요