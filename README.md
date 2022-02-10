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

<h3>1-1. main.dart</h3>
<pre>
<code>
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

<h3>1-2. model_movie.dart</h3>
<pre>
<code> 
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
     model_movie.dart 파일에 title,keyword, poster, like, actor, producer의 멤버변수를 설정하고,
     
     Movie.fromMap()을 통해 named 생성자를 구현했다.
     
 ### ② final DocumentReference reference
     실제 Firebase firestore에 있는 데이터 컬럼을 참조할 수 있는 링크이고,
     
     reference를 이용해 해당 데이터에 대한 CRUD 기능을 간단히 처리 가능하다.

 ### ③ fromsnapshot() 
     named 생성자를 reference 멤버변수의 named 생성자를 구현했다.
 
 ### ④ toString(), toOfficials()
     각각 영화소개와 관계자 텍스트를 반환하는 메소드.

</details>

**********************************************************************

<h2> 2. home화면에 영화위젯 출력</h2>
home screen에 firestore에 만들어놓은 영화 더미 데이터들을 출력하기 위해서 
_fetchData() 함수에서 streamData로부터 데이터를 추출하고 _buildBody() 함수를 통해
추출한 영화 더미 데이터를 실제 위젯으로 만들었다.

<h3> 2.1 class _HomeScreenState extends State<HomeScreen> </h3>
<pre>
<code>
class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance; // --- ①
  late Stream<QuerySnapshot> streamData; // --- ②
  @override
  void initState() {
    super.initState();
    streamData = firestore.collection('movie').snapshots(); // --- ③
  }  
</code>
</pre>


<details>
<summary> 🔍 자세히 분석하기 </summary>

### ① FirebaseFirestore.instance
    FirebaseFirestore.instance 를 호출하여 인스턴스를 얻을 수 있다.

### ② late Stream<QuerySnapshot> streamData
    QuerySnapshot은 collection으로부터 Query, snapshot을 통해 받아온 데이터 타입으로서
    
    사실상 snapshot은 비동기(이기 때문에 late 사용) 로 실제 서버 데이터를 가져온 내용들이다.
    
    즉 Collection으로 부터 특정 Document들을 가져왔기에 하나씩 까봐야 한다. 
    
### ③ firestore.collection('movie').snapshots();
    FireStore에서는 2가지의 Read 방식이 존재한다
    1. one-time Read : 한번 읽는 방식
    2. Real-time Read : stream을 이용해 변경되는 사항을 Stream으로 넘겨주워
    실시간 반영이 이루어진다. 
    
    Collection의 Stream을 받아서 전체 Documents의 변경 사항을 실시간으로 받을 수 있고
    Document의 Stream을 받아서 하나의 Document의 변경 사항을 받을 수도 있다
    
    snapshots()은 real-time Read를 위한 Stream을 받아오는 함수이다.
    
    여기서 우리는 Collection 내에 저장되어 있는 모든 문서의 영화 데이터가 필요하기에 
    컬렉션 이름인 movie의 데이터를 .collection.snapshots()으로 받았다.
</details>

<h3> 2-2. _fetchData() & _buildBody() </h3>
<pre>
<code>
Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>( // --- ①
      stream: FirebaseFirestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) { // --- ②
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildBody(context, snapshot.data!.docs); // --- ③
      },
    );
  }
  
  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Movie> movies = snapshot.map((d) => Movie.fromSnapshot(d)).toList();
    return ListView(
      children: [
        Stack(
          children: [
            CarouselImage(movies: movies),
            TopBar(),
          ],
        ),
        CircleSlider(movies: movies),
        BoxSlider(movies: movies),
      ],
    );
  }
</code>
</pre>


<details>
<summary> 🔍 자세히 분석하기 </summary>

### ① StreamBuilder<QuerySnapshot>
    Stream 과의 상호 작용에 대한 최신 스냅샷을 기반으로 자체적으로 빌드되는 위젯으로
    받아온 Stream을 화면에 구성하기 위해 사용했다.
    
