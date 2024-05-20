import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/screens/my_page_screen.dart';

class GolfScoreScreen extends StatelessWidget {
  const GolfScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), // 배경화면 이미지 경로
            fit: BoxFit.cover, // 화면에 꽉 차게
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '로그인',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // 텍스트 색상을 하얀색으로 변경
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '아이디',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '비밀번호',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const MyPageScreen(userName: '홍길동'),
                      ),
                    );
                  },
                  child: const Text('로그인하기'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        // 회원가입 로직 추가
                      },
                      child: const Text(
                        '회원가입하기',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // 아이디/비밀번호 찾기 로직 추가
                      },
                      child: const Text(
                        '아이디/비밀번호 찾기',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'or',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('assets/naver.png'), // 네이버 아이콘 경로
                      iconSize: 40, // 아이콘 크기 조정
                      onPressed: () {
                        // 네이버 로그인 로직 추가
                      },
                    ),
                    IconButton(
                      icon: Image.asset('assets/kakao.png'), // 카카오톡 아이콘 경로
                      iconSize: 40, // 아이콘 크기 조정
                      onPressed: () {
                        // 카카오톡 로그인 로직 추가
                      },
                    ),
                    IconButton(
                      icon: Image.asset('assets/google.png'), // 구글 아이콘 경로
                      iconSize: 40, // 아이콘 크기 조정
                      onPressed: () {
                        // 구글 로그인 로직 추가
                      },
                    ),
                    IconButton(
                      icon: Image.asset('assets/facebook.png'), // 페이스북 아이콘 경로
                      iconSize: 40, // 아이콘 크기 조정
                      onPressed: () {
                        // 페이스북 로그인 로직 추가
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
