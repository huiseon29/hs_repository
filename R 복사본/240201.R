# 벡터 데이터 생성
  # c() 함수를 이용하여 생성
  # 일반적인 변수에는 데이터 1개가 대입됨
  # 벡터 데이터, 하나의 변수에 여러 개의 데이터가 대입됨

# 행렬 데이터 생성
  # 2차원 데이터

array_x <- array(1:20, dim=c(4,5))
print(array_x)

array_y <- array(1:20, dim=c(4,4))
print(array_y)

array_z <- array(1:20, dim=c(4,6))
print(array_z)

# 리스트 형태의 데이터 생성
  # 벡터 데이터에서 index값 대신 key값을 지정
  # 리스트 데이터는 순서와 상관없이 key값을 기준으로 데이터 출력 가능

list_a = list(name = "test", age = 20, phone = "01012345678")
print(list_a["name"])

# 데이터 프레임 생성
  # 2차원 데이터를 생성하는 과정
  # index와 column을 기준으로 데이터를 생성한다. 

df = data.frame(
  name = c("test", "test2", "test3"), 
  age = c(20, 30, 40), 
  phone = c("01011112222", "01022223333", "01033334444")
)
print(df)

# 벡터의 개수를 다르면 에러 발생함
df_2 = data.frame(
  name - c("test", "age", "phone"), 
  age = c(20, 30)
)
print(df_2)

# 조건문(=if문)
x <- 3
if(x > 5){
  print("x는 5보다 크다.")
}

# if~else문
if(x > 5){
  print("x는 5보다 크다.")
}else{
  print("x는 5보다 작거나 같다.")
}

# 조건이 여러 개인 조건문 생성하기
score <- 77
if(score >= 90){
  #score가 90점 이상인 경우
  print("A")
}else if(score >= 80){
  #score가 90점 미만이고 80점 이상인 경우
  print("B")
}else if(score >= 70){
  #score가 80점 미만이고 70점 이상인 경우
  print("C")
}else{
  #score가 70점 미만인 경우
  print("F")
}

# 조건문에 조건식이 2개 이상인 경우
id <- "test"
pass <- "1111"

if(id == "test" & pass == "1234"){
  print("로그인 성공")
}else{
  print("로그인 실패")
}

# which문
  # 벡터 데이터에서 조건식이 일치하는 데이터의 위치 값을 출력함
name <- c("test", "test2", "test3")
which(name == "test2")
which(name != "test2")
which(name == "test5")

# 반복문
  # for문
    # 벡터 데이터의 원소 개수만큼 반복 실행하는 구문
for(i in 1:10){
  print(i)
}

array_a = 1:10
result = 0
for(i in array_a){
  result = result + i
}
print(result)

  # while문
    # 초기 시작값을 지정하고, 지정 값을 반복 실행할 때마다 증감시켜 조건식이 거짓이 될 때까지 반복 실행! 
i = 1
while(i <= 10){
  print(i)
  i = i + 1
}

i = 1
result = 0
while(i <= 10){
  i = i + 1
  result = result + i
}
print(result) # 65

vs. 

i = 1
result = 0
while(i <= 10){
  result = result + i
  i = i + 1
}
print(result) # 55


# 반복문을 활용한 구구단 생성
array_a = 2:9
array_b = 1:9

for(i in array_a){
  # print(i)
  for(j in array_b){
    print(i * j)
  }
}

# 반복문 문제
  # 2개의 주사위를 던진다. 두 주사위의 합이 5의 배수인 경우의 수를 출력하시오. 
for(i in 1:6){
  for(j in 1:6){
    res = i + j
    if( res %% 5 == 0){
      print(c(i, j))
    }
  }
}

# break문
  # 반복문을 강제로 종료
for(i in 1:100){
  print(i)
  if(i >3){
    break
  }
}

# 1부터 100까지 누적 합. 
  # 누적합의 값이 2000이 넘어가는 부분의 숫자, 합계는 몇일까?
result = 0

for(i in 1:100){
  result = result + i
  if(result >= 2000){
    break
  }
}
print(c(i, result))

# 1부터 1씩 증가시킨 데이터를 누적 합. 
  # 누적합의 값이 50000이 넘어가는 최초의 순간은 언제인가?
i = 1
result = 0

while(TRUE){
  result = result + i
  if(result >= 50000){
    break
    i = i + 1
  }
}
print(c(i, result))

# 1부터 100까지 숫자 중 짝수의 누적합을 출력하라. 
result = 0

for(i in 1:100){
  if(i %% 2 == 0){
    result = result + i
  }
}
print(result)

# vs. 

result = 0
for(i in 1:50){
  result = result + 2 * i
}
print(result)

# vs. 

i = 1
result = 0

while(TRUE){
  if(i > 100){
    break
  }
  if(i %% 2 == 0){
    result = result + i
    # i = i + 1 (무한 반복의 위험 존재)
  }
  i = i + 1 # 독립적으로 실행될 수 있게끔 if문 밖에 기입하기. 
}
print(result)

# 비순서형 벡터 데이터를 이용한 for문
array_a = c("kim", "lee", "park")

for(i in array_a){
  print(i)
}

for(i in array_a)
print(i)

i <- 1
while(i <= 3){
  print(array_a[i])
  i = i + 1
}

# next문
  # 반복문으로 되돌아간다. 다음으로 넘어간다. 
for(i in 1:10){
  if(i < 5){
    next
  }
  print(i)
}

# for(i in 1:10){
#   print(i)
# }

# 1부터 100까지 짝수의 누적합. 
result = 0
for(i in 1:100){
  if(i %% 2 == 1){
    next
  }
  result = result + i
}
print(result)