### ② builder part
    직접적으로 빌드하는 part로서 데이터가 없으면 로딩화면, 있으면 _buildBody를 호출하여 실제 위젯을 만들어준다.

### ③ snapshot.data!.docs
    docs는 QuerySnapshot의 내부 데이터 리스트에 접근하는거로써
    우리가 만들어둔 실제 영화 데이터를 모아둔 리스트에 접근하는 것이다.

### ④ List<Movie> movies = snapshot.map((d) => Movie.fromSnapshot(d)).toList()
    movies를 선언해 snapshot으로부터 데이터를 가져온다
    
    Movie.fromSnapshot() 메소드를 통해 데이터를 Movie모델의 형태로 바꿔주고,
    
    map을 통해 기존 snapshot(snapshot.data!.docs)을 기반으로 새로운 리스트를 생성해주고
    
    toList()를 통해 리스트로 선언해준다.

</details>

---------------------------------------------------------


<h2> 3. search_screen의 검색한 영화 출력 & like_screen의 찜한 영화 출력 </h2>

<h3> 3-1. search_screen.dart</h3>
<pre>
<code>
class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter = TextEditingController(); // --- ①
  FocusNode focusNode = FocusNode(); // --- ①
  String _searchText = ""; // --- ①

  _SearchScreenState() { // --- ②
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }
  
  Widget _buildBody(BuildContext context) //2-2-2의 _fetchData()와 같은 기능임으로 설명 생략
  
  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) { // --- ③
    List<DocumentSnapshot> searchResults = [];
    for (DocumentSnapshot d in snapshot) {
      if (d.data().toString().contains(_searchText)) {
        searchResults.add(d);
      }
    }

    return Expanded( // --- ④
      child: GridView.count(
        crossAxisCount: 3, // 한 줄에 3개
        childAspectRatio: 1 / 1.5, // 1/1.5 비율의 위젯을 만들어줌
        padding: EdgeInsets.all(3),
        children: searchResults.map((data) => _buildListItem(context, data)).toList(),
      ),
    );
  }
  
  Widget _buildListItem(BuildContext context, DocumentSnapshot data)
  // 받아온 데이터를 기준으로 영화 모델로 변환하여 버튼 위젯으로 만드는 과정
  // 버튼을 누르면 detail_screen으로 넘어감 (버튼은 각 포스터 사진을 자식으로 한 InkWell )
</code>
</pre>


<details>
 <summary> 🔍 자세히 분석하기 </summary>
 
 ### ① _SearchScreenState 선언
     _filter는 TextEditingController()로 검색 위젯을 컨트롤 하는 위젯이다.

     focusNode는 현재 검색 위젯에 커서가 있는지에 대한 상태를 가지고 있는 위젯이다.

     _searchText는 현재 입력되는 문자열을 나타낸다.
 
 ### ② _SearchScreenState()
     _filter.addListener()을 통해서 리스너를 등록하고
     현재 문자열을 리스너의 텍스트 값으로 대입한다.
 
 ### ③ _buildList()
     _buildList()함수는 _buildListItem()함수에서 만든 검색어에 해당되는 영화 위젯 버튼을 넣어주는 테두리를 만드는 함수이다

     searchResult는 searchText가 포함된 텍스트를 가진 영화들을 필터링해서 넣는 리스트이며,

     내부 데이터 리스트를 돌면서 _searchText를 포함하고 있는 영화를 리스트에 추가해준다

     이때 .data().toString()으로 형변환을 해주어서 문자열로 비교할 수 있도록 해준다.
 
 
 ### ④ Expanded 위젯
     GridView.count를 통해서 한줄에 3개 1:1.5 비율을 가지는 판을 제작해준다.
     
     이때 들어갈 아이템들은 searchResults에 해당되는 데이터들이며 
     
     각각의 영화 데이터를 _buildListItem()을 호출하여 위젯으로 제작한다.
 
 
</details>

<h3> 3-2. like_screen.dart</h3>

