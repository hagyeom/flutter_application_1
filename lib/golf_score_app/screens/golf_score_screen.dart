// 메인 화면(회원가입)
import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/models/player.dart';
import 'package:flutter_application_1/golf_score_app/screens/hole_game_screen.dart';

class GolfScoreScreen extends StatefulWidget {
  const GolfScoreScreen({super.key});

  @override
  GolfScoreScreenState createState() => GolfScoreScreenState();
}

class GolfScoreScreenState extends State<GolfScoreScreen> {
  List<Player> players = []; // 플레이어 정보를 담을 리스트
  String registrationMessage = ''; // 회원 가입 완료 메시지

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
            TextField(
              decoration: const InputDecoration(labelText: '이름'),
              onChanged: (value) {
                // 입력한 이름을 플레이어 리스트에 추가
                players.add(Player(name: value));
              },
            ),
            ElevatedButton(
              onPressed: () {
                // 회원 가입 버튼 클릭 시 플레이어 정보를 출력
                setState(() {
                  registrationMessage = '회원 가입 완료: $players';
                });
              },
              child: const Text('회원 가입'),
            ),
            Text(registrationMessage), // 회원 가입 완료 메시지 표시
            ElevatedButton(
              onPressed: () {
                // 홀 경기 시작 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HoleGameScreen(players: players),
                  ),
                );
              },
              child: const Text('홀 경기 시작'),
            ),
          ],
        ),
      ),
    );
  }
}
