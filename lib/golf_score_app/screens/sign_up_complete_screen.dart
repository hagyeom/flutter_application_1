/*
작성자: 윤하겸
작성일: 2024-05-22
*/
// 회원가입 완료
// 회원가입 완료 화면 한 번 클릭 시 로그인 화면으로 돌아감
// sign_up_complete_screen.dart
import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import the login screen
import 'package:shared_preferences/shared_preferences.dart';

class SignUpCompleteScreen extends StatelessWidget {
  final String memberCode;

  const SignUpCompleteScreen({Key? key, required this.memberCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _saveUserData(); // Save user data when completing sign up
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false,
          );
        },
        child: Container(
          color: const Color(0xFFBFD98F), // Background color
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.golf_course,
                  size: 100,
                  color: Colors.white,
                ),
                SizedBox(height: 24),
                Text(
                  '회원가입을 축하합니다',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '즐거운 골프 스포츠를 즐기세요!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('memberCode', memberCode);
  }
}
