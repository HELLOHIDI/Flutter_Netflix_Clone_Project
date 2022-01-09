import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:netflixclone/model/model_movie.dart';
import 'package:netflixclone/screen/detail_screen.dart';

class LikeScreen extends StatefulWidget {
  _LikeScreenState createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  // StreamBuilder : Stream 과의 상호 작용에 대한 최신 스냅샷을 기반으로 자체적으로 빌드되는 위젯
  //QuerySnapshot : collection으로 부터 Query, snapshot을 통해 받아온 데이터 타입
  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      // 배열의 요소를 필터링한다 (괄호 안에 조건을 만족하는 값만 필터링한다)
      // .where을 통해 like:true(isEqualTo: true)인 데이터를 가져오라는 쿼리를 보낼 수 있음
      stream: FirebaseFirestore.instance.collection('movie').where('like', isEqualTo: true).snapshots(),
      builder: (context, snapshot) {
        //만약 데이터가 없으면 로딩화면(//LinearProgressIndicator())
        if (!snapshot.hasData) return LinearProgressIndicator();
        //데이터가 있다면 _buildBody를 호출하여 실제 위젯을 만듬
        return _buildList(context, snapshot.data!.docs); //docs : QuerySnapshot의 내부 데이터 리스트에 접근한다.
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<DocumentSnapshot> searchResults = [];
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3, // 한 줄에 3개
        childAspectRatio: 1 / 1.5, // 1/1.5 비율의 위젯을 만들어줌
        padding: EdgeInsets.all(3),
        children: snapshot.map((data) => _buildListItem(context, data)).toList(),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final movie = Movie.fromSnapshot(data); //인자로 넘겨받은 data를 Movie 타입으로 변환
    return InkWell(
      child: Image.network(movie.poster),
      onTap: () {
        //버튼을 누르면 Detail Screen으로 넘어감
        Navigator.of(context).push(
          MaterialPageRoute<Null>(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return DetailScreen(movie: movie);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 27, 20, 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'images/bbonflix_logo.png',
                  fit: BoxFit.contain,
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 30,
                  ),
                  child: Text(
                    '내가 찜한 콘텐츠',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          _buildBody(context),
        ],
      ),
    );
  }
}
