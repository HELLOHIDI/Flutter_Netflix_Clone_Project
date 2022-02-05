import 'package:flutter/material.dart';
//import 'package:flutter_linkify/flutter_linkify.dart';
//import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            ProfilePic(), // 프로필 사진
            ProfileID(), // 사용자 닉네임
            UnderLine(), // 밑줄
            ProfileWebsite(), // 하이퍼링크
            EditProfileButton(), // 프로필 수정 버튼
          ],
        ),
      ),
    );
  }

  // 프로필 사진
  Widget ProfilePic() {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage('images/bbongflix_logo.png'),
      ),
    );
  }

  // 사용자 아이디
  Widget ProfileID() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Text(
        'HELLOHIDI',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.white,
        ),
      ),
    );
  }

  // 밑줄
  Widget UnderLine() {
    return Container(
      padding: EdgeInsets.all(10),
      width: 140,
      height: 5,
      color: Colors.red,
    );
  }

  // 하이퍼링크
  Widget ProfileWebsite() {
    return Container(
      padding: EdgeInsets.all(10),
      // Linkify : 실제 클릭 가능한 주소를 만들어주는 패키지
      // url_lounch : 링크를 열어주는 패키지
      child: Text(
        "https://github.com/HELLOHIDI",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      // child: Linkify(
      //   onOpen: (link) async {
      //     if (await canLaunch(link.url)) {
      //       await launch(link.url);
      //     }
      //   },
      //   text: "https://github.com/HELLOHIDI",
      //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      //   linkStyle: TextStyle(color: Colors.white),
      // ),
    );
  }

  // 프로필 수정 버튼
  Widget EditProfileButton() {
    return Container(
      padding: EdgeInsets.all(10),
      child: FlatButton(
        onPressed: () {},
        child: Container(
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.edit,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '프로필 수정',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
