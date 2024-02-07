# 패키지 설치
install.packages("dplyr")

# 패키지 로드
library(dplyr)

# 파일의 경로
#   1번 절대경로
#     - 절대적인 주소값
#     - 환경이 변하더라도 같은 위치 지정
#     - ex) c:/users/admin/document/a.txt, https://www.google.com
#   2번 상대경로
#     - 상대적인 주소값
#     - 환경 변화에 따라 위치도 변화
#     - ./ : 현재 작업 중인 디렉토리(=폴더명)
#     - ../ : 현재 디렉토리에서 상위 디렉토리로 이동
#     - 폴더명/ : 하위 디렉토리로 이동

# 외부 데이터 파일 로드
# csv 파일 로드 -> read.csv(파일의 경로)
# 절대경로 사용
df2 <- read.csv("") # 맥은 해당 안 됨

# 상대경로 사용
# 현재 디렉토리에서 상위 디렉토리로 이동 (../)
# csv라는 하위 디렉토리로 이동 (csv/)
# example.csv (example.csv)
df <- read.csv("../csv/example.csv")
df

# 파이프 연산자
# %>%
# ((command + shift + M)) 단축키 사용
# 왼쪽에 있는 데이터를 오른쪽 함수에 대입

# head(데이터프레임명): 데이터프레임 상위 n개를 출력하는 함수
head(df, 3)
df %>% head(3)

# index 조건식으로만 필터링
# filter(조건식)
df %>% filter(Gender == "male")

# 기본 함수로 필터링하려면?
# [행(index)의 조건, 열의 조건]
df$Gender == "male" -> flag
df[flag, ]

# 특정 컬럼의 데이터만 추출
df %>% select(Name, Phone)
df %>% select(-Gender)

# 기본 함수로 필터링하려면?
df[c("Name", "Phone")]

# 성별이 남자인 데이터 중 이름과 휴대폰 번호만 출력
# 패키지 사용
df %>% 
  filter(Gender == "male") %>% 
  select(Name, Phone)

# 기본 함수로 필터링하려면?
df$Gender == "male" -> flag
df[flag, c("Name", "Phone")]

# ---
exam <- read.csv("../csv/csv_exam.csv")
exam

# 차순 정렬 변경 (오름차순/내림차순)
# 수학 성적을 기준으로 오름차순 정렬
exam %>% arrange(math)

# 수학 성적을 기준으로 내림차순 정렬
exam %>% arrange(desc(math))
exam %>% arrange(-math)

# 기본 함수로 하려면?
# 오름차순 정렬
order(exam$math) -> flag2
exam[flag2, ]
# 내림차순 정렬
order(exam$math, decreasing = TRUE) -> flag3
exam[flag3, ]

order(-exam$math) -> flag4
exam[flag4, ]

# 정렬 방식의 조건이 2개 이상인 경우
# 학급별로 내림차순 정렬 -> 수학 성적을 기준으로 오름차순 정렬
exam %>% arrange(desc(class), math)

# 그룹화 연산
# 학급별 수학, 영어, 과학의 평균 점수를 출력
exam %>% 
  group_by(class) %>% 
  summarise(
    mean_math = mean(math), 
    mean_english = mean(english), 
    mean_science = mean(science)
  )

# 기본 함수로 하려면?

# 데이터프레임의 결합
# 행 결합 -> 유니언 결합(=단순 행 결합)
# 열 결합 -> 조인 결합

# 유니언 결합
df_1 <- data.frame(
  id = 1:5, 
  score = c(70, 80, 65, 80, 90)
)

df_2 <- data.frame(
  id = 3:6, 
  weight = c(60, 50, 70, 80)
)

# 행 결합 함수 (rbind(): 데이터프레임 구조가 같은 데이터를 결합 시)
rbind(df_1, df_2) # 에러 발생. 왜? 데이터 구조가 다르기 때문

df_3 <- data.frame(
  id = 3:8, 
  score = c(50, 70, 80, 70, 90, 50)
)

rbind(df_1, df_3)

# bind_rows(): 데이터 구조와 상관없이 데이터 결합 가능하다. 
bind_rows(df_1, df_2) # 결합됨! rbind() 사용할 때와 달리

bind_rows(df_1, df_2, df_3) # 결합됨 ㅇㅇ

# 조인 결합
# 특정 조건이 참인 경우 컬럼 데이터를 추가
df_4 <- data.frame(
  id = c("test", "test2", "test3", "test4"), 
  item = c("A", "B", "B", "D")
)

df_5 <- data.frame(
  item = c("A", "B", "C"), 
  price = c(1000, 2000, 3000)
)

# inner_join(): 두 개의 데이터프레임에서 모두 가진 데이터만 결합하여 출력
inner_join(df_4, df_5, by = "item")

# left_join(): 왼쪽 데이터프레임을 기준으로 결합
left_join(df_4, df_5, by = "item")

# right_join(): 오른쪽 데이터프레임을 기준으로 결합
right_join(df_4, df_5, by = "item")

# full_join()
full_join(df_4, df_5, by = "item")

# ---
install.packages("ggplot2")
library(ggplot2)

