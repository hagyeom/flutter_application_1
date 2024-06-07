/*
작성자: 윤하겸
작성일: 2024-05-25
*/
// user_repository.dart
// 유저 모델을 관리하는 저장소
import 'user.dart';

class UserRepository {
  static final UserRepository _instance = UserRepository._internal();
  final List<User> _users = [];

  factory UserRepository() {
    return _instance;
  }

  UserRepository._internal();

  void addUser(User user) {
    _users.add(user);
  }

  User? authenticate(String email, String password) {
    try {
      return _users.firstWhere(
        (user) => user.email == email && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }
}
