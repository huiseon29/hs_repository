# 매개변수가 존재하지 않는 함수 생성
func_1 <- function(){
  print("Hello R!")
}

# 생성된 함수 호출
func_1()

# vs. 

func_2 <- function(){
  return("Hello R!")
}
func_2()

func_2()
result1 <- func_1()
result2 <- func_2()

# 매개변수가 존재하는 함수 생성
func_3 <- function(input_x, input_y){
  result = input_x + input_y
  print(result)
}

result3 = func_3(10, 3)

# 변수의 종류
  # 전역(전체의 영역) 변수: 함수 내/외부 어디서든 사용 가능한 변수
  # 지역변수: 함수 내부에서 생성된 변수는 함수 내부에서만 사용 가능함 
    # 함수 외부에서 지역 변수를 호출하면 호출되지 X
    # 휘발성 변수
  # 매개변수: 함수를 생성할 때 인자값이 저장되는 공간
    # 인자값 = 입력값
    # 지역변수와 마찬가지로 함수 내부에서만 사용 가능함

# 매개변수의 개수와 인자의 개수를 따르게 호출하는 경우
func_3(10)
func_3(10, 3, 2)

# 인자의 개수가 가변인 경우의 함수 생성해 보기
func_4 <- function(...){
  print(c(...))
}
func_4()
func_4(1, 2, 3, 4)
func_4(10, 20, 30, 40, 50, 60 ,70)

# 함수를 이용하여 커스텀 연산자 생성
"%s%" <- function(input_x, input_y){
  result <- input_x ^ input_y
  return(result)
}
# %s%(10, 5) 에러 뜸
10 %s% 5

# 매개변수에 기본값을 설정하여 함수 생성
func_5 <- function(input_x, input_y = 2, input_z = 3){
  result <- input_x + input_y - input_z
  return(result)
}
func_5(5, 10, 3)
func_5(5)
# func_5(5, 10, 3) 호출
# -> input_x = 5, input_y = 10, input_z = 3
# -> result = 5 + 10 - 3
# -> return (12)
# func_5(5) 호출
# -> input_x = 5, input_y = 2, input_z = 3
# -> result = 5 + 2 - 3
# -> return (4)

# 외부에서 가져온 함수를 활용할 때 많이 사용할 방법임! 
func_5(10, input_z = 1)

# 매개변수가 2개인 함수 생성
# 매개변수 사이의 값들을 모두 합하여 되돌려주는 함수 생성
  # 누적합을 위한 데이터 공간 생성 (=변수 생성)
  # start부터 end까지 반복하는 반복문 생성
  # i에 대입되는 데이터는? 벡터 데이터의 각 원소가 하나씩 대입되어 반복 실행
func_6 <- function(start, end){
  result = 0
  for(i in start:end){
    result = result + i
  }
  return(result)
}
func_6(1, 10)
func_6(1, 100) # func_6은 합계를 구해주는 함수! 

min(5, 3, 8, 1, 10)
max(10, 3, 6, 11, 8)

# 함수 생성
# 매개변수 2개 생성
# 첫 번째 매개변수는 데이터 하나를 저장하는
# 두 번째 매개변수는 인자의 개수가 가변인 경우
# 최소값을 되돌려주는 함수
# val2가 아닌 여러 개가 오는..
func_7 <- function(val, val2){
  result <- val
  if(val > val2){
    result <- val2
  }
  return(result)
}
func_7(10, 3)
func_7(3, 4)

# vs. 

func_8 <- function(val, ...){
  result <- val
  for(i in c(...)){
    if(result > i){
      result <- i
    }
  }
  return(result)
}
func_8(10, 2, 5, 1, 7)

# func_8(10, 2, 5, 1, 7) 호출
# -> val = 10, ... = 2, 5, 1, 7
# -> result = 10
# -> for(i in c(2, 5, 1, 7))
# -> 첫 번째 반복 시
#   -> i = 2
#   -> if(10 > 2)
#   -> 조건식이 참이므로 -> result = 2
# -> 두 번째 반복 시
#   -> i = 5
#   -> if(2 > 5)
#   -> 조건식이 거짓이므로 -> 아무 행동도 하지 않는다. 
# -> 세 번째 반복 시
#   -> i = 1
#   -> if(2 > 1)
#   -> 조건식이 참이므로 -> result = 1
# -> 네 번째 반복 시
#   -> i = 7
#   -> if(7 > 1)
#   -> 조건식이 거짓이므로 -> 아무 행동도 하지 않는다. 
# 반복문 종료
# return (1)

# 평균을 구하는 함수 생성
# 매개변수가 가변인 함수 생성
# 인자값 모두를 더한다. (반복문 사용하여)
  # 합계라는 초기 데이터를 생성하여 0을 대입
  # 인자들을 벡터 데이터로 변환
  # 반복문을 이용하여 모든 데이터를 누적합. 
  # 합계에 인자의 개수로 나눠 준다. 
  # 결과를 되돌려준다. 

func_9 <- function(...){
  result = 0
  cnt = 0
  for(i in c(...)){
    result = result + i
    cnt = cnt + 1
  }
  avg_result = result / cnt
  return(avg_result)
}
func_9(1,2,3,4,5)

sum(5, 3, 2)
length(c(5, 3, 2))
func_10 <- function(...){
  result = sum(...) / length(c(...))
  return(result)
}
func_10(5, 3, 2)

test_sum <- function(...){
  result = 0
  for(i in c(...)){
    result = result + i
  }
  return(result)
}
test_sum(5, 3, 1)
test_sum() # 인자 X -> result = 0

