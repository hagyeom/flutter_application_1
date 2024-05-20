import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/screens/golf_score_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFD0E8A0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'GOLF is My Life',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Icon(
                Icons.golf_course,
                size: 100,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GolfScoreScreen()),
                  );
                },
                child: const Text('로그인 화면으로 이동'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
