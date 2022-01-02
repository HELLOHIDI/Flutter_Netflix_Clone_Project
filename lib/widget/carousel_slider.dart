import 'package:flutter/material.dart';
import 'package:netflixclone/model/model_movie.dart';
import 'package:netflixclone/screen/detail_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

// 이미지 보여주는 역할 + 찜하기 버튼 + 정보 버튼 포함
class CarouselImage extends StatefulWidget {
  final List<Movie> movies; //영화 데이터 더미
  CarouselImage({required this.movies}); // 영화 데이터를 홈화면으로 부터 넘겨받아야 함
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  late List<Movie> movies; // 영화
  late List<Widget> images; // 영화포스터
  late List<String> keywords; // 영화키워드
  late List<bool> likes; // 영화 찜하기 여부
  int _currentPage = 0; // CarouseImage에서 어느 위치에 있는지 index를 저장하는 변수
  late String _currentKeyword; // currentPage에 기록되어 있는 현재 keyword

  // 홈화면에서 가져온 영화 데이터를 carousImage에서 사용하기 위해 초기화 (movies로 부터 원하는 값만 골라서 사용)
  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((m) => Image.network(m.poster)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
          ),
          CarouselSlider(
            items: images,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index; // 현재 페이지의 인덱스
                  _currentKeyword = keywords[_currentPage]; // 현재 페이지의 키워드 설정
                });
              },
            ),
          ),
          CurrentKeywordMaker(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 가운데에 같은 간격으로 배치
              children: <Widget>[
                likeButton(), //찜하기 버튼
                playButton(), //플레이 버튼
                informationButton(), //더보기 버튼
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(likes, _currentPage),
            ),
          ),
        ],
      ),
    );
  }

  // 현재 영화의 keyword
  Widget CurrentKeywordMaker() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
      child: Text(
        _currentKeyword,
        style: TextStyle(fontSize: 11),
      ),
    );
  }

  // 찜하기 버튼
  Widget likeButton() {
    return Container(
      child: Column(
        children: [
          // likes의 여부의 따라 찜하기 버튼의 아이콘 선택
          likes[_currentPage] ? makeLikeIconButton(Icon(Icons.check)) : makeLikeIconButton(Icon(Icons.add)),
          Text(
            "내가 찜한 콘텐츠",
            style: TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }

  // 찜하기 버튼의 아이콘 설정(likes의 여부에 따라)
  IconButton makeLikeIconButton(Icon likeIcon) {
    return IconButton(
      icon: likeIcon,
      onPressed: () {
        setState(() {
          //버튼을 누르면 likes의 값을 변경
          likes[_currentPage] = !likes[_currentPage];
          // firebase의 현재 likes 상태를 업데이트 시킴
          movies[_currentPage].reference.updateData({
            'like': likes[_currentPage]
          });
        });
      },
    );
  }

  // 재생 버튼
  Widget playButton() {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: FlatButton(
        color: Colors.white,
        onPressed: () {},
        child: Row(
          children: <Widget>[
            Icon(
              Icons.play_arrow,
              color: Colors.black,
            ),
            Padding(padding: EdgeInsets.all(3)),
            Text(
              '재생',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  // 더보기 버튼
  Widget informationButton() {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            // 버튼을 누르면 그 영화의 더보기 화면으로 넘어감
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<Null>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) {
                    // 그 영화의 더보기 화면으로 넘어감
                    return DetailScreen(
                      movie: movies[_currentPage],
                    );
                  },
                ),
              );
            },
          ),
          Text(
            "정보",
            style: TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}

// 현재 영화의 인덱스를 알려주는 막대창
List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(
      Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // 현재 영화 : 더 하얗게 , 아니면 : 회색에 가깝게
          color: _currentPage == i ? Color.fromRGBO(255, 255, 255, 0.9) : Color.fromRGBO(255, 255, 255, 0.4),
        ),
      ),
    );
  }

  return results;
}
