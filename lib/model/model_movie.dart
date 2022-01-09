import 'package:cloud_firestore/cloud_firestore.dart';

//넷플릭스 영화 모델
class Movie {
  final String title;
  final String keyword;
  final String poster;
  final bool like;
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
        like = map['like'];
  
  // .data() : 실제 데이터가 들어있으며 Map<String, dynamic>형태로 넘어온다.
  // DocumentSnapshot : 실제 Document의 데이터가 들어있는 객체이다.
  Movie.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data() as Map<String, dynamic>, reference: snapshot.reference);

  @override
  String toString() => "Movie<$title:$keyword>";
}
