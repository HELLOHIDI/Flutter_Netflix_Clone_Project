import 'package:flutter/material.dart';
import 'package:netflixclone/model/model_movie.dart';
import 'package:netflixclone/widget/carousel_slider.dart';
import 'package:netflixclone/widget/circle_slider.dart';
import 'package:netflixclone/widget/box_slider.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
  ];

  @override
  Widget build(BuildContext context) {
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
