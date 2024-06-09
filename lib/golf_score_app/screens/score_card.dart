//스코어 카드(현황보기) 보여주는 곳

import 'package:flutter/material.dart';
import 'hole_input.dart';


class ScoreCardPage extends StatelessWidget {
  final List<String> players = ['Player 1', 'Player 2', 'Player 3', 'Player 4'];

  int calculateTotalScore(List<int> scores) {
    return scores.fold(0, (sum, score) => sum + score);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score Card'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
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
            for (int i = startHole + 1; i <= endHole; i++) i - startHole: FixedColumnWidth(64.0),
            endHole - startHole + 1: FixedColumnWidth(80.0),
          },
          children: [
            TableRow(
              children: [
                TableCell(child: Center(child: Text('Hole'))),
                for (int i = startHole + 1; i <= endHole; i++) TableCell(child: Center(child: Text('$i'))),
                TableCell(child: Center(child: Text('Total'))),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: Center(child: Text('Par'))),
                for (int i = startHole; i < endHole; i++) TableCell(child: Center(child: Text('${pars[i]}'))),
                TableCell(child: Center(child: Text(''))),
              ],
            ),
            for (int i = 0; i < 4; i++)
              TableRow(
                children: [
                  TableCell(child: Center(child: Text(players[i]))),
                  for (int j = startHole; j < endHole; j++)
                    TableCell(
                      child: Center(
                        child: Text(
                          scores[i][j] == 0 ? '-' : scores[i][j].toString(),
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
