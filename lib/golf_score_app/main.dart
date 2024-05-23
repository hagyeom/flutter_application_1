/*
작성자: 윤하겸
작성일: 2024-05-21
*/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golf Score App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginScreen(), // 첫 화면을 LoginScreen으로 설정
    );
  }
}
