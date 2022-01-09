import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:netflixclone/model/model_movie.dart';
import 'package:netflixclone/screen/detail_screen.dart';

// 검색 기능이 있는 Screen

class SearchScreen extends StatefulWidget {
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter = TextEditingController(); //검색 위젯을 컨트롤 하는 위젯
  FocusNode focusNode = FocusNode(); //현재 검색 위젯에 커서가 있는지에 대한 상태를 가지고 있는 위젯
  String _searchText = ""; // 현재 검색 값

  // 검색 위젯을 컨트롤하는 _filter가 변화를 감지하여
  // searchText의 상태를 변화시키는 코드
  _SearchScreenState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  Widget _buildBody(BuildContext context) {
    // StreamBuilder : Stream 과의 상호 작용에 대한 최신 스냅샷을 기반으로 자체적으로 빌드되는 위젯
    //QuerySnapshot : collection으로 부터 Query, snapshot을 통해 받아온 데이터 타입
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('movie').snapshots(),
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
    // 데이터에 searchText가 포함되는지 필터링을 해야됨
    for (DocumentSnapshot d in snapshot) {
      // 만약 snapshot 리스트 요소 중 _searchText를 포함하면 searchResults에 넣어줌
      if (d.data.toString().contains(_searchText)) {
        searchResults.add(d);
      }
    }

    return Expanded(
      child: GridView.count(
        crossAxisCount: 3, // 한 줄에 3개
        childAspectRatio: 1 / 1.5, // 1/1.5 비율의 위젯을 만들어줌
        padding: EdgeInsets.all(3),
        children: searchResults.map((data) => _buildListItem(context, data)).toList(),
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
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
          ),
          Container(
            color: Colors.black,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  // 검색 입력 창
                  child: TextField(
                    focusNode: focusNode,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    autofocus: true,
                    controller: _filter,
                    decoration: InputDecoration(
                      filled: true, //컨테이너가 fillColor로 채워짐
                      fillColor: Colors.white60,

                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white60,
                        size: 20,
                      ), //맨 좌측 아이콘(시작 아이콘)
                      suffixIcon: focusNode.hasFocus
                          //클릭을 하면 아이콘, 없으면 빈 컨테이너
                          ? IconButton(
                              icon: Icon(
                                Icons.cancel,
                                size: 20,
                              ),
                              // 아이콘 버튼 누르면 비워줌
                              onPressed: () {
                                setState(() {
                                  _filter.clear();
                                  _searchText = "";
                                });
                              },
                            )
                          : Container(), //맨 우측 아이콘(마지감 아이콘)
                      hintText: "검색",
                      labelStyle: TextStyle(color: Colors.white),
                      // 전체 테투리가 항상 투명처리
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                // 취소 버튼 (누르면 검색창 비워주기 + focus도 빼줌)
                focusNode.hasFocus
                    ? Expanded(
                        child: FlatButton(
                          child: Text("취소"),
                          onPressed: () {
                            setState(() {
                              _filter.clear();
                              _searchText = "";
                              focusNode.unfocus();
                            });
                          },
                        ),
                      )
                    : Expanded(
                        flex: 0,
                        child: Container(),
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
