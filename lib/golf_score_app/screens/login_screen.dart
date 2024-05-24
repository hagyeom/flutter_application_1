/*
작성자: 윤하겸
작성일: 2024-05-21
*/
// 로그인 페이지
import 'package:flutter/material.dart';
import 'find_id_screen.dart';
import 'sign_up_screen.dart'; // SignUpScreen을 import

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '로그인',
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 16.0),
                TextField(
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
                const SizedBox(height: 8.0),
                const Text(
                  '아이디 및 비밀번호를 잘못 입력하셨습니다. 확인해주세요.',
                  style: TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // 로그인 버튼 눌렀을 때의 동작
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCBD7B5),
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: const Text('로그인하기'),
                ),
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
                const SizedBox(height: 16.0),
                const Text('or', style: TextStyle(color: Colors.white)),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Image.asset('assets/naver.png'),
                      onPressed: () {
                        // 네이버 로그인 기능 추가
                      },
                    ),
                    IconButton(
                      icon: Image.asset('assets/kakao.png'),
                      onPressed: () {
                        // 카카오톡 로그인 기능 추가
                      },
                    ),
                    IconButton(
                      icon: Image.asset('assets/google.png'),
                      onPressed: () {
                        // 구글 로그인 기능 추가
                      },
                    ),
                    IconButton(
                      icon: Image.asset('assets/facebook.png'),
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
    );
  }
}