<pre>
<code>
Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('movie').where('like', isEqualTo: true).snapshots(), --- ①
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data!.docs); 
      },
    );
  }
</code>
</pre>


<details>
<summary> 🔍 자세히 분석하기 </summary>

### ① stream part

배열의 요소를 필터링 하기 위해 where함수를 사용했다.
.where을 통해 like:true(isEqualTo: true)인 데이터를 가져오라는 쿼리를 보낼 수 있다.
</details>



<h2> 5. detail_screen 뒷화면 블러처리효과 </h2>

<pre>
<code>

</code>
</pre>



<details>
 <summary> ❓ 모르는 개념 정리</summary>
 
 #### 바인딩(binding) (1-1 中 ① WidgetsFlutterBinding.ensureInitialized() part)
 : 프로그램에 사용된 구성 요소의 실제 값 또는 프로퍼티를 결정짓는 행위를 의미합니다. 예를 들어 함수를 호출하는 부분에서 실제 함수가 위치한 메모리를 연결
 
 #### FlutterFire CLI (1-1 中 ② Firebase.initializeApp() part)
 : 지원되는 모든 플랫폼에서 FlutterFire 설치 프로세스를 쉽게 하는 데 도움이 되는 명령을 제공하는 유용한 도구
 
 #### CRUD 기능 (1-2 中 ② final DocumentReference reference part)
 : Create(생성), Read(읽기), Update(갱신), Delete(삭제)


 #### Collection, Document (2-1 中 ② late Stream<QuerySnapshot> streamData part)
 ![image](https://user-images.githubusercontent.com/54922625/152805013-ab9a2658-9a9f-411f-93dc-8c95466dc451.png)
 
     1. Collection 안에 여러 개의 Document가 있고 그 안에 Document를 채우는 field가 존재한다.
     2. 즉 Collection으로 부터 특정 Document들을 가져왔기에 하나씩 까봐야 한다. 
     => 이 말은 movie라는 큰 틀에서 가져왔기 때문에 각각의 문서들을 확인해봐야 한다는 맥락이 이렇게 이해되는 것이다.
 
 #### stream (2-1 中 ② late Stream<QuerySnapshot> streamData part)
     스트림은 데이터의 추가나 변경이 일어나면 이를 관찰하던데서 처리하는 방법
     => 비동기일 때 사용 (일단 이 정도 알고 넘어가고 추후 자세히 공부할 것)

 #### Query (2-1 中 ② late Stream<QuerySnapshot> streamData part)
 : 데이터베이스에게 특정한 데이터를 보여달라는 클라이언트의 요청
 
 #### Listener (3-1 中 ② _SearchScreenState() part)
 
 리스너는 비동기 기능을 실행할 때 활용하는 기법으로
 어떤 이벤트가 발생했을 때 실행되는 함수를 리스너라고 부른다
 
 예를 들어 사용자가 탭을 바꾸면 TabController의 addListener함수가 호출된다. 
 이를 이용해 사용자가 탭을 바꾸면 값이나 상태를 갱신할 수 있다.
 
 </details>

# 기술 스택 (Technique Used)

# 배운점
- stream에 대해서 더욱 자세히 공부해보자

# 참고 사이트
https://changjoopark.medium.com/flutter-main-%EB%A9%94%EC%86%8C%EB%93%9C%EC%97%90%EC%84%9C-%EB%B9%84%EB%8F%99%EA%B8%B0-%EB%A9%94%EC%86%8C%EB%93%9C-%EC%82%AC%EC%9A%A9%EC%8B%9C-%EB%B0%98%EB%93%9C%EC%8B%9C-%EC%B6%94%EA%B0%80%ED%95%B4%EC%95%BC%ED%95%98%EB%8A%94-%ED%95%9C%EC%A4%84-728705061375 : [Flutter] main 메소드에서 비동기 메소드 사용시 반드시 추가해야하는 한줄

https://funncy.github.io/flutter/2021/03/06/firestore/ : 

https://velog.io/@oo0o_o0oo/Flutter-animation : Listener 


