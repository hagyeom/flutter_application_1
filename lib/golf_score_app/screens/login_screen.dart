// login_screen.dart
// 로그인 페이지
// 로그인 문제 수정
import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/screens/my_page_screen.dart';
import 'find_id_screen.dart';
import 'sign_up_screen.dart'; // SignUpScreen을 import
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoginFailed = false;
  bool _isObscured = true;
  final double sizenum = 40; //아이콘 크기 변수

  Future<void> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('userEmail');
    String? storedPassword = prefs.getString('password');

    if (emailController.text == storedEmail && passwordController.text == storedPassword) {
      setState(() {
        isLoginFailed = false;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('로그인 성공'),
          content: const Text('로그인이 정상적으로 완료되었습니다.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // 로그인 성공 시 이동할 페이지로 네비게이트
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyPageScreen(
                      userName: '', // 필요한 경우 사용자 이름을 전달
                    ),
                  ),
                );
              },
              child: const Text('확인'),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        isLoginFailed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // 비밀번호 찾기 화면에서 클릭하면 로그인 화면으로 이동
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Text(
                    '로그인',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: '아이디',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: passwordController,
                    obscureText: _isObscured,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: '비밀번호',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off,),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (isLoginFailed)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '아이디 및 비밀번호를 잘못 입력하셨습니다. 확인해주세요.',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB9CA98),
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      '로그인하기',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()),
                          );
                        },
                        style:
                        TextButton.styleFrom(foregroundColor: Colors.white),
                        child: const Text('회원가입하기'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FindIdScreen()),
                          );
                        },
                        style:
                        TextButton.styleFrom(foregroundColor: Colors.white),
                        child: const Text('아이디/비밀번호 찾기'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Text('or', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: SizedBox(
                          width: sizenum,
                          height: sizenum,
                          child: Image.asset('assets/naver.png'),
                        ),
                        onPressed: () {
                          // 네이버 로그인 기능 추가
                        },
                      ),
                      IconButton(
                        icon: SizedBox(
                          width: sizenum,
                          height: sizenum,
                          child: Image.asset('assets/kakao.png'),
                        ),
                        onPressed: () {
                          // 카카오톡 로그인 기능 추가
                        },
                      ),
                      IconButton(
                        icon: SizedBox(
                          width: sizenum,
                          height: sizenum,
                          child: Image.asset('assets/google.png'),
                        ),
                        onPressed: () {
                          // 구글 로그인 기능 추가
                        },
                      ),
                      IconButton(
                        icon: SizedBox(
                          width: sizenum,
                          height: sizenum,
                          child: Image.asset('assets/facebook.png'),
                        ),
                        onPressed: () {
                          // 페이스북 로그인 기능 추가
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
