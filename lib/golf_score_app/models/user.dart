// user.dart
// 유저 정보를 저장할 User 모델
class User {
  final String name;
  final String phoneNumber;
  final String email;
  final String password;

  User({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });
}
