// utils.dart
// 회원코드 생성 함수가 포함된 유틸리티 파일
import 'dart:math';

String generateMemberCode() {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Random random = Random();
  return String.fromCharCodes(Iterable.generate(
    6,
        (_) => characters.codeUnitAt(random.nextInt(characters.length)),
  ));
}
