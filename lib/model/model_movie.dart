import 'package:cloud_firestore/cloud_firestore.dart';

//넷플릭스 영화 모델
class Movie {
  final String title; //제목
  final String keyword; //키워드
  final String poster; //포스터
  final bool like; //찜하기 여부
  final String actor; //출연자
  final String producer; //제작자
  /*DocumentReference 
  :실제 Firebase firestore에 있는 데이터 컬럼을 참조할 수 있는 링크
  reference를 이용해 해당 데이터에 대한 CRUD 기능을 간단히 처리 가능
  - CRUD : Create(생성), Read(읽기), Update(갱신), Delete(삭제)
  */

  final DocumentReference reference;

  Movie.fromMap(Map<String, dynamic> map, {required this.reference})
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like'],
        actor = map['actor'],
        producer = map['producer'];

  Movie.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data() as Map<String, dynamic>, reference: snapshot.reference);

  @override
  //키워드 출력
  String toString() => "Movie<$title:$keyword>";
  
  //출연자,제작자 출력
  String toOfficials() => "출연 : ${actor}\n제작자 : ${producer}";
}
