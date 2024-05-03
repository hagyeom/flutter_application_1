// 홀 경기 화면
import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/models/player.dart';
import 'package:flutter_application_1/golf_score_app/screens/hole_result_screen.dart';

class HoleGameScreen extends StatelessWidget {
  final List<Player> players;

  const HoleGameScreen({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('홀 경기'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '각 홀에서의 경기를 진행하세요.',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                // 각 홀의 경기를 진행하는 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HoleResultScreen(players: players),
                  ),
                );
              },
              child: const Text('홀 경기 결과 입력'),
            ),
          ],
        ),
      ),
    );
  }
}
