// 홀 결과 입력 화면
import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/models/player.dart';

class HoleResultScreen extends StatefulWidget {
  final List<Player> players;

  const HoleResultScreen({super.key, required this.players});

  @override
  HoleResultScreenState createState() => HoleResultScreenState();
}

class HoleResultScreenState extends State<HoleResultScreen> {
  List<int> strokesList = []; // 각 플레이어의 스트로크를 저장하는 리스트

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('홀 경기 결과 입력'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < widget.players.length; i++)
              Column(
                children: [
                  Text('플레이어 ${widget.players[i].name}의 타수 입력:'),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      strokesList.add(int.parse(value));
                    },
                  ),
                ],
              ),
            ElevatedButton(
              onPressed: () {
                // 경기 결과 계산 및 기록
                recordGameResult();
                // 홀 경기 시작 페이지로 이동
                Navigator.pop(context);
              },
              child: const Text('결과 기록'),
            ),
          ],
        ),
      ),
    );
  }

  // 경기 결과를 계산하고 기록하는 함수
  void recordGameResult() {
    // 각 플레이어의 타수를 확인하여 이긴 팀을 결정하고 결과를 기록
    int team1TotalStrokes = strokesList[0] + strokesList[1];
    int team2TotalStrokes = strokesList[2] + strokesList[3];

    if (team1TotalStrokes < team2TotalStrokes) {
      widget.players[0].totalWins++;
      widget.players[1].totalWins++;
    } else if (team1TotalStrokes > team2TotalStrokes) {
      widget.players[2].totalWins++;
      widget.players[3].totalWins++;
    }

    // 각 플레이어의 총 타수 업데이트
    widget.players[0].totalStrokes += strokesList[0];
    widget.players[1].totalStrokes += strokesList[1];
    widget.players[2].totalStrokes += strokesList[2];
    widget.players[3].totalStrokes += strokesList[3];

    // 결과 출력
    String resultMessage =
        '플레이어 ${widget.players[0].name}과 ${widget.players[1].name}의 총 타수: $team1TotalStrokes\n'
        '플레이어 ${widget.players[2].name}과 ${widget.players[3].name}의 총 타수: $team2TotalStrokes';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("홀 경기 결과"),
          content: Text(resultMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("닫기"),
            ),
          ],
        );
      },
    );
  }
}
