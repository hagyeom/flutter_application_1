// 비밀번호 찾기
// 비밀번호 찾기 버튼 누르면 버튼 밑에 회원정보와 해당되는 비밀번호가 뜸
// 그거를 누르면 로그인 페이지로 이동
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart'; // 로그인 화면 import

class FindPasswordScreen extends StatefulWidget {
  const FindPasswordScreen({Key? key}) : super(key: key);

  @override
  _FindPasswordScreenState createState() => _FindPasswordScreenState();
}

class _FindPasswordScreenState extends State<FindPasswordScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool _isButtonEnabled = false;
  String? _foundPassword;

  @override
  void initState() {
    super.initState();
    nameController.addListener(_checkIfFieldsAreFilled);
    phoneController.addListener(_checkIfFieldsAreFilled);
    emailController.addListener(_checkIfFieldsAreFilled);
  }

  void _checkIfFieldsAreFilled() {
    setState(() {
      _isButtonEnabled =
          nameController.text.isNotEmpty &&
              phoneController.text.isNotEmpty &&
              emailController.text.isNotEmpty;
    });
  }

  Future<void> _findPassword() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedName = prefs.getString('userName');
    final String? storedPhone = prefs.getString('userPhone');
    final String? storedEmail = prefs.getString('userEmail');
    final String? storedPassword = prefs.getString('password');

    if (storedName == nameController.text &&
        storedPhone == phoneController.text &&
        storedEmail == emailController.text) {
      setState(() {
        _foundPassword = storedPassword;
      });
    } else {
      setState(() {
        _foundPassword = null;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('오류'),
          content: const Text(
              '비밀번호를 찾을 수 없습니다. 잘못 입력하신 부분이 없는지 확인해주세요.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('예'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('비밀번호 찾기'),
      ),
      body: GestureDetector(
        onTap: () {
          if (_foundPassword != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '회원 정보에 입력한 본인 정보로 비밀번호를 찾습니다.',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                '1. 사용하신 이름을 입력해주세요.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: '이름 입력',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '2. 사용하신 전화번호을 입력해주세요.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: '전화번호 입력 ( - 제외 )',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '3. 사용하신 아이디(이메일)을 입력해주세요.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: '아이디 (이메일) 입력',
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _isButtonEnabled ? _findPassword : null,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: _isButtonEnabled ? const Color(0xFFB9CA98) : Colors.grey,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('비밀번호 찾기'),
              ),
              if (_foundPassword != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    '당신의 비밀번호는 $_foundPassword 입니다. \n(로그인 화면으로 넘어가기를 원하신다면 여기를 클릭해주세요)',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
