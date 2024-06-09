/*
작성자: 윤하겸
작성일: 2024-06-08
*/
// 선수 등록
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class RegisterPlayers extends StatefulWidget {
  const RegisterPlayers({super.key});

  @override
  State<RegisterPlayers> createState() => _RegisterPlayersState();
}

class _RegisterPlayersState extends State<RegisterPlayers> {
  final TextEditingController _player1Controller = TextEditingController();
  final TextEditingController _player2Controller = TextEditingController();
  final TextEditingController _player3Controller = TextEditingController();
  final TextEditingController _player4Controller = TextEditingController();

  final Logger _logger = Logger('RegisterPlayersLogger');

  void _savePlayerData() {
    // 여기서 선수 등록 정보를 저장합니다.
    final player1 = _player1Controller.text;
    final player2 = _player2Controller.text;
    final player3 = _player3Controller.text;
    final player4 = _player4Controller.text;

    // 등록 정보 저장 로직 추가
    _logger.info('Player 1: $player1');
    _logger.info('Player 2: $player2');
    _logger.info('Player 3: $player3');
    _logger.info('Player 4: $player4');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('선수 등록'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              '선수를 등록하세요.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            _buildPlayerInputField('선수1', _player1Controller),
            _buildPlayerInputField('선수2', _player2Controller),
            _buildPlayerInputField('선수3', _player3Controller),
            _buildPlayerInputField('선수4', _player4Controller),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // 친구 목록에서 불러오기 버튼 눌렀을 때의 동작
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
              ),
              child: const Text('친구 목록에서 불러오기'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _savePlayerData();
                // 등록 완료 버튼 눌렀을 때의 동작 추가
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              child: const Text('등록 완료'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerInputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            icon: const Icon(Icons.qr_code),
            onPressed: () {
              // QR 코드 버튼 눌렀을 때의 동작 추가
            },
          ),
        ],
      ),
    );
  }
}
