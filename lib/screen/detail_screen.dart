import 'package:flutter/material.dart';
import 'package:netflixclone/model/model_movie.dart';
import 'dart:ui';

// 영화를 클릭했을 때 영화의 세부정보가 나오는 스크린
class DetailScreen extends StatefulWidget {
  final Movie movie; // 해당 영화
  DetailScreen({required this.movie}); // 영화의 정보 버튼 & 다양한 위젯을 통해 얻을 수 있음
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false;
  @override
  void initState() {
    super.initState();
    like = widget.movie.like; // 해당 영화의 찜하기 여부
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  // 해당 영화 포스터
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.movie.poster),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ClipRect(
                      // 뒷화면의 블러처리 효과
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.1),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                // 원본 이미지 중앙에 배치
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                                  child: Image.network(widget.movie.poster),
                                  height: 300,
                                ),
                                describeText(),
                                titleText(),
                                playButton(),
                                movieText(),
                                castText(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.black26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    likeButton(), // 찜하기 버튼
                    ratingButton(), // 평가하기 버튼
                    shareButton(), // 공유버튼
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget describeText() {
    return Container(
      padding: EdgeInsets.all(7),
      child: Text(
        '99% 일치 2019 15+ 시즌 1개',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 13),
      ),
    );
  }

  Widget titleText() {
    return Container(
      padding: EdgeInsets.all(7),
      child: Text(
        widget.movie.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget playButton() {
    return Container(
      padding: EdgeInsets.all(3),
      child: FlatButton(
        onPressed: () {},
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.play_arrow),
            Text('재생'),
          ],
        ),
      ),
    );
  }

  Widget movieText() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Text(widget.movie.toString()),
    );
  }

  Widget castText() {
    return Container(
      padding: EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Text(
        '출연 : 현빈, 손예진, 서지혜\n제작자: 이정효, 박지은',
        style: TextStyle(color: Colors.white60, fontSize: 12),
      ),
    );
  }

  Widget likeButton() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: InkWell(
        onTap: () {
          setState(() {
            like = !like;
            widget.movie.reference.updateData({
              'like': like
            });
          });
        },
        child: Column(
          children: <Widget>[
            like ? Icon(Icons.check) : Icon(Icons.add),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(
                fontSize: 11,
                color: Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ratingButton() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: <Widget>[
            Icon(Icons.thumb_up),
            Padding(padding: EdgeInsets.all(5)),
            Text(
              '평가',
              style: TextStyle(
                fontSize: 11,
                color: Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shareButton() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: <Widget>[
            Icon(Icons.send),
            Padding(padding: EdgeInsets.all(5)),
            Text(
              '공유',
              style: TextStyle(
                fontSize: 11,
                color: Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
