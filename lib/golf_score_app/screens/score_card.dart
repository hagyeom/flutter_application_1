

import 'package:flutter/material.dart';
import 'hole_input.dart';

class ScoreCard extends StatelessWidget {
  final List<String> players = ['Player 1', 'Player 2', 'Player 3', 'Player 4'];

  int calculateTotalScore(List<int> scores) {
    return scores.fold(0, (sum, score) => sum + score);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스코어 카드'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'lib/assets/images/sparkles.png',
                  width: 80,
                  height: 100,
                ),
                Text(
                  '현재 순위',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('lib/assets/images/1등.png'),
                        Text(players[0]),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('lib/assets/images/2등.png'),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('lib/assets/images/3등.png'),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('lib/assets/images/4등.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Image.asset(
                  'lib/assets/images/sparkles.png',
                  width: 80,
                  height: 100,
                ),
                Text(
                  '스코어 카드',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            buildScoreTable(context, 0, 9),
            SizedBox(height: 20),
            buildScoreTable(context, 9, 18),
          ],
        ),
      ),
    );
  }

  Widget buildScoreTable(BuildContext context, int startHole, int endHole) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(),
          columnWidths: {
            0: FixedColumnWidth(80.0),
            for (int i = startHole + 1; i <= endHole; i++)
              i - startHole: FixedColumnWidth(64.0),
            endHole - startHole + 1: FixedColumnWidth(80.0),
          },
          children: [
            TableRow(
              children: [
                TableCell(child: Center(child: Text('Hole'))),
                for (int i = startHole + 1; i <= endHole; i++)
                  TableCell(child: Center(child: Text('$i'))),
                TableCell(child: Center(child: Text('Total'))),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: Center(child: Text('Par'))),
                for (int i = startHole; i < endHole; i++)
                  TableCell(child: Center(child: Text('${pars[i]}'))),
                TableCell(child: Center(child: Text(''))),
              ],
            ),
            for (int i = 0; i < players.length; i++)
              TableRow(
                children: [
                  TableCell(child: Center(child: Text(players[i]))),
                  for (int j = startHole; j < endHole; j++)
                    TableCell(
                      child: Container(
                        color: teamColors[j][i], // 팀 색상 적용
                        child: Center(
                          child: Text(
                            scores[i][j] == 0 ? '-' : scores[i][j].toString(),
                          ),
                        ),
                      ),
                    ),
                  TableCell(
                    child: Center(
                      child: Text(
                        '${calculateTotalScore(scores[i].sublist(startHole, endHole))}',
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
