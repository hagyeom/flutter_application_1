import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/screens/golf_score_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBFD98F),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GolfScoreScreen()), // 다른 페이지로 이동
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
                'assets/golficon.jpg', // 이미지 파일 경로
                width: 77, // 이미지의 너비
                height: 100, // 이미지의 높이
              ),
            ],
          ),
        ),
      ),
    );
  }
}
