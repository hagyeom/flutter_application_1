

import 'package:flutter/material.dart';
import 'hole_input.dart';

class ScoreCard extends StatelessWidget {
  final List<String> players = ['홍길동', '김철수', '신형만', '거북이'];

  int calculateTotalScore(List<int> scores) {
    return scores.fold(0, (sum, score) => sum + score);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스코어 카드'),
      ),
      backgroundColor: Color(0xFFEFEEEE), // 앱 내부 배경색 설정
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/sparkles.png',
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
                // 패딩 속성
                padding: EdgeInsets.all(25),
                // 마진 속성
                margin: EdgeInsets.all(25),
                // 컨테이너 꾸미기
                decoration: BoxDecoration(
                  // 컨테이너의 border 모양
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color:Colors.white,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('등수     이름    승  무  패  점수',
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/1등.png'),
                        SizedBox(width: 10),
                        Text(players[0]),
                        SizedBox(width: 10),
                        Text('5'),
                        SizedBox(width: 12),
                        Text('5'),
                        SizedBox(width: 12),
                        Text('5'),
                        SizedBox(width: 16),
                        Text('5'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/2등.png'),
                        SizedBox(width: 10),
                        Text(players[1]),
                        SizedBox(width: 10),
                        Text('5'),
                        SizedBox(width: 12),
                        Text('5'),
                        SizedBox(width: 12),
                        Text('5'),
                        SizedBox(width: 16),
                        Text('5'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/3등.png'),
                        SizedBox(width: 10),
                        Text(players[2]),
                        SizedBox(width: 10),
                        Text('5'),
                        SizedBox(width: 12),
                        Text('5'),
                        SizedBox(width: 12),
                        Text('5'),
                        SizedBox(width: 16),
                        Text('5'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/4등.png'),
                        SizedBox(width: 10),
                        Text(players[3]),
                        SizedBox(width: 10),
                        Text('5'),
                        SizedBox(width: 12),
                        Text('5'),
                        SizedBox(width: 12),
                        Text('5'),
                        SizedBox(width: 16),
                        Text('5'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Image.asset(
                  'assets/sparkles.png',
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
