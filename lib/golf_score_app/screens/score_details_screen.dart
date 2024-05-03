// 18홀 결과 확인 화면
import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/models/player.dart';

class ScoreDetailsScreen extends StatelessWidget {
  final List<Player> players;

  const ScoreDetailsScreen({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('18홀 결과 확인'),
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          Player player = players[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '플레이어: ${player.name}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              for (int i = 0; i < player.holeResults.length; i++)
                ListTile(
                  title: Text('홀 ${player.holeResults[i].holeNumber}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('파: ${player.holeResults[i].par}'),
                      Text('스트로크: ${player.holeResults[i].strokes}'),
                      Text('홀 점수: ${player.holeResults[i].holeScore}'),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  // 각 홀의 스코어 계산 함수
  int calculateHoleScore(int par, int strokes) {
    int score = 0;

    // 파인 경우
    if (strokes == par) {
      score = 0;
    }
    // 버디
    else if (strokes == par - 1) {
      score = -1;
    }
    // 이글
    else if (strokes == par - 2) {
      score = -2;
    }
    // 알바트로스
    else if (par == 3 && strokes == 1) {
      score = -3;
    } else if (par == 4 && strokes == 2) {
      score = -3;
    } else if (par == 5 && strokes == 2) {
      score = -3;
    }
    // 보기
    else if (strokes == par + 1) {
      score = 1;
    }
    // 더블보기
    else if (strokes == par + 2) {
      score = 2;
    }
    // 트리플보기
    else if (strokes == par + 3) {
      score = 3;
    }
    // 쿼드러플보기
    else if (strokes == par + 4) {
      score = 4;
    }
    // 더블파
    else if (strokes == par * 2) {
      if (strokes == 6 && par == 3) {
        score = 3;
      } else if (strokes == 8 && par == 4) {
        score = 4;
      } else if (strokes == 10 && par == 5) {
        score = 5;
      }
    }

    return score;
  }
}
