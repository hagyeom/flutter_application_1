/*
작성자: 윤하겸
작성일: 2024-05-21
*/
// 회원가입 3
// 회원가입 2에서 이름과 전화번호를 입력받은 후, 다음 버튼을 누르면 넘어가는 페이지
// sign_up_email_screen.dart
// sign_up_email_screen.dart
import 'package:flutter/material.dart';
import 'sign_up_password_screen.dart';

class SignUpEmailScreen extends StatefulWidget {
  final String name;
  final String phoneNumber;

  const SignUpEmailScreen(
      {super.key, required this.name, required this.phoneNumber});

  @override
  SignUpEmailScreenState createState() => SignUpEmailScreenState();
}

class SignUpEmailScreenState extends State<SignUpEmailScreen> {
  final TextEditingController emailController = TextEditingController();

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
        title: const Text('회원가입 진행'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const LinearProgressIndicator(
                value: 0.5), // Progress indicator for the sign-up process
            const SizedBox(height: 16.0),
            const Text(
              '로그인에 사용할 아이디를 입력해주세요.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: '아이디 (이메일) 입력',
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPasswordScreen(
                        name: widget.name,
                        phoneNumber: widget.phoneNumber,
                        email: emailController.text,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCBD7B5), // Background color
                  minimumSize:
                      const Size(double.infinity, 48), // Full width button
                ),
                child: const Text('다음'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
