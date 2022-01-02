import 'package:flutter/material.dart';
import 'package:netflixclone/model/model_movie.dart';
import 'package:netflixclone/screen/detail_screen.dart';

// 사각형 영화 위젯
class BoxSlider extends StatelessWidget {
  final List<Movie> movies; //영화 데이터 더미
  BoxSlider({required this.movies}); // 영화 데이터를 홈화면으로 부터 넘겨받아야 함
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("요즘 뜨는 콘텐츠"),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal, //수직으로 스크롤 가능
              children: makeBoxImages(context, movies),
            ),
          ),
        ],
      ),
    );
  }
}

// 사각형 위젯을 만드는 함수
List<Widget> makeBoxImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  // 리스트에 담겨있는 영화들
  for (var i = 0; i < movies.length; i++) {
    results.add(
      // 사각형 영화 위젯을 누르면 더보기 스크린으로 넘어감
      InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<Null>(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return DetailScreen(
                  movie: movies[i],
                );
              },
            ),
          );
        },
        // 사각형 모양으로 제작
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft, // 왼쪽 끝에 맞춰서 정렬
            child: Image.network(movies[i].poster),
          ),
        ),
      ),
    );
  }

  return results;
}
