/*
작성자: 윤하겸
작성일: 2024-05-23
*/
import 'package:flutter/material.dart';
import 'login_screen.dart';

// 첫페이지
// 화면 클릭 시 로그인 화면으로 이동(login_screen.dart으로 이동)
// first_page.dart
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBFD98F),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'GOLF\nis\nMy Life',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'GILLUBCD',
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/golficon.jpg',
                width: 77,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
