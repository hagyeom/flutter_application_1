// user_repository.dart
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

  // 이름과 전화번호로 사용자를 찾을 수 있도록 하는 메서드
  User? authenticate(String email, String password) {
    try {
      return _users.firstWhere(
            (user) => user.email == email && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }

  // 이름, 전화번호, 이메일을 통해 사용자를 찾는 메서드
  User? findUserByNameAndPhoneNumber(String name, String phoneNumber) {
    try {
      return _users.firstWhere(
            (user) => user.name == name && user.phoneNumber == phoneNumber,
      );
    } catch (e) {
      return null;
    }
  }

  User? findUserByNamePhoneAndEmail(String name, String phoneNumber, String email) {
    try {
      return _users.firstWhere(
            (user) => user.name == name && user.phoneNumber == phoneNumber && user.email == email,
      );
    } catch (e) {
      return null;
    }
  }
}
