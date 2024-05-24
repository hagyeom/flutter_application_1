/*
작성일: 2024-05-24
작성일: 윤하겸
*/
// 비밀번호 찾기
import 'package:flutter/material.dart';

class FindPasswordScreen extends StatelessWidget {
  const FindPasswordScreen({super.key});

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
                // 비밀번호 찾기 로직 구현
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
