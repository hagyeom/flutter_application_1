/*
작성자: 윤하겸
작성일: 2024-05-21
*/
// 회원가입 3
// 회원가입 2에서 이름과 전화번호를 입력받은 후, 다음 버튼을 누르면 넘어가는 페이지
import 'package:flutter/material.dart';

class SignUpEmailScreen extends StatelessWidget {
  const SignUpEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입 진행'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '로그인에 사용할 아이디를 입력해주세요.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: '아이디 (이메일) 입력',
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // 다음 단계로 이동하는 로직 추가
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightGreen, // 텍스트 색상
                minimumSize: const Size(double.infinity, 50), // 버튼 크기
              ),
              child: const Text('다음'),
            ),
          ],
        ),
      ),
    );
  }
}
