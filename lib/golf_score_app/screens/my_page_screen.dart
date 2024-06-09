/*
작성자: 윤하겸
작성일: 2024-05-22
*/
// 마이 페이지
// my_page_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key, required String userName});

  @override
  MyPageScreenState createState() => MyPageScreenState();
}

class MyPageScreenState extends State<MyPageScreen> {
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? '회원';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: const AssetImage('assets/profile_image.jpg'),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Edit profile picture functionality
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _userName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Start game functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
              ),
              child: const Text('경기하기'),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('내 경기 기록'),
              onTap: () {
                // Navigate to game records screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('친구 목록'),
              onTap: () {
                // Navigate to friends list screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('개인정보 관리'),
              onTap: () {
                // Navigate to personal information management screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('설정'),
              onTap: () {
                // Navigate to settings screen
              },
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                // Log out functionality
              },
              child: const Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
