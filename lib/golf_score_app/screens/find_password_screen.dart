/*
작성자: 윤하겸
작성일: 2024-05-24
*/
// 비밀번호 찾기
// 비밀번호 찾기 버튼을 눌렀을 때 팝업 창을 띄우고
// 팝업 창을 닫을 수 있도록 구현
// 팝업 창을 닫은 후 로그인 화면 (login_screen.dart)으로 돌아감
import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/screens/login_screen.dart';

class FindPasswordScreen extends StatelessWidget {
  const FindPasswordScreen({super.key});

  void _showPasswordDialog(BuildContext context, String password) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '사용하신 비밀번호는',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                password,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCBD7B5),
                ),
                child: const Text('확인'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('비밀번호 찾기'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '회원 정보에 입력한 본인 정보로 비밀번호를 찾습니다.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: '사용하신 이름을 입력해주세요.',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: '사용하신 전화번호를 입력해주세요.',
                hintText: '전화번호 입력 ( - 제외 )',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: '사용하신 아이디(이메일)을 입력해주세요.',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // 예시: 실제로는 서버와 통신하여 비밀번호를 가져와야 합니다.
                String password = "password123";
                _showPasswordDialog(context, password);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFCBD7B5),
              ),
              child: const Center(child: Text('비밀번호 찾기')),
            ),
          ),
        ],
      ),
    );
  }
}
