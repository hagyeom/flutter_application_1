import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpCompleteScreen extends StatelessWidget {
  final String memberCode;

  const SignUpCompleteScreen({Key? key, required this.memberCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _saveUserData(); // Save user data when completing sign up
    final double screenWidth = MediaQuery.of(context).size.width;
    final double imageWidth = screenWidth - 300;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false,
          );
        },
        child: Container(
          color: const Color(0xFFBFD98F), // Background color
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/golfimage.jpg',
                  width: imageWidth,
                ),
                const SizedBox(height: 24),
                const Text(
                  '회원가입을 축하합니다',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  '즐거운 골프 스포츠를 즐기세요!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('memberCode', memberCode);
  }
}
