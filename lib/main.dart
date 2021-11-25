import 'package:flutter/material.dart';
import 'package:netflixclone/widget/bottom_bar.dart';
import 'package:netflixclone/screen/home_screen.dart';

void main() => runApp(MyApp());

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
              TabBarItemContainerMaker("search"),
              TabBarItemContainerMaker("save"),
              TabBarItemContainerMaker("more"),
            ],
          ),
          //탭바제작
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }

  TabBarItemContainerMaker(String tabBarTitle) {
    return Container(
      child: Center(
        child: Text(tabBarTitle),
      ),
    );
  }
}


/*
배워야 될 부분
- DefaultTabController
- TabBarView physics 요소
*/
