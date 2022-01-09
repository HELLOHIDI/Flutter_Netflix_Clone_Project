import 'package:flutter/material.dart';
import 'package:netflixclone/widget/bottom_bar.dart';
import 'package:netflixclone/screen/home_screen.dart';
import 'package:netflixclone/screen/more_screen.dart';
import 'package:netflixclone/screen/search_screen.dart';
import 'package:netflixclone/screen/like_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAmJXArzo8jgQGZVAhJdzrYtoOBchZ1VLU", // Your apiKey
      appId: "1:348829866643:android:1d70085829f87239d1cb66", // Your appId
      messagingSenderId: "348829866643", // Your messagingSenderId
      projectId: "netflix-clone-test-eaabf", // Your projectId
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HIDIFlix",
      //debug 마크 삭제
      debugShowCheckedModeBanner: false,
      // 앱의 전체 시각적 테마의 구성을 정의
      theme: ThemeData(
        brightness: Brightness.dark, // 밝기
        primaryColor: Colors.black, // 사용자와 상호작용하는 앨리먼트의 기본 색상
        accentColor: Colors.white, // 위젯을 위한 전경색
      ),
      // 탭 레이아웃 만들기
      home: DefaultTabController(
        // 4개의 항목(홈, 검색, 저장할 컨텐츠 목록, 더보기)
        length: 4,
        child: Scaffold(
          //https://github.com/HELLOHIDI/HIDI-Flutter-Challenge/blob/main/TabBar%26%20TabBarView%20Widget.md
          body: TabBarView(
            // 사용자가 스크롤할 수 없도록 하는 스크롤 물리를 생성합니다
            physics: NeverScrollableScrollPhysics(),
            children: [
              // 각각의 탭의 화면
              HomeScreen(),
              SearchScreen(),
              LikeScreen(),
              MoreScreen(),
            ],
          ),
          //탭바제작
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}
