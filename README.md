# 넷플릭스 클론 코딩🎞

# Screen
![image](https://user-images.githubusercontent.com/54922625/152634147-cdeb3edb-a8ff-4fd3-8b93-7d1949f18af0.png)
![image](https://user-images.githubusercontent.com/54922625/152634158-9c570436-ed84-435b-ab7e-ebc8f8a6e457.png)
![image](https://user-images.githubusercontent.com/54922625/152634169-bf80c260-8cd2-4845-8ad0-c9c29e92a89d.png)
![image](https://user-images.githubusercontent.com/54922625/152634174-429ceb84-8804-4caa-9922-d3058cda894e.png)
![image](https://user-images.githubusercontent.com/54922625/152634184-c0d78f0a-e6aa-48aa-a5be-7df61d93d1ff.png)


# Using Package
|package|ver.|function|
|---|---|------|
|<a href="https://pub.dev/packages/carousel_slider"> carousel_slider</a>|^4.0.0|회전 목마 슬라이더 위젯 생성|
|<a href="https://pub.dev/packages/flutter_linkify">flutter_linkify</a>|^5.0.2|텍스트 URL과 이메일을 Flutter용 텍스트의 클릭 가능한 인라인 링크로 바꿈.|
|<a href="https://pub.dev/packages/url_launcher">url_launcher</a>|^6.0.18|URL 실행을 위한 Flutter 플러그인. iOS, Android, 웹, Windows, macOS 및 Linux를 지원|
|<a href="https://pub.dev/packages/cupertino_icons">cupertino_icons</a>|^1.0.4|Flutter의 Cupertino 위젯 에서 사용하는 기본 아이콘 자산 세트를 포함하는 자산 저장소|
|<a href="https://pub.dev/packages/firebase_core">firebase_core</a>|^1.12.0|여러 Firebase 앱에 연결할 수 있는 Firebase Core API를 사용하는 Flutter 플러그인|
|<a href="https://pub.dev/packages/cloud_firestore">cloud_firestore</a>|^3.1.7|Cloud Firestore API 를 사용하는 Flutter 플러그인 .|

# Program Structure
※ (D) : directory, 메소드 설명 추가
- main.dart : 
<h3>model(D)</h3>
   
   - model_movie : 영화 모델을
<h3>screen(D)</h3>

  - **home_screen.dart** : 넷플릭스 홈 화면
  - **detail_screen.dart** : 영화를 클릭하면, 해당영화의 세부정보를 나타내는 스크린
  - **like_screen.dart** : 내가 찜한 영화를 보여주는 스크린
  - **search_screen.dart** : 영화를 검색하는 스크린
  - **more_screen.dart** : 프로필 스크린
   
<h3>widget(D)</h3>

  - **bottom_bar.dart** : 
  - **box_slider.dart** : 각각의 영화를 사각형 슬라이드로 나열하는 위젯
  - **circle_slider.dart** : 각각의 영화를 원형 슬라이드로 나열하는 위젯
  - **carousel_slider.dart** :  영화를 회전목마형 슬라이드로 나열하는 위젯




# Key Features
1. firebase와의 연동
2. 
