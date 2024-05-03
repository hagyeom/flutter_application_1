// 회원가입
/*
아직 미기능되었지만 추가되어야 할 기능들:
1. 플레이어 등록 폼: 사용자가 새로운 플레이어의 이름을 입력할 수 있는 폼
2. 플레이어 추가 버튼: 사용자가 플레이어 등록 폼에 
이름을 입력한 후에는 플레이어를 추가할 수 있는 버튼
3. 등록된 플레이어 목록: 등록된 모든 플레이어의 목록을 표시. 
이 목록에는 플레이어의 이름, 총 타수, 총 승리 횟수 등의 정보가 포함되어야 함
4. 플레이어 삭제 기능: 사용자가 등록된 플레이어를 삭제할 수 있는 기능
5. 뒤로 가기 버튼: 이전 화면으로 돌아갈 수 있는 버튼
*/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/player.dart';

class PlayerRegistrationScreen extends StatefulWidget {
  const PlayerRegistrationScreen({super.key});

  @override
  PlayerRegistrationScreenState createState() =>
      PlayerRegistrationScreenState();
}

class PlayerRegistrationScreenState extends State<PlayerRegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  List<Player> players = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원 가입'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: '이름'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty) {
                  setState(() {
                    players.add(Player(name: _nameController.text));
                    _nameController.clear();
                  });
                }
              },
              child: const Text('추가'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, players);
              },
              child: const Text('완료'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