# ggplot2 패키지 안에 있는 샘플 데이터 로드
midwest <- ggplot2::midwest

head(midwest, 3)
str(midwest)

# 데이터프레임 뷰어창에서 확인하기
View(midwest)

# 컬럼의 이름 변경하기
# rename(데이터프레임명, 새컬럼명 = 변경할 컬럼명)
# popasian 컬럼을 asian으로 변경
# poptotal 컬럼을 total로 변경
rename(midwest, asian = popasian) -> midwest
rename(midwest, total = poptotal) -> midwest
View(midwest)

# 복사본 생성 (midwest에서 county, asian, total 데이터만 추출하여 저장)
# filter()은 index의 조건식
# select()이 column의 조건식
midwest[c("county", "asian", "total")]
midwest %>% select(county, asian, total) -> df

# 전체 인구 수 대비 아시아 인구 수 비율이라는 컬럼을 생성
# 컬럼의 이름은 ratio
# (아시아 인구 수 / 전체 인구 수) * 100 = ratio

# 벡터 데이터를 이용하여 전체 인구 수 대비 아시아 인구 수 비율 생성
(df$asian / df$total) * 100 -> ratio

bind_cols(df, ratio = ratio)
cbind(df, ratio)
data.frame(df, ratio)
df$ratio <- ratio
df

# 패키지 이용하여 파생변수 추가하기
df2 <- midwest[c("county", "asian", "total")]
# mutate(): 파생변수 생성 함수
df2 %>% 
  mutate(ratio = (asian / total) * 100) -> df2

# 히스토그램
# hist(벡터데이터)
hist(df$ratio)

# 전체 ratio의 평균값 출력
mean(df$ratio) -> mean_ratio

# mean_ratio와 ratio 데이터를 비교하여 
# 평균값보다 높으면 large, 평균값보다 낮으면(이하인 경우) small
# group이라는 새 컬럼에 데이터 추가하기

ifelse(
  df2$ratio > mean_ratio, 
  "large", 
  "small"
) -> df2$group

table(df2$group)

# 패키지 이용하여 컬럼 추가하기
df %>% 
  mutate(group = ifelse(
    ratio > mean(ratio), 
    "large", 
    "small"
    )
  ) -> df
table(df$group)

# ---
midwest <- ggplot2::midwest

# midwest 데이터에서 데이터 정제
# 컬럼 이름 변경
# popadults 컬럼을 adult로 변경
# poptotal 컬럼을 total로 변경
# county, adults, total 컬럼만 따로 추출하여 변수에 저장
# "전체 인구 수 대비 미성년자 인구 비율" 컬럼 생성 -> child_ratio
#   1. 전체 인구 수 - 성인 인구 수 = 미성년자 인구 수
#   2. 미성년자 인구 수 컬럼 생성 -> childs
#   3. (미성년자 인구 수 / 총 인구 수) * 100
# child_ratio가 높은 상위 5개 지역을 출력

midwest$popadults

rename(midwest, adults = popadults) -> midwest
rename(midwest, total = poptotal) -> midwest

df <- midwest[c("county", "adults", "total")]

df$total - df$adults -> childs
cbind(df, childs) -> df
View(df)

(df$childs / df$total) * 100 -> child_ratio
cbind(df, child_ratio) -> df
View(df)

df %>% 
  select(county, child_ratio) %>% 
  arrange(desc(child_ratio)) %>% 
  head(5)

# 기본 함수들을 이용하여 작업
# 컬럼 이름 변경하기
rename(midwest, adults = popadults) -> midwest
rename(midwest, total = poptotal) -> midwest
# county, adults, total 컬럼만 따로 추출하여 변수에 저장
df <- midwest[c("county", "adults", "total")]
# childs 컬럼을 추가하여, total - adults 데이터 추가하기
df$total - df$adults -> df$childs
head(df, 2)
# child_ratio 컬럼을 추가하여, (childs / total) * 100 데이터 추가하기
(df$childs / df$total) * 100 -> df$child_ratio
# child_ratio가 높은 상위 5개 지역 출력
# child_ratio 내림차순 정렬
# 상위 5개 지역 출력 -> 데이터프레임 상위 5개 데이터 출력
order(df$child_ratio, decreasing = TRUE) -> flag
df[flag, ] -> df
# 상위 5개 데이터 출력
head(df, 5)

# 파이프 연산자만을 이용하여 작업
midwest <- ggplot2::midwest

midwest %>% 
  rename(adults = popadults, total = poptotal) %>% 
  select(county, adults, total) %>% 
  mutate(childs = total - adults, 
         child_ratio = (childs / total) * 100) %>% 
  arrange(desc(child_ratio)) %>% 
  head(5)

midwest %>% 
  rename(adults = popadults, total = poptotal) %>% 
  select(county, adults, total) %>% 
  mutate(childs = total - adults, 
         child_ratio = (childs / total) * 100) %>% 
  select(county, child_ratio) %>% 
  arrange(desc(child_ratio)) %>% 
  head(5)
# midwest 데이터가 전혀 변하지 않았다는 장점