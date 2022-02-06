# 넷플릭스 클론 코딩🎞

# Screen
<table>
 <tr>
  <td align='center'>home_screen</td>
  <td align='center'>detail_screen</td>
 </tr>
 <tr>
  <td><img src='https://user-images.githubusercontent.com/54922625/152634147-cdeb3edb-a8ff-4fd3-8b93-7d1949f18af0.png'/></td>
  <td><img src='https://user-images.githubusercontent.com/54922625/152634169-bf80c260-8cd2-4845-8ad0-c9c29e92a89d.png'/></td>
 </tr>
</table>



<table>
 <tr>
  <td align='center'>search_screen</td>
  <td align='center'> more_screen</td>
 </tr>
 <tr>
  <td><img src='https://user-images.githubusercontent.com/54922625/152634174-429ceb84-8804-4caa-9922-d3058cda894e.png'/></td>
  <td><img src='https://user-images.githubusercontent.com/54922625/152634184-c0d78f0a-e6aa-48aa-a5be-7df61d93d1ff.png' /></td>
 </tr>
</table>

 <table>
 <tr>
  <td align='center'>carousel_slider</td>
 </tr>
 <tr>
  <td><img src='https://user-images.githubusercontent.com/54922625/152634158-9c570436-ed84-435b-ab7e-ebc8f8a6e457.png'/></td>
 </tr>
</table>
  





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
- **📃 main.dart** : 메인 

<h3>📁 model</h3>

  - **📃 main.dart** : firebase에서 받아온 데이터를 매핑하기 위한 파일

<h3>📁 screen</h3>

  - **📃 home_screen.dart** : 넷플릭스 홈 화면
      |함수명|기능|
      |---|---|
      |_fetchData|streamData로부터 데이터를 추출하는 함수|
      |_buildBody|추출한 영화 더미 데이터를 실제 위젯으로 만드는 함수|
      |topBarItemMaker|탑바를 제작하는 함수|
      
  - **📃 detail_screen.dart** : 영화를 클릭하면, 해당영화의 세부정보를 나타내는 스크린
      |🛠 함수명|기능|
      |---|---|
      |describeText|영화분석 텍스트를 제작하는 함수|
      |titleText|영화제목 텍스트를 제작하는 함수|
      |playButton|재생버튼을 제작하는 함수|
      |movieText|영화설명 텍스트를 제작하는 함수|
      |castText|관계자 텍스트를 제작하는 함수|
      |likeButton|찜하기버튼을 제작하는 함수|
      |ratingButton|평가하기버튼을 제작하는 함수|
      |shareButton|공유버튼을 제작하는 함수|
      
  - **📃 like_screen.dart** : 내가 찜한 영화를 보여주는 스크린
      |🛠 함수명|기능|
      |---|---|
      |_buildBody|찜하기가 활성화된 영화 데이터를 필터링하는 함수|
      |_buildList|찜하기가 활성화된 영화 데이터를 위젯을 통해 구현하는 함수|
      |_buildListItem|찜하기가 활성화된 각각의 영화 데이터들을 버튼화하는 함수|
      
  - **📃 search_screen.dart** : 영화를 검색하는 스크린
      |🛠 함수명|기능|
      |---|---|
      |_buildBody|입력한 텍스트와 같은 영화 데이터를 필터링하는 함수|
      |_buildList|입력한 텍스트와 같은 영화 데이터를 위젯을 통해 구현하는 함수|
      |_buildListItem|입력한 텍스트와 같은 각각의 영화 데이터들을 버튼화하는 함수|
      
  - **📃 more_screen.dart** : 프로필 스크린
      |🛠 함수명|기능|
      |---|---|
      |profilePic|영화분석 텍스트를 제작하는 함수|
      |profileID|영화제목 텍스트를 제작하는 함수|
      |underLine|재생버튼을 제작하는 함수|
      |profileWebsite|영화설명 텍스트를 제작하는 함수|
      |editProfileButton|관계자 텍스트를 제작하는 함수|
   
<h3>📁 widget</h3>

  - **📃 bottom_bar.dart** : 바텀바를 제작하는 위젯
      |🛠 함수명|기능|
      |---|---|
      |tabMaker|각각의 탭요소를 제작하는 함수|
      
  - **📃 box_slider.dart** : 각각의 영화를 사각형 슬라이드로 나열하는 위젯
      |🛠 함수명|기능|
      |---|---|
      |makeBoxImages|각각의 영화를 사각형 모양 위젯을 만드는 함수|
      
  - **📃 circle_slider.dart** : 각각의 영화를 원형 슬라이드로 나열하는 위젯
      |🛠 함수명|기능|
      |---|---|
      |makeCircleImages|각각의 영화를 원형 모양 위젯을 만드는 함수|
      
  - **📃 carousel_slider.dart** : 영화를 회전목마형 슬라이드로 나열하는 위젯
      |🛠 함수명|기능|
      |---|---|
      |CurrentKeywordMaker|현재 영화의 keyword 텍스트를 제작하는 함수|
      |likeButton|찜하기 버튼을 제작하는 함수|
      |makeLikeIconButton|likes의 여부에 따라 찜하기 버튼의 아이콘을 제작하는 |
      |playButton|재생 버튼을 제작하는 함수|
      |informationButton|더보기 버튼을 제작하는 함수|
      |makeIndicator|현재 영화의 인덱스를 알려주는 막대창을 제작하는 |


# Key Features
1. firebase와의 연동(movie_model&main)
2. detail_screen 뒷화면 블러처리효과
3. search_screen의 검색한 영화 출력
4. home화면에 영화위젯 
