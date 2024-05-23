/*
작성자: 윤하겸
작성일: 2024-05-21
*/
import 'package:flutter/material.dart';
import 'login_screen.dart'; // 새로 만든 로그인 스크린을 import

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const LoginScreen()), // 여기서 GolfScoreScreen을 LoginScreen으로 변경
            );
          },
          child: const Text('로그인 페이지로 이동'),
        ),
      ),
    );
  }
}
