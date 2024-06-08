/*
작성자: 윤하겸
작성일: 2024-06-07
*/
// 경기 시작 전 페이지
// 골프장의 각 홀의 파 값을 입력받음
// 이전 경기 기록이 있을 시 경기 기록 잔류 경고창을 띄움
import 'package:flutter/material.dart';
import 'register_players.dart';

class BeforeTheGameStarts extends StatefulWidget {
  const BeforeTheGameStarts({super.key});

  @override
  BeforeTheGameStartsState createState() => BeforeTheGameStartsState();
}

class BeforeTheGameStartsState extends State<BeforeTheGameStarts> {
  final List<TextEditingController> _controllers =
      List.generate(18, (index) => TextEditingController());

  void _showPreviousGameRecordAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: const Text("이전 경기 기록이 남아있습니다.\n이어 하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "예",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "아니요",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // 이전 기록이 있으면 경고창 띄우기
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _showPreviousGameRecordAlert());
  }

  Widget _buildParInputRow(int start, int end) {
    return Row(
      children: List.generate(end - start + 1, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              controller: _controllers[start + index - 1],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildHoleRow(int start, int end) {
    return Row(
      children: List.generate(end - start + 1, (index) {
        return Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            color: Colors.lightGreen[200],
            child: Text(
              "${start + index}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Icon(Icons.home),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("골프장의 각 홀의 파 값을 입력하세요."),
            const SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHoleRow(1, 3),
                    _buildParInputRow(1, 3),
                    _buildHoleRow(4, 6),
                    _buildParInputRow(4, 6),
                    _buildHoleRow(7, 9),
                    _buildParInputRow(7, 9),
                    const SizedBox(height: 8.0),
                    _buildHoleRow(10, 12),
                    _buildParInputRow(10, 12),
                    _buildHoleRow(13, 15),
                    _buildParInputRow(13, 15),
                    _buildHoleRow(16, 18),
                    _buildParInputRow(16, 18),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPlayers(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              child: const Text("입력 완료"),
            ),
          ],
        ),
      ),
    );
  }
}
