# 오늘도 출첵

<img width = "30%" src="https://user-images.githubusercontent.com/95288868/230781220-9c9f6b59-8133-471a-9d6c-2907a7cbbeef.png" alt="오늘도 출첵"/>

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

<img width = "30%" src="https://user-images.githubusercontent.com/95288868/230781220-9c9f6b59-8133-471a-9d6c-2907a7cbbeef.png" alt="홈 화면" align ="left"/>

&nbsp;&nbsp;**'홈' 화면입니다**. 사용자는 여기서 NaverMap을 통해 출근을 인증하거나 우측 상단의 버튼을 통해 '마이페이지' 화면으로 이동할 수 있습니다.<br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;- 우측 하단에 위치한 버튼을 통해 현재 위치로 돌아갈 수 있습니다.<br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;- 화면에 보이는 녹색 원은 출근을 인증할 수 있는 범위를 나타냅니다.<br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;- 아래에 위치한 '출근하기' 버튼을 통해 출석체크를 할 수 있습니다. 단, 정상적으로 출근을 하려면 사용자는 본인이 근무하는 회사이면서 인증 가능한 범위(녹색 원)에 위치해야 합니다.<br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;- 성공적으로 출첵을 하게되면 출근 완료 메시지와 함께 출근한 시간을 볼 수 있습니다.<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>


<img width = "30%" src="https://user-images.githubusercontent.com/95288868/230885769-ce05b5fd-8eec-4380-b018-49209db900d8.png" alt="마이페이지 " align= "left"/>

**'마이페이지' 화면입니다**. 사용자는 여기서 자신이 근무하는 회사와 닉네임을 볼 수 있습니다.<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

<br/><br/><br/>

## 상태 관리

다음과 같은 이유로 Provider 패턴을 도입했으며, 동시에 학습하게 되었습니다.<br/><br/><br/>
&nbsp;&nbsp;1. **전역 상태 관리**: 더 이상 하위 위젯(페이지 등)과 더불어 다른 위젯들에게 하나하나 값을 전달하는 것이 아닌 flow 형태로 전역적으로 엑세스 가능한 상태를 관리할 수 있습니다.<br/><br/>
&nbsp;&nbsp;2. **성능 개선**: 전에는 state 변경을 화면에 보여주기 위해서는 statefulwidget의 setState를 사용했어야했는데, 이는 build 메서드를 호출하여 전체 위젯 트리를 rebuild 하므로 부담이 됐었습니다. 하지만 provider를 통해 전체 위젯 트리가 아닌 해당 상태를 사용하는 위젯만을 rebuild 할 수 있게 됩니다. (여기서 말하는 전체 위젯 트리란 앱 전체를 의미하는 것이 아닌, build 메서드가 호출되는 파일을 의미합니다.)<br/>
```dart
// exampleProvider = ChangeNotifier를 믹스인 혹은 상속받는 클래스
// exampleFunction = ChangeNotifier를 믹스인 혹은 상속받는 클래스에서 정의한 함수 등

Provider.of<exampleProvider>(context, listen: false).exampleFunction();
// 이 때, listen: false는 이벤트 핸들러와 관련된 Elevated Button과 같은 위젯은 굳이 rebuild 될 필요가 없다는 의미를 지닌 argument입니다.
```
<br/><br/>
&nbsp;&nbsp;3. **유지 보수 용이**: 위와 연결되는 내용이지만, setState를 사용하면 상태가 어디서 변경되었는지 파악하기 어렵고, 여러 setState 호출로 인해 코드의 복잡성이 증가할 수 있습니다. 하지만 provider를 사용하면 상태가 어떻게 업데이트 되는지, 상태가 어디서 변경되었는지를 명확하게 파악할 수 있어서 이와 관련된 로직을 간단하게 구현할 수 있습니다. 이를 통해 UI와 상태 관리를분리할 수 있고 최종적으로 앱의 유지 보수를 용이성을 높일 수 있습니다.<br/><br/>
&nbsp;&nbsp;4. **확장성**: provider는 다른 패턴들과 결합할 수 있다고 합니다. 예를 들어 BLoc 패턴과 provider를 함께 사용하면 비동기 데이터의 흐름을 처리할 수 있다고 합니다.

<br/><br/><br/>

## 오류 해결

<details>
<summary>🕵 비동기 처리를 사용하는 함수 내에서 context를 사용할 때 발생하는 오류</summary>
<div markdown="1">       
<br/>
<img width = "50%" src="https://user-images.githubusercontent.com/95288868/231440198-eb36cb5d-298d-42bf-b9c3-8d650e2209fe.png" alt="비동기 에러 발생"/><br/>
발생한 오류를 해결하기 위해 Flutter 공식문서에 언급된 대로 context가 비동기 처리 중 사라져서 프로그램 오류가 생기는 것을 방지하기 위해 아래의 코드를 사용했습니다.

```dart
if (!context.mounted) return; 
```
<br/>
하지만 위 그림과 같이 오류는 여전히 발생했습니다. 이를 해결할 방법으로 Future의 작업이 완료되면 특정 작업을 수행할 수 있게 해주는 then() 콜백 함수를 채택했습니다.<br/><br/>


먼저 _choolCheck() 함수 내부에 호출된 _canCheckDialog() 함수를 밖으로 꺼내준 후, _choolCheck() 함수가 쓰인 곳에서 then() 콜백 함수를 사용하여 아래 그림과 같이 _canCheckDialog() 함수를 호출해주었습니다.<br/><br/>

<img width = "50%" src="https://user-images.githubusercontent.com/95288868/231442614-06486d13-34de-47fc-b847-74857ead21f5.PNG" alt="에러 해결"/><br/>

이제 더 이상 context가 비동기 처리 과정에서 사라질 걱정을 하지 않아도 됩니다!



</div>
</details>
