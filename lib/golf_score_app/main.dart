// 앱의 루트 위젯인 MaterialApp을 생성하고, 앱의 기본 테마와 라우팅 정보를 설정
// GolfScoreApp 위젯 정의
// GolfScoreScreen 위젯 정의
// HoleGameScreen, ScoreDetailsScreen, PlayerRegistrationScreen 위젯 호출
import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/hole_game_screen.dart';
import 'package:flutter_application_1/golf_score_app/player.dart';
import 'package:flutter_application_1/golf_score_app/player_registration_screen.dart';
import 'package:flutter_application_1/golf_score_app/score_details_screen.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const GolfScoreScreen(),
        '/hole_game': (context) => const HoleGameScreen(),
        '/score_details': (context) => const ScoreDetailsScreen(),
        '/player_registration': (context) => const PlayerRegistrationScreen(),
      },
    );
  }
}

class GolfScoreScreen extends StatefulWidget {
  const GolfScoreScreen({super.key});

  @override
  GolfScoreScreenState createState() => GolfScoreScreenState();
}

class GolfScoreScreenState extends State<GolfScoreScreen> {
  List<Player> players = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Golf Score'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '플레이어 정보 입력:',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/player_registration',
                    arguments: players);
              },
              child: const Text('회원 가입'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/hole_game', arguments: players);
              },
              child: const Text('홀 경기 시작'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/score_details',
                    arguments: players);
              },
              child: const Text('18홀 결과 확인'),
            ),
          ],
        ),
      ),
    );
  }
}
