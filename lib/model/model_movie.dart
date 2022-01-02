//넷플릭스 영화 모델 => 영화 데이터 관리를 쉽게 하기 위함
  
//모델에 들어갈 요소들을 class를 이용해 선언
class Movie {
  final String title; //제목
  final String keyword; //키워드
  final String poster; //포스터(영화 사진)
  final bool like; //찜하기

  //named 생성자를 이용해 개체 생성
  Movie.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like'];
  
  //인스턴스 출력 용이를 위한 toString() 메소드 구현
  @override
  String toString() => "Movie<$title:$keyword>";
}
