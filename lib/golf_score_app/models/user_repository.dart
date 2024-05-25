/*
작성자: 윤하겸
작성일: 2024-05-25
*/
// user_repository.dart
// 유저 모델을 관리하는 저장소
import 'user.dart';

class UserRepository {
  static final List<User> _users = [];

  void addUser(User user) {
    _users.add(user);
  }

  User? getUser(String email, String password) {
    try {
      return _users.firstWhere(
        (user) => user.email == email && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }
}
