/*
작성자: 윤하겸
작성일: 2024-05-21
*/
// 로그인 페이지
// login_screen.dart
// 네이버, 카카오톡, 구글, 페이스북 아이콘 크기 조절
import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/screens/my_page_screen.dart';
import 'find_id_screen.dart';
import 'sign_up_screen.dart'; // SignUpScreen을 import
import 'package:flutter_application_1/golf_score_app/models/user_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoginFailed = false;
  final double sizenum = 40; //아이콘 크기 변수

  void _login() {
    UserRepository userRepository = UserRepository();
    var user = userRepository.authenticate(
      emailController.text,
      passwordController.text,
    );

    if (user != null) {
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
                          userName: '',
                        )));
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
      body: Container(
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
                SizedBox(height: 20),
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
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: '비밀번호',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {
                        // 비밀번호 표시/숨김 기능 추가
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
                      style: TextStyle(color: Colors.red, fontSize: 15,),
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
                  child: const Text('로그인하기', style: TextStyle(color: Colors.black),),
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
                              builder: (context) => const FindIDScreen()),
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
<<<<<<< HEAD
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                        icon: Image.asset('assets/naver.png'),
                        onPressed: () {
                          // 네이버 로그인 기능 추가
                        },
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                        icon: Image.asset('assets/kakao.png'),
                        onPressed: () {
                          // 카카오톡 로그인 기능 추가
                        },
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                        icon: Image.asset('assets/google.png'),
                        onPressed: () {
                          // 구글 로그인 기능 추가
                        },
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                        icon: Image.asset('assets/facebook.png'),
                        onPressed: () {
                          // 페이스북 로그인 기능 추가
                        },
                      ),
=======
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
>>>>>>> 889185a8c0f6e4e8e051dd47d4eded2f9b2c85ef
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
