// 플레이어와 관련된 모델 클래스를 정의
import 'package:flutter_application_1/golf_score_app/models/hole_result.dart';

class Player {
  final String name; // 플레이어 이름
  int totalStrokes = 0; // 총 타수
  int totalWins = 0; // 총 승리 수
  List<HoleResult> holeResults = []; // 각 홀의 결과를 담을 리스트
  Player({required this.name});
}
