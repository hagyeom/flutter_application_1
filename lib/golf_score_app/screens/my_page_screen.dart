import 'package:flutter/material.dart';

class MyPageScreen extends StatelessWidget {
  final String userName;

  const MyPageScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // 로그아웃 로직 추가
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile.jpg'), // 프로필 이미지 경로
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color(0xFFC5E1A5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // 경기하기 로직 추가
                },
                child: const Text('경기하기'),
              ),
              const SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 2,
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.local_taxi, color: Colors.blue),
                      title: const Text('골프장 예약'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // 골프장 예약 로직 추가
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.wb_sunny, color: Colors.orange),
                      title: const Text('오늘 날씨'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // 오늘 날씨 로직 추가
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.note, color: Colors.black),
                      title: const Text('내 경기 기록'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // 내 경기 기록 로직 추가
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.group, color: Colors.black),
                      title: const Text('친구 목록'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // 친구 목록 로직 추가
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.person, color: Colors.black),
                      title: const Text('개인정보 관리'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // 개인정보 관리 로직 추가
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.settings, color: Colors.black),
                      title: const Text('설정'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // 설정 로직 추가
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // 로그아웃 로직 추가
                  Navigator.pop(context);
                },
                child: const Text('로그아웃'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
