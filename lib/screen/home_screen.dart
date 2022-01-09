import 'package:flutter/material.dart';
import 'package:netflixclone/model/model_movie.dart';
import 'package:netflixclone/widget/carousel_slider.dart';
import 'package:netflixclone/widget/circle_slider.dart';
import 'package:netflixclone/widget/box_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

/*
Query : 데이터베이스에게 특정한 데이터를 보여달라는 클라이언트의 요청
QuerySnapshot : collection으로 부터 Query, snapshot을 통해 받아온 데이터 타입
                사실상 Snapshot은 비동기로 실제 서버 데이터를 가져온 내용물이다.
                Collection으로 부터 특정 Doucment들을 가져왔기에 하나씩 까봐야한다.
*/
class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance; //Firestore 인스턴스 생성
  late Stream<QuerySnapshot> streamData;
  @override
  void initState() {
    super.initState();
    //Real-time Read : 실시간으로 반영됨
    //Collection의 Stream을 받아서 전체 Documents의 변경 사항(streamData)을 실시간으로 받음
    //'movie'는 콘솔에서 작성한 컬렉션 이름(firebase 컬렉션)
    streamData = firestore.collection('movie').snapshots();
  }

  //streamData로부터 데이터를 추출하여 위젯생성 과정
  Widget _fetchData(BuildContext context) {
    //streamBuilder를 통해 streamdata를 가져옴
    return StreamBuilder<QuerySnapshot>(
      //snapshots() : real-time Read를 위한 Stream을 받아오는 함수
      stream: FirebaseFirestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) {
        //만약 데이터가 없으면 로딩화면(//LinearProgressIndicator())
        if (!snapshot.hasData) return LinearProgressIndicator();
        //데이터가 있다면 _buildBody를 호출하여 실제 위젯을 만듬
        return _buildBody(context, snapshot.data!.docs); //docs : QuerySnapshot의 내부 데이터 리스트에 접근한다.
      },
    );
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    // movies를 선언해 snapshot으로부터 데이터를 가져옴
    // map을 통해 데이터를 Movie모델의 형태로 바꿔주고 이를 리스트 형태
    // [{title : dsljfa} , {like :  true} , blabla ]
    List<Movie> movies = snapshot.map((d) => Movie.fromSnapshot(d)).toList();
    return ListView(
      children: [
        // 각각의 위젯에 영화 더미를 넣어준다
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

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //왼쪽, 위쪽, 오른쪽, 아래쪽에 padding 생성
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      // 탑바 제작
      child: Row(
        /*
        spaceBetween : 시작과 끝에 배치하고
        시작과 끝 위젯의 사이에 나머지 child widget을 배치한다
        시작과 끝 사이의 위젯의 나머지 공간은 모두 균일하게 배분한다 
        */
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'images/bbongflix_logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          topBarItemMaker("TV 프로그램"),
          topBarItemMaker("영화"),
          topBarItemMaker("내가 찜한 콘텐츠"),
        ],
      ),
    );
  }

  Widget topBarItemMaker(String topBarItemTitle) {
    return Container(
      padding: EdgeInsets.only(right: 1),
      child: Text(
        topBarItemTitle,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
