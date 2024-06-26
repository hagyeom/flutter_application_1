// sign_up_detail.screen.dart
// 회원가입페이지 2
// 회원가입을 위한 이름과 전화번호를 입력받는 페이지
// sign_up_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sign_up_email_screen.dart';

class SignUpDetailScreen extends StatefulWidget {
  const SignUpDetailScreen({Key? key});

  @override
  _SignUpDetailScreenState createState() => _SignUpDetailScreenState();
}

class _SignUpDetailScreenState extends State<SignUpDetailScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    nameController.addListener(_checkIfFieldsAreFilled);
    phoneController.addListener(_checkIfFieldsAreFilled);
  }

  void _checkIfFieldsAreFilled() {
    setState(() {
      _isButtonEnabled = nameController.text.isNotEmpty && phoneController.text.isNotEmpty;
    });
  }

  Future<void> _saveNameAndPhone(String name, String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setString('userPhone', phone);
  }

  void _onNextButtonPressed() async {
    if (_isButtonEnabled) {
      await _saveNameAndPhone(nameController.text, phoneController.text);

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUpEmailScreen(),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: _isButtonEnabled ? _onNextButtonPressed : null,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: _isButtonEnabled ? Color(0xFFB9CA98) : Colors.grey, // 텍스트 색상
                minimumSize: const Size(double.infinity, 56), // 버튼 크기
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('다음'),
            ),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
