/*
홀 게임을 진행하는 화면을 구성하는데 필요한 UI를 생성하고, 
플레이어의 이름과 점수를 표시하여 사용자에게 보여줌 
*/
/*
아직 미구현된 기능들:
1. 게임 진행 및 결과 입력 기능
2. 편 분배 및 이긴 팀 표시 기능
3. 플레이어 정보 수정 및 삭제 기능
*/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/player.dart';

class HoleGameScreen extends StatelessWidget {
  const HoleGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Player> players =
        ModalRoute.of(context)?.settings.arguments as List<Player>;

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
            Expanded(
              child: ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(players[index].name),
                    subtitle: Text('점수: ${players[index].score}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
