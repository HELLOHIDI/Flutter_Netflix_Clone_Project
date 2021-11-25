import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        height: 50,
        child: TabBar(
          labelColor: Colors.white, //현재 탭의 탭바 요소의 색
          unselectedLabelColor: Colors.white60, //현재 탭이 아닌 탭바 요소의 색
          indicatorColor: Colors.transparent, //탭 표시줄에서 선택한 탭 표시기의 색
          tabs: <Widget>[
            tabMaker(Icons.home, "홈"),
            tabMaker(Icons.search, "검색"),
            tabMaker(Icons.save_alt, "저장할 컨텐츠 목록"),
            tabMaker(Icons.list, "더보기"),
          ],
        ),
      ),
    );
  }

  Widget tabMaker(IconData iconData, String iconTitle) {
    return Tab(
      icon: Icon(iconData, size: 15),
      child: Text(
        iconTitle,
        style: TextStyle(fontSize: 6),
        textAlign: TextAlign.center,
      ),
    );
  }
}
