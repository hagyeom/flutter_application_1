import 'app_bar_public.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'score_card.dart';

List<int> pars = List.filled(18, 4); // 초기값은 모두 4로 임시 설정
List<List<int>> scores = List.generate(4, (_) => List.filled(18, 0));
List<bool> holeCompleted = List.filled(18, false); // 각 홀의 입력 완료 상태를 추적하는 리스트
List<List<Color>> teamColors = List.generate(
    18, (_) => List.filled(4, Colors.white)); // 각 홀의 팀 색상을 추적하는 리스트
int teamType = 4;
class PlayerStats { //승무패
  int wins = 0;
  int draws = 0;
  int losses = 0;
  int totalStrokes = 0;
}
List<PlayerStats> playerStats = List.generate(4, (_) => PlayerStats()); //승무패 리스트

class HoleInput extends StatefulWidget {
  final int holeIndex;

  HoleInput({required this.holeIndex});

  @override
  _HoleInputState createState() => _HoleInputState();
}

class _HoleInputState extends State<HoleInput> {
  final List<String> players = ['홍길동', '김철수', '신형만', '거북이'];
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
      backgroundColor: Color(0xFFEFEEEE), // 앱 내부 배경색 설정
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('현재 홀은 ${widget.holeIndex + 1}홀 입니다.'),
            Text('현재 홀의 타수를 입력하세요. '),
            SizedBox(
              height: 20,
            ),
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
                        child: Container(
                          color: Color(0xFFDBE4CB),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('선수',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: Color(0xFFDBE4CB),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('타수',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for (int i = 0; i < players.length; i++)
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(players[i]),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            color: Colors.white,
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
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      teamType = 0;
                    });
                    saveScores();
                    assignTeams(); // 팀 지정 및 결과 색상 적용
                    navigateToNextHole(context);
                  },
                  child: Text('개인전'),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      teamType = 1;
                    });
                    saveScores();
                    assignTeams(); // 팀 지정 및 결과 색상 적용
                    navigateToNextHole(context);
                  },
                  child: Text('2:2'),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      teamType = 2;
                    });
                    saveScores();
                    assignTeams(); // 팀 지정 및 결과 색상 적용
                    navigateToNextHole(context);
                  },
                  child: Text('3:1'),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  teamType = 4;
                });
                saveScores();
                assignTeams(); // 팀 지정 및 결과 색상 적용
                navigateToNextHole(context);
              },
              child: Text(widget.holeIndex < 17 ? '팀 랜덤 기록' : '경기 종료'),
            ),
            SizedBox(
              height: 10,
            ),
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
        scores[i][widget.holeIndex] =
            int.tryParse(scoreControllers[i].text) ?? 0;
      }
      holeCompleted[widget.holeIndex] = true;
    });
  }

  void assignTeams() {
    // 무작위 팀을 지정합니다.
    List<Color> teamColorsForHole = List.filled(4, Colors.white);
    List<int> indices = [0, 1, 2, 3];
    indices.shuffle();
    if (teamType == 4) teamType = Random().nextInt(3); // 0: 개인, 1: 2대2, 2: 3대1

    if (teamType == 0) {
      // 개인전
      int winnerIndex = indices.reduce((a, b) =>
          scores[a][widget.holeIndex] < scores[b][widget.holeIndex] ? a : b);
      if (scores[indices[0]][widget.holeIndex] ==
              scores[indices[1]][widget.holeIndex] &&
          scores[indices[0]][widget.holeIndex] ==
              scores[indices[2]][widget.holeIndex] &&
          scores[indices[0]][widget.holeIndex] ==
              scores[indices[3]][widget.holeIndex]) {
        for (int i = 0; i < 4; i++) {
          teamColorsForHole[indices[i]] = Colors.green;
          playerStats[indices[i]].draws++;
        }
      } else {
        for (int i = 0; i < 4; i++) {
          teamColorsForHole[indices[i]] =
              (i == winnerIndex) ? Colors.red : Colors.white;
          if (i == winnerIndex) {
            playerStats[indices[i]].wins++;
          } else {
            playerStats[indices[i]].losses++;
          }
        }
      }
    } else if (teamType == 1) {
      // 2대2 팀
      int team1Score = scores[indices[0]][widget.holeIndex] +
          scores[indices[1]][widget.holeIndex];
      int team2Score = scores[indices[2]][widget.holeIndex] +
          scores[indices[3]][widget.holeIndex];
      if (team1Score < team2Score) {
        teamColorsForHole[indices[0]] = Colors.red;
        teamColorsForHole[indices[1]] = Colors.red;
        teamColorsForHole[indices[2]] = Colors.blue;
        teamColorsForHole[indices[3]] = Colors.blue;
        playerStats[indices[0]].wins++;
        playerStats[indices[1]].wins++;
        playerStats[indices[2]].losses++;
        playerStats[indices[3]].losses++;
      } else if (team1Score == team2Score) {
        teamColorsForHole[indices[0]] = Colors.lightGreen;
        teamColorsForHole[indices[1]] = Colors.lightGreen;
        teamColorsForHole[indices[2]] = Colors.green;
        teamColorsForHole[indices[3]] = Colors.green;
        playerStats[indices[0]].draws++;
        playerStats[indices[1]].draws++;
        playerStats[indices[2]].draws++;
        playerStats[indices[3]].draws++;
      } else {
        teamColorsForHole[indices[0]] = Colors.blue;
        teamColorsForHole[indices[1]] = Colors.blue;
        teamColorsForHole[indices[2]] = Colors.red;
        teamColorsForHole[indices[3]] = Colors.red;
        playerStats[indices[0]].losses++;
        playerStats[indices[1]].losses++;
        playerStats[indices[2]].wins++;
        playerStats[indices[3]].wins++;
      }
    } else if (teamType == 2) {
      // 3대1 팀
      List<int> team3Scores = [
        scores[indices[0]][widget.holeIndex],
        scores[indices[1]][widget.holeIndex],
        scores[indices[2]][widget.holeIndex]
      ];
      team3Scores.sort();
      int team3Score = team3Scores[0] + team3Scores[1];
      int team1Score = scores[indices[3]][widget.holeIndex] * 2;
      if (team3Score < team1Score) {
        teamColorsForHole[indices[0]] = Colors.red;
        teamColorsForHole[indices[1]] = Colors.red;
        teamColorsForHole[indices[2]] = Colors.red;
        teamColorsForHole[indices[3]] = Colors.blue;
        playerStats[indices[0]].wins++;
        playerStats[indices[1]].wins++;
        playerStats[indices[2]].wins++;
        playerStats[indices[3]].losses++;
      } else if (team3Score == team1Score) {
        teamColorsForHole[indices[0]] = Colors.green;
        teamColorsForHole[indices[1]] = Colors.green;
        teamColorsForHole[indices[2]] = Colors.green;
        teamColorsForHole[indices[3]] = Colors.lightGreen;
        playerStats[indices[0]].draws++;
        playerStats[indices[1]].draws++;
        playerStats[indices[2]].draws++;
        playerStats[indices[3]].draws++;
      } else {
        teamColorsForHole[indices[0]] = Colors.blue;
        teamColorsForHole[indices[1]] = Colors.blue;
        teamColorsForHole[indices[2]] = Colors.blue;
        teamColorsForHole[indices[3]] = Colors.red;
        playerStats[indices[0]].losses++;
        playerStats[indices[1]].losses++;
        playerStats[indices[2]].losses++;
        playerStats[indices[3]].wins++;
      }
    }

    teamColors[widget.holeIndex] = teamColorsForHole;
    for (int i = 0; i < 4; i++) {
      playerStats[i].totalStrokes += scores[i][widget.holeIndex];
    }
  }


  void navigateToNextHole(BuildContext context) {
    int nextHoleIndex = widget.holeIndex + 1;
    while (nextHoleIndex < 18 && holeCompleted[nextHoleIndex]) {
      nextHoleIndex++;
    }
    if (nextHoleIndex < 18) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HoleInput(holeIndex: nextHoleIndex)),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ScoreCard()),
      );
    }
  }
}
