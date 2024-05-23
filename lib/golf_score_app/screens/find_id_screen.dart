/*
작성자: 윤하겸
작성일: 2024-05-23
*/
// 아이디 찾기
// 아이디 찾기 버튼 누를 시 '사용하신 아이디는' 팝업창을 띄움
import 'package:flutter/material.dart';

class FindIdScreen extends StatefulWidget {
  const FindIdScreen({super.key});

  @override
  FindIdScreenState createState() => FindIdScreenState();
}

class FindIdScreenState extends State<FindIdScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _findId() {
    // 실제 아이디 찾기 로직 추가
    // 임시로 사용자 아이디를 설정
    String userId = 'jkim@tu.ac.kr';

    showIdDialog(context, userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('아이디 찾기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '회원 정보에 입력한 본인 정보로\n아이디를 찾습니다.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text('1. 사용하신 이름을 입력해주세요.'),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: '이름 입력',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('2. 사용하신 전화번호를 입력해주세요.'),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                hintText: '전화번호 입력 ( - 제외 )',
              ),
            ),
            const SizedBox(height: 24.0),
            Center(
              child: ElevatedButton(
                onPressed: _findId,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCBD7B5),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text('아이디 찾기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showIdDialog(BuildContext context, String userId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          contentPadding: const EdgeInsets.all(24.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                '사용하신 아이디는',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                userId,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCBD7B5),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text('확인'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
