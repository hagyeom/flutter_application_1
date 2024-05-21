/*
작성자: 윤하겸
작성일: 2024-05-21
*/
// 로그인 페이지
import 'package:flutter/material.dart';
import 'sign_up_screen.dart'; // SignUpScreen import 추가

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              '로그인',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: '아이디',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: '비밀번호',
                      suffixIcon: Icon(Icons.visibility),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xFFC5E1A5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // 로그인 로직 추가
                    },
                    child: const Text('로그인하기'),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          // 회원가입 페이지로 이동
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text('회원가입하기'),
                      ),
                      TextButton(
                        onPressed: () {
                          // 아이디/비밀번호 찾기 로직 추가
                        },
                        child: const Text('아이디/비밀번호 찾기'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text('or'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset('assets/naver.png'),
                        iconSize: 40,
                        onPressed: () {
                          // 네이버 로그인 로직 추가
                        },
                      ),
                      IconButton(
                        icon: Image.asset('assets/kakao.png'),
                        iconSize: 40,
                        onPressed: () {
                          // 카카오 로그인 로직 추가
                        },
                      ),
                      IconButton(
                        icon: Image.asset('assets/google.png'),
                        iconSize: 40,
                        onPressed: () {
                          // 구글 로그인 로직 추가
                        },
                      ),
                      IconButton(
                        icon: Image.asset('assets/facebook.png'),
                        iconSize: 40,
                        onPressed: () {
                          // 페이스북 로그인 로직 추가
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
