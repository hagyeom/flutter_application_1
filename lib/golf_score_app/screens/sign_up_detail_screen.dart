/*
작성자: 윤하겸
작성일: 2024-05-21
*/
// 회원가입 2
// 회원가입 1에서 모두 동의를 누른 뒤 다음 버튼을 누르면 넘어가는 페이지
// sign_up_detail_screen.dart
// sign_up_detail_screen.dart
import 'package:flutter/material.dart';
import 'sign_up_email_screen.dart';

class SignUpDetailScreen extends StatelessWidget {
  const SignUpDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

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
              '서비스 이용 및 본인확인을 위한 정보를 입력해주세요.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: '이름 입력',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: '전화번호 입력 ( - 제외 )',
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpEmailScreen(
                      name: nameController.text,
                      phoneNumber: phoneController.text,
                    ),
                  ),
                );
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
