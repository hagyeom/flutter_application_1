import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'before_the_game_starts.dart';
import 'mygamehistory_screen.dart';
import 'friend_list_screen.dart';
import 'my_information_screen.dart';
import 'setting.dart';
import 'package:flutter_application_1/golf_score_app/models/member.dart'; // Member 클래스 import
import 'package:flutter_application_1/golf_score_app/screens/wld_card.dart'; // WLDcard import

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key, required this.userName});

  final String userName;

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
    // 기본 Member 객체 생성
    final member = Member(
      name: '홍길동',
      phoneNumber: '01000000000',
      id: 'hong123@gmail.com',
      pw: 'password',
      memberCode: '0000',
      totalHoles: 18,
      wins: 5,
      losses: 10,
      draws: 3,
      friends: ['김철수', '거북이', '두루미', '봉미선', '신짱구', '신형만'],
    );

    // 빈 게임 기록 리스트 생성
    final List<WLDcard> gameRecords = [];

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BeforeTheGameStarts(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MyGameHistory(
                            gameRecords: gameRecords,
                            member: member,
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.group),
                    title: const Text('친구 목록'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FriendList(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('개인정보 관리'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyInformation(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('설정'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Setting(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
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
