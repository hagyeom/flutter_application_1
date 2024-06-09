/*
작성자: 윤하겸
작성일: 2024-05-21
*/
// 회원가입 1
import 'package:flutter/material.dart';
import 'sign_up_detail_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  bool isAllChecked = false;
  bool isRequiredChecked1 = false;
  bool isRequiredChecked2 = false;
  bool isOptionalChecked1 = false;
  bool isOptionalChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '이용약관에 동의해주세요.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: const Text('모두 동의(선택 정보 포함)'),
              value: isAllChecked,
              onChanged: (bool? value) {
                setState(() {
                  isAllChecked = value!;
                  isRequiredChecked1 = value;
                  isRequiredChecked2 = value;
                  isOptionalChecked1 = value;
                  isOptionalChecked2 = value;
                });
              },
            ),
            const Divider(),
            CheckboxListTile(
              title: const Text('[필수] 이용약관 동의'),
              value: isRequiredChecked1,
              onChanged: (bool? value) {
                setState(() {
                  isRequiredChecked1 = value!;
                  if (!value) isAllChecked = false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('[필수] 개인정보 처리방침 동의'),
              value: isRequiredChecked2,
              onChanged: (bool? value) {
                setState(() {
                  isRequiredChecked2 = value!;
                  if (!value) isAllChecked = false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('[선택] 광고성 정보 수신 동의'),
              value: isOptionalChecked1,
              onChanged: (bool? value) {
                setState(() {
                  isOptionalChecked1 = value!;
                  if (!value) isAllChecked = false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('[선택] 마케팅 활용 동의'),
              value: isOptionalChecked2,
              onChanged: (bool? value) {
                setState(() {
                  isOptionalChecked2 = value!;
                  if (!value) isAllChecked = false;
                });
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (isRequiredChecked1 && isRequiredChecked2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpDetailScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('필수 항목에 동의해주세요.')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFFB9CA98), // 텍스트 색상
                minimumSize: const Size(double.infinity, 56), // 버튼 크기
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('다음'),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
