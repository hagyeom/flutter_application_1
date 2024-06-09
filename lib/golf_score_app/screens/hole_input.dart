import 'app_bar_public.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'score_card.dart';
import 'package:flutter_application_1/golf_score_app/models/player.dart';


List<int> pars = List.filled(18, 4); // 초기값은 모두 4로 임시 설정
List<List<int>> scores = List.generate(4, (_) => List.filled(18, 0));
List<bool> holeCompleted = List.filled(18, false); // 각 홀의 입력 완료 상태를 추적하는 리스트
List<List<Color>> teamColors = List.generate(18, (_) => List.filled(4, Colors.white)); // 각 홀의 팀 색상을 추적하는 리스트

class HoleInput extends StatefulWidget {
  final int holeIndex;

  HoleInput({required this.holeIndex});

  @override
  _HoleInputState createState() => _HoleInputState();
}

class _HoleInputState extends State<HoleInput> {
  final List<String> players = ['Player 1', 'Player 2', 'Player 3', 'Player 4'];
  late List<TextEditingController> scoreControllers;

  @override
  void initState() {
    super.initState();
    scoreControllers = List.generate(
      4,
          (playerIndex) => TextEditingController(text: ''),
    );
  }

  @override
  void dispose() {
    for (var controller in scoreControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MakeAppBar.build(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('현재 홀은 ${widget.holeIndex + 1}홀 입니다.'),
            Text('현재 홀의 타수를 입력하세요. '),
            SizedBox(height: 20,),
            Expanded(
              child: Table(
                border: TableBorder.all(),
                columnWidths: {
                  0: FixedColumnWidth(120.0),
                  1: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('선수', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('타수', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for (int i = 0; i < players.length; i++)
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(players[i]),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: scoreControllers[i],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none, // Border removed
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                saveScores();
                assignTeams(); // 팀 지정 및 결과 색상 적용
                navigateToNextHole(context);
              },
              child: Text(widget.holeIndex < 17 ? '기록 하기' : '경기 종료'),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScoreCard()),
                );
              },
              child: Text('현황 보기'),
            ),
          ],
        ),
      ),
    );
  }

  void saveScores() {
    setState(() {
      for (int i = 0; i < players.length; i++) {
        scores[i][widget.holeIndex] = int.tryParse(scoreControllers[i].text) ?? 0;
      }
      holeCompleted[widget.holeIndex] = true;
    });
  }

  void assignTeams() {
    // 무작위 팀을 지정합니다.
    List<Color> teamColorsForHole = List.filled(4, Colors.white);
    List<int> indices = [0, 1, 2, 3];
    indices.shuffle();
    int teamType = Random().nextInt(3); // 0: 개인, 1: 2대2, 2: 3대1

    if (teamType == 0) {
      // 개인전
      int winnerIndex = indices.reduce((a, b) => scores[a][widget.holeIndex] < scores[b][widget.holeIndex] ? a : b);
      for (int i = 0; i < 4; i++) {
        teamColorsForHole[indices[i]] = (i == winnerIndex) ? Colors.red : Colors.white;
      }
    } else if (teamType == 1) {
      // 2대2 팀
      int team1Score = scores[indices[0]][widget.holeIndex] + scores[indices[1]][widget.holeIndex];
      int team2Score = scores[indices[2]][widget.holeIndex] + scores[indices[3]][widget.holeIndex];
      if (team1Score < team2Score) {
        teamColorsForHole[indices[0]] = Colors.red;
        teamColorsForHole[indices[1]] = Colors.red;
        teamColorsForHole[indices[2]] = Colors.blue;
        teamColorsForHole[indices[3]] = Colors.blue;
      } else {
        teamColorsForHole[indices[0]] = Colors.blue;
        teamColorsForHole[indices[1]] = Colors.blue;
        teamColorsForHole[indices[2]] = Colors.red;
        teamColorsForHole[indices[3]] = Colors.red;
      }
    } else if (teamType == 2) {
      // 3대1 팀
      List<int> team3Scores = [scores[indices[0]][widget.holeIndex], scores[indices[1]][widget.holeIndex], scores[indices[2]][widget.holeIndex]];
      team3Scores.sort();
      int team3Score = team3Scores[0] + team3Scores[1];
      int team1Score = scores[indices[3]][widget.holeIndex] * 2;
      if (team3Score < team1Score) {
        teamColorsForHole[indices[0]] = Colors.red;
        teamColorsForHole[indices[1]] = Colors.red;
        teamColorsForHole[indices[2]] = Colors.red;
        teamColorsForHole[indices[3]] = Colors.blue;
      } else {
        teamColorsForHole[indices[0]] = Colors.blue;
        teamColorsForHole[indices[1]] = Colors.blue;
        teamColorsForHole[indices[2]] = Colors.blue;
        teamColorsForHole[indices[3]] = Colors.red;
      }
    }

    teamColors[widget.holeIndex] = teamColorsForHole;
  }

  void navigateToNextHole(BuildContext context) {
    int nextHoleIndex = widget.holeIndex + 1;
    while (nextHoleIndex < 18 && holeCompleted[nextHoleIndex]) {
      nextHoleIndex++;
    }
    if (nextHoleIndex < 18) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HoleInput(holeIndex: nextHoleIndex)),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ScoreCard()),
      );
    }
  }
}
