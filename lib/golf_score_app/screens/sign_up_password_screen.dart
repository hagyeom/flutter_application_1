// sign_up_password_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/models/member.dart';
import 'package:flutter_application_1/golf_score_app/models/user_repository.dart';
import 'package:flutter_application_1/golf_score_app/screens/sign_up_complete_screen.dart';
import 'package:flutter_application_1/golf_score_app/models/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPasswordScreen extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String email;

  const SignUpPasswordScreen({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.email,
  }) : super(key: key);

  @override
  SignUpPasswordScreenState createState() => SignUpPasswordScreenState();
}

class SignUpPasswordScreenState extends State<SignUpPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_checkIfPasswordsAreFilled);
    confirmPasswordController.addListener(_checkIfPasswordsAreFilled);
  }

  void _checkIfPasswordsAreFilled() {
    setState(() {
      _isButtonEnabled = passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty;
    });
  }

  void _completeSignUp() async {
    if (passwordController.text == confirmPasswordController.text) {
      String memberCode = generateMemberCode();

      Member newMember = Member(
        name: widget.name,
        phoneNumber: widget.phoneNumber,
        id: widget.email,
        pw: passwordController.text,
        memberCode: memberCode,
      );

      // Save the member using MemberRepository
      MemberRepository memberRepository = MemberRepository();
      memberRepository.addMember(newMember);

      // Save password to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('password', passwordController.text);

      // Navigate to the complete screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignUpCompleteScreen(memberCode: memberCode),
        ),
      );
    } else {
      // Show error if passwords do not match
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Passwords do not match'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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
          children: <Widget>[
            const LinearProgressIndicator(
                value: 0.75), // Progress indicator for the sign-up process
            const SizedBox(height: 16.0),
            const Text(
              '로그인에 사용할 비밀번호를 입력해주세요.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                labelText: '비밀번호 입력',
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                hintText: '영문 포함  숫자 포함  8~20자 내외',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: confirmPasswordController,
              obscureText: !isConfirmPasswordVisible,
              decoration: InputDecoration(
                labelText: '비밀번호 확인',
                suffixIcon: IconButton(
                  icon: Icon(
                    isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordVisible =
                      !isConfirmPasswordVisible;
                    });
                  },
                ),
                hintText: '비밀번호 일치',
              ),
            ),
            const SizedBox(height: 100),
            Center(
              child: ElevatedButton(
                onPressed: _isButtonEnabled ? _completeSignUp : null,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: _isButtonEnabled ? const Color(0xFFB9CA98) : Colors.grey,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