test_len <- function(value){
  cnt = 0
  for(i in value){
    cnt = cnt + 1
  }
  return(cnt)
}
test_len(c(1, 5, 3))
test_len()

# 데이터프레임 생성
  # 벡터 데이터들을 이용하여 데이터 프레임 생성
name <- c("A", "B", "C", "D", "E")
grade <- c(1, 3, 2, 2, 1)
data.frame(name, grade) -> student

# 행렬 생성
# cbind(): 열을 추가하는 함수
midterm <- c(70, 80, 75, 60, 90)
final <- c(80, 90, 70, 75, 85)
cbind(midterm, final) -> score

# 행렬과 데이터프레임을 결합 
data.frame(student, score)
cbind(student, score)

# 벡터 데이터 생성
gender = c("M", "F", "F", "M", "F")

# 데이터프레임, 벡터 데이터 그리고 행렬을 결합한다. 
data.frame(student, gender, score)
cbind(student, gender, score) -> students

test_vec = c(1, 2, 3, 4)
# 길이가 다른 벡터 데이터를 결합
cbind(students, test_vec)
data.frame(students, test_vec)

# 파생변수 생성
# 데이터프레임에서 새로운 열을 추가하는 작업임
# 분석에 사용할 기존 데이터가 존재하지 않을 때 
# 데이터를 가공해 새로운 데이터를 생성
students
# 기존에 생성하였던 벡터 데이터들의 합
midterm + final
# 데이터프레임에서 특정 열을 선택하여 합
students$midterm + students[["final"]] -> total

# cbind(), data.frame() 함수를 이용하여 파생변수 생성
cbind(students, total)
data.frame(students, total)

students$total <- students$midterm + students$final
students

students$total

# students에 파생변수를 생성해 보자. 
# 평균 성적을 생성
# 컬럼의 이름은 mean
total/2 -> mean
(midterm + final)/2 -> mean

# total 컬럼의 데이터만 추출
students$total/2 -> mean
students$total/c(2, 2, 2, 2, 2)

data.frame(students, mean)
cbind(students, mean)

students$mean <- (students$midterm + students$final)/2
students

# 새로운 학생 정보를 추가
data.frame(name = "F", grade = 1, gender = "M", midterm = 80, final = 70, 
           total = 150, mean = 75) -> new_student
# 데이터프레임 행 추가
rbind(students, new_student)
# data.frame() 함수 행 추가 안 됨. 
data.frame(students, new_student)
new_student2 <- data.frame(name = "G", gender = "M", midterm = 80, final = 70, 
                          total = 150, grade = 1, mean = 75)
rbind(students, new_student2)

# 리스트 형태 데이터
list_a = list(name = "test", age = 20)
list_a$loc = "seoul"
list_a

# 리스트 데이터에서 value가 벡터 데이터인 경우
list_b = list(
  name = c("test", "test2"), 
  age = c(20, 30)
)
list_b
# 리스트 2차원 데이터에서 "test"라는 문자열을 추출하려면, 
# 리스트에서 key값을 이용하여 데이터 추출
list_b["name"]
list_b$name
list_b$name[1]

# 필터
# 데이터프레임명[행의 조건, 열의 조건]
students[1,]
students[c(1, 3),]
# 학년이 1학년인 학생의 정보만 출력
students$grade
students$grade == 1 -> flag
students[flag,]
!flag
students[!flag,]

# 행과 열의 조건식을 모두 이용하여 데이터를 추출
# 여학생들의 중간, 기말 성적만 추출
# 여학생 -> 인덱스 조건식 (gender == "F")
# 중간, 기말 성적 -> 컬럼 조건식 (midterm, final)
students$gender == "F" -> flag2
students[flag2, c("midterm", "final")]
students[flag2,]

# 전체 학생 중 중간 성적이 80점 이상이고 
# 기말 성적도 80점 이상인 학생 정보를 출력하라. 
students$midterm >= 80 & students$final >= 80 -> flag3
students[flag3,]

students$midterm >= 80 -> flag4
students$final >= 80 -> flag5
students[flag4 & flag5,]
students[flag4 | flag5,]
flag4 & flag5
students

# 데이터 순서를 변경하는 함수
# 컬럼의 순서를 변경
student[c("grade", "name")]

# 인덱스 순서를 변경
students[c(3, 2, 1, 5, 4)]

# 학년을 기준으로 오름차순 정렬
# order(): 벡터 데이터의 데이터들을 오름차순 정렬 위치 출력함. 
order(students$grade) -> flag6
students[flag6,]

# 기말 성적을 기준으로 하여 내림차순 정렬
# order() 함수에서 특정 매개변수의 인자 값을 TRUE로 변경하면 내림차순 정렬
order(students$final, decreasing = TRUE) -> flag7
students[flag7,]

order(-students$final)

order(students$name)
order(-students$name)
order(students$name, decreasing = TRUE)

# 패키지 설치
install.packages("dplyr")
# 패키지 로드
library(dplyr)

# 컬럼 이름 변경하기
# rename(데이터프레임명, 새로운 컬럼의 이름 = 변경할 컬럼의 이름) 
students
rename(students, mean_score = mean)

# ifelse(조건식, 참인 경우 출력값, 거짓인 경우 출력값)
# 조건식을 이용하여 파생변수 생성

ifelse(
  students$mean >= 75, 
  "pass",
  "fail"
) -> res
students$result <- res
students

ifelse(
  students$mean > 75, 
  "pass", 
  ifelse(
    students$mean == 75, 
    "hold", 
    "fail"
  )
)

package_version(R.version)
