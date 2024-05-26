/*
작성자: 윤하겸
작성일: 2024-05-22
*/
// 마이 페이지
// my_page_screen.dart
import 'package:flutter/material.dart';
import 'first_page.dart'; // FirstPage를 import

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key, required String userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마이 페이지'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // 추가 동작
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  const AssetImage('assets/profile_image.jpg'), // 프로필 이미지
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.edit, size: 16),
                        onPressed: () {
                          // 프로필 이미지 편집
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '홍길동',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // 경기하기 버튼 동작
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFCBD7B5), // 배경색
                minimumSize: const Size(double.infinity, 48), // 버튼 크기
              ),
              child: const Text('경기하기'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.history),
                    title: const Text('내 경기 기록'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // 내 경기 기록 페이지로 이동
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.group),
                    title: const Text('친구 목록'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // 친구 목록 페이지로 이동
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('개인정보 관리'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // 개인정보 관리 페이지로 이동
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('설정'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // 설정 페이지로 이동
                    },
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                _logout(context);
              },
              child: const Text('로그아웃', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const FirstPage()),
      (Route<dynamic> route) => false,
    );
  }
}
