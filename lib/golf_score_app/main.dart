/*
작성자: 윤하겸
작성일: 2024-05-21
*/
import 'package:flutter/material.dart';
import 'screens/first_page.dart'; // 수정된 경로로 import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golf App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const FirstPage(), // 첫 화면을 FirstPage로 설정
    );
  }
}
