//홀 값 입력받는 표(현재 모델사용 X 상태)

import 'package:flutter/material.dart';
import 'app_bar_public.dart';
import 'score_board.dart';

List<int> pars = List.filled(18, 4); // 파 값 임시 설정(초기값 전부 4)
List<List<int>> scores = List.generate(4, (_) => List.filled(18, 0));
List<bool> holeCompleted = List.filled(18, false); // 각 홀의 입력 완료 상태를 추적하는 리스트_이를 이용하여 중간부터 불러오거나 다음 홀로 넘어가는듯

class HoleInput extends StatefulWidget {
  final int holeIndex;

  HoleInput({required this.holeIndex});

  @override
  _HoleInputState createState() => _HoleInputState();
}

class _HoleInputState extends State<HoleInput> {
  final List<String> players = ['Player 1', 'Player 2', 'Player 3', 'Player 4'];//임시로 모신 선수 이름
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
                navigateToNextHole(context);
              },
              child: Text(widget.holeIndex < 17 ? '기록 하기' : '경기 종료'),
            ),
            ElevatedButton(
                onPressed: (){

                },
                child: Text('현황 보기')),
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
        MaterialPageRoute(builder: (context) => ScoreBoard()),
      );
    }
  }
}
