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
  





# Using Packages
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
<h2>1. Flutter&Firebase 연동</h2>
Firebase의 DB라 볼 수 있는 firestore을 사용하였다. 이를 사용하기 위해서 cloud_firestoredhk firebase_core 패키지를 설치하였다.
영화 더미 데이터들을 firebase 데이터베이스에 추가해두고 이를 활용하는 식으로 구현을 했다.<br/>

------------------------------------------
<pre>
<code># main.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // --- ①
  await Firebase.initializeApp( // --- ②
    options: FirebaseOptions( // --- ③
      apiKey: "AIzaSyAmJXArzo8jgQGZVAhJdzrYtoOBchZ1VLU", // Your apiKey
      appId: "1:980877547437:android:90f18890410accd06a3324", // Your appId
      messagingSenderId: "980877547437", // Your messagingSenderId
      projectId: "netflix-clone-test-4bbcf", // Your projectId
    ),
  );
  runApp(MyApp());
}
</code>
</pre>

<details>
 <summary> 🔍 자세히 분석하기 </summary>

### ① WidgetsFlutterBinding.ensureInitialized() 
    firebase를 사용하기 위해서는 main파일에서 WidgetsFlutterBinding.ensureInitialized()을 사용하여 초기화를 해줘야 된다.
    
    그 이유는 Flutter는 main 메소드를 앱의 시작점으로 사용한다. 그렇기에 runApp 메소드의 시작 지점에서 
    Flutter 엔진과 위젯의 바인딩이 미리 완료되어있어야 한다.
    
    즉 main 메소드에서 서버나 SharedPreferences 등 비동기로 데이터를 다룬 다음 runApp을 실행해야하는 경우, 
    async-await와 함께 WidgetsFlutterBinding.ensureInitialized()을 반드시 추가해주어야 한다.
    
### ② Firebase.initializeApp()
    Firebase 서비스를 사용하려면 먼저 FlutterFire를 초기화해야 합니다. 
    
    Firebase.initializeApp()는 FlutterFire CLI를 사용하여 지원되는 모든 플랫폼에 대해 
    얻을 수 있는 Firebase 프로젝트 애플리케이션 구성을 수락합니다.

### ③ options: FirebaseOptions()
    firebase app의 보조 기능을 사용할때는 option을 추가해주어야 된다.
    
    이 프로젝트에서는 cloud firestore을 사용했기에 option값을 넣어 주어야 한다.
    
    optiondpsms apiKey, appId, messagingSenderId, projectId를 기입해주어야 된다.

</details>

------------------------------------------

<pre>
<code># model_movie.dart
import 'package:cloud_firestore/cloud_firestore.dart';
class Movie { // --- ①
  final String title;
  final String keyword;
  final String poster;
  final bool like;
  final String actor;
  final String producer;
  
  final DocumentReference reference; // --- ②

  Movie.fromMap(Map<String, dynamic> map, {required this.reference}) // --- ①
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like'],
        actor = map['actor'],
        producer = map['producer'];

  Movie.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data() as Map<String, dynamic>, reference: snapshot.reference); // --- ③

  @override
  String toString() => "Movie<$title:$keyword>"; // --- ④

  String toOfficials() => "출연 : ${actor}\n제작자 : ${producer}"; // --- ④
}

</code>
</pre>

<details>
 <summary> 🔍 자세히 분석하기 </summary>
 
 ### ① Movie class member variable & Movie.fromMap()
     model_movie.dart 파일에 title,keyword, poster, like, actor, producer의 멤버변수를 설정
     
     Movie.fromMap()을 통해 named 생성자를 구현
     
 ### ② final DocumentReference reference
     실제 Firebase firestore에 있는 데이터 컬럼을 참조할 수 있는 링크
     
     reference를 이용해 해당 데이터에 대한 CRUD 기능을 간단히 처리 가능

 ### ③ fromsnapshot() 
     named 생성자를 reference 멤버변수의 named 생성자를 구현
 
 ### ④ toString(), toOfficials()
     각각 영화소개와 관계자 텍스트를 반환하는 메소드

</details>



**********************************************************************

 

<h2> 2. detail_screen 뒷화면 블러처리효과 </h2>
<h2> 3. search_screen의 검색한 영화 출력 </h2>
<h2> 4. home화면에 영화위젯 </h2>



<details>
 <summary> ❓ 모르는 개념 정리</summary>
 #### 바인딩(binding)
 : 프로그램에 사용된 구성 요소의 실제 값 또는 프로퍼티를 결정짓는 행위를 의미합니다. 예를 들어 함수를 호출하는 부분에서 실제 함수가 위치한 메모리를 연결
 
 #### FlutterFire CLI
 : 지원되는 모든 플랫폼에서 FlutterFire 설치 프로세스를 쉽게 하는 데 도움이 되는 명령을 제공하는 유용한 도구
 
 #### CRUD 기능
 : Create(생성), Read(읽기), Update(갱신), Delete(삭제)
</details>



# 기술 스택 (Technique Used)

# 참고 사이트
https://changjoopark.medium.com/flutter-main-%EB%A9%94%EC%86%8C%EB%93%9C%EC%97%90%EC%84%9C-%EB%B9%84%EB%8F%99%EA%B8%B0-%EB%A9%94%EC%86%8C%EB%93%9C-%EC%82%AC%EC%9A%A9%EC%8B%9C-%EB%B0%98%EB%93%9C%EC%8B%9C-%EC%B6%94%EA%B0%80%ED%95%B4%EC%95%BC%ED%95%98%EB%8A%94-%ED%95%9C%EC%A4%84-728705061375 : [Flutter] main 메소드에서 비동기 메소드 사용시 반드시 추가해야하는 한줄



