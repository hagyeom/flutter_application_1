/*
작성자: 윤하겸
작성일: 2024-05-21
*/
// 회원가입 3
// 회원가입 2에서 이름과 전화번호를 입력받은 후, 다음 버튼을 누르면 넘어가는 페이지
// 로그인에 사용할 아이디(이메일)을 입력받는 페이지
// 아이디를 입력받기 전까지는 다음 버튼이 비활성화됨
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
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkIfEmailIsFilled);
  }

  void _checkIfEmailIsFilled() {
    setState(() {
      _isButtonEnabled = emailController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _onNextButtonPressed() {
    if (_isButtonEnabled) {
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
    }
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
        title: const Text('회원가입 진행'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LinearProgressIndicator(
              value: 0.5,
            ),
            const SizedBox(height: 16.0),
            const Text(
              '로그인에 사용할 이메일을 입력해주세요.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: '이메일 입력',
                hintText: '이메일 주소',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: _isButtonEnabled ? _onNextButtonPressed : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  _isButtonEnabled ? const Color(0xFFCBD7B5) : Colors.grey,
                  minimumSize: const Size(double.infinity, 48),
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
