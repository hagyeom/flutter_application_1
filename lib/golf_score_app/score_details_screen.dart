// 앱에서 18홀 결과를 확인하는 화면을 구성
// 일부 기능들 미구현
/*
아직 미구현이지만 들어가야 할 기능들:
1. 플레이어 정보 표시: 모든 플레이어의 이름, 
총 타수 및 총 승리 횟수를 나타내는 리스트나 테이블을 표시
2. 정렬 기능: 플레이어 리스트를 타수 또는 승리 횟수를 기준으로 정렬할 수 있는 기능
3. 상세 정보 표시: 각 플레이어의 이름을 클릭하면 해당 플레이어의 
홀별 결과를 자세히 확인할 수 있는 화면으로 이동
4. 뒤로 가기 버튼: 이전 화면으로 돌아갈 수 있는 버튼을 제공
*/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/player.dart';

class ScoreDetailsScreen extends StatelessWidget {
  const ScoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Player> players =
        ModalRoute.of(context)!.settings.arguments as List<Player>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('18홀 결과 확인'),
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          Player player = players[index];
          return ListTile(
            title: Text(player.name),
            subtitle: Text(
                '총 타수: ${player.totalStrokes}, 총 승리 횟수: ${player.totalWins}'),
          );
        },
      ),
    );
  }
}
