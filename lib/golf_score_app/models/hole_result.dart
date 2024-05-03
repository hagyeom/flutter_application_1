// 홀 결과와 관련된 모델 클래스를 정의
class HoleResult {
  final int holeNumber; // 홀 번호
  final int par; // 홀의 파
  final int strokes; // 스트로크
  final int holeScore; // 홀 점수

  HoleResult({
    required this.holeNumber,
    required this.par,
    required this.strokes,
    required this.holeScore,
  });
}
