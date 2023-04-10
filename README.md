# 오늘도 출첵

<img width = "35%" src="https://user-images.githubusercontent.com/95288868/230781220-9c9f6b59-8133-471a-9d6c-2907a7cbbeef.png" alt="Screenshot_1681053426" align="left"/>

 근무하는 회사를 기준으로 100m 이내에 위치하는 직원이 자체적으로 출근을 인증하는 서비스입니다.

<br/><br/><br/>



## 프로젝트 구조

```
├── src                    		# source code 폴더
     ├── models            		# Json 및 기타 데이터를 정제하기 위한 모델 폴더
     │		├── scheme				# class 추상화 폴더
     │		├── locations			# location과 관련된 모델 폴더
     │		└── users				# user와 관련된 모델 폴더
     ├── providers              # 상태 관리에 필요한 controller를 모아놓은 폴더
     ├── service               	# location, user와 관련된 기능들을 모아놓은 폴더
     ├── utils                  # 전체적인 theme과 index를 관리하는 폴더
     ├── views                  # 화면 ui 폴더
     │		├── components			# 반복되는 widget을 모아놓은 폴더
     │		└── pages				# 화면을 임의로 구분하기 위한 폴더
     ├── dummy.dart			 	# DB와의 연동을 대신할 쓰레기 데이터
     
     ...
```



