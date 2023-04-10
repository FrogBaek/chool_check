# 오늘도 출첵

<img width = "30%" src="https://user-images.githubusercontent.com/95288868/230781220-9c9f6b59-8133-471a-9d6c-2907a7cbbeef.png" alt="Screenshot_1681053426"/>

 근무하는 회사를 기준으로 100m 이내에 위치하는 직원이 자체적으로 출근을 인증하는 서비스입니다.

<br/><br/><br/>



## 프로젝트 구조

```
├── src                     # source code 폴더
     ├── models                 # Json 및 기타 데이터를 정제하기 위한 모델 폴더
     │		├── scheme                # class 추상화 폴더
     │		├── locations             # location과 관련된 모델 폴더
     │		└── users                 # user와 관련된 모델 폴더
     ├── providers              # 상태 관리에 필요한 controller를 모아놓은 폴더
     ├── service                # location, user와 관련된 기능들을 모아놓은 폴더
     ├── utils                  # 전체적인 theme과 index를 관리하는 폴더
     ├── views                  # 화면 ui 폴더
     │		├── components            # 반복되는 widget을 모아놓은 폴더
     │		└── pages                 # 화면을 임의로 구분하기 위한 폴더
     ├── dummy.dart             # DB와의 연동을 대신할 쓰레기 데이터
     
     ...
```

<br/>


 ```
 사용된 패키지: 
   naver_map_plugin       # 목적: '오늘도 출첵'의 주요 서비스인 지도를 구현하기 위함
   geolocator             # 목적: 현재 위치와 관련된 함수를 작성하기 위함
   provider               # 목적: controller로써 상태관리를 하기 위함
   permission_handler     # 목적: 사용자의 권한을 보다 쉽게 얻기 위함 (geolocator 와 겹치는 부분은 hide)
   intl                   # 목적: DateTime을 Formatting 하기 위함
```



<br/><br/><br/>

## 화면 설명

<img width = "30%" src="https://user-images.githubusercontent.com/95288868/230781220-9c9f6b59-8133-471a-9d6c-2907a7cbbeef.png" alt="Screenshot_1681053426" align "left"/>|<img width = "30%" src="https://user-images.githubusercontent.com/95288868/230781220-9c9f6b59-8133-471a-9d6c-2907a7cbbeef.png" alt="Screenshot_1681053426" align "right"/>


'홈' 화면입니다. 사용자는 여기서 NaverMap을 통해 출근을 인증하거나 우측 상단의 버튼을 통해 '마이페이지' 화면으로 이동할 수 있습니다.<br/><br/>
- 우측 하단에 위치한 버튼을 통해 현재 위치로 돌아갈 수 있습니다.<br/><br/>
- 화면에 보이는 녹색 원은 출근을 인증할 수 있는 범위를 나타냅니다.<br/><br/>
- 아래에 위치한 '출근하기' 버튼을 통해 출석체크를 할 수 있습니다. 단, 정상적으로 출근을 하려면 사용자는 본인이 근무하는 회사이면서 인증 가능한 범위(녹색 원)에 위치해야 합니다.<br/><br/>
- 성공적으로 출첵을 하게되면 출근 완료 메시지와 함께 출근한 시간을 볼 수 있습니다.<br/><br/><br/>

'마이페이지' 화면입니다. 사용자는 여기서 자신이 근무하는 회사와 닉네임을 볼 수 있습니다.

