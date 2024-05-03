// 플레이어 정보를 정의하는 Dart 클래스를 포함하는 파일
class Player {
  final String name; // 플레이어의 이름
  int totalStrokes = 0; // 플레이어의 총 타수
  int totalWins = 0; // 플레이어의 총 승리 횟수
  int score; // 플레이어의 점수
  Player({required this.name, this.score = 0});

  get totalScore => null; // 플레이어 객체를 생성할 때 사용되는 생성자
  // 이름을 인수로 받아 새로운 플레이어 객체를 생성
}
