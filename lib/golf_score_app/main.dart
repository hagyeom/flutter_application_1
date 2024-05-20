import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/screens/home_screen.dart';

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
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}
