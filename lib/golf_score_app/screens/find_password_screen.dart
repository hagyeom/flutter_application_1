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
          title: const Text('Error'),
          content: const Text(
              'No matching account found. Please check your details and try again.'),
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
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Password'),
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
                'Please enter your name, phone number, and email to find your password.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Enter your phone number (without -)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _isButtonEnabled ? _findPassword : null,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                  _isButtonEnabled ? Colors.lightGreen : Colors.grey,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Find Password'),
              ),
              if (_foundPassword != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Your password is: $_foundPassword',
                    style: const TextStyle(
                        fontSize: 16,
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
