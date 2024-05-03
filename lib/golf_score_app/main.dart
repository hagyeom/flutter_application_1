// 앱의 진입점 및 라우팅을 처리
import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/screens/golf_score_screen.dart';

void main() {
  runApp(const GolfScoreApp());
}

class GolfScoreApp extends StatelessWidget {
  const GolfScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golf Score App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GolfScoreScreen(),
    );
  }
}
