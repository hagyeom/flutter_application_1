/*
작성자: 윤하겸
작성일: 2024-05-21
*/
// 로그인 페이지
import 'package:flutter/material.dart';
import 'find_id_password_screen.dart'; // Import the find id/password screen

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                labelText: '아이디',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: '비밀번호',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // 로그인 로직 추가
              },
              child: const Text('로그인'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FindIdPasswordScreen(),
                  ),
                );
              },
              child: const Text('아이디/비밀번호 찾기'),
            ),
          ],
        ),
      ),
    );
  }
}
