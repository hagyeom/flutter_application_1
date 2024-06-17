// my_page_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'before_the_game_starts.dart';
import 'mygamehistory_screen.dart';
import 'friend_list_screen.dart';
import 'my_information_screen.dart';
import 'setting.dart';
import 'login_screen.dart'; // 로그인 화면 import
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

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userName');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
    );
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
      totalHoles: 90,
      wins: 39,
      losses: 34,
      draws: 17,
      friends: ['김철수', '거북이', '두루미', '봉미선', '신짱구', '신형만'],
    );

    final List<WLDcard> gameRecords = [
      WLDcard(
        date: '2024-06-10',
        players: [
          Player(name: '홍길동', wins: 16, holes: 66),
          Player(name: '신형만', wins: 2, holes: 80),
          Player(name: '거북이', wins: 0, holes: 96),
          Player(name: '두루미', wins: 0, holes: 100),
        ],
        wins: 16,
        losses: 2,
        draws: 0,
      ),
      WLDcard(
        date: '2024-06-01',
        players: [
          Player(name: '홍길동', wins: 12, holes: 70),
          Player(name: '봉미선', wins: 2, holes: 78),
          Player(name: '신짱구', wins: 2, holes: 78),
          Player(name: '신형만', wins: 0, holes: 90),
        ],
        wins: 12,
        losses: 2,
        draws: 4,
      ),
      WLDcard(
        date: '2024-05-30',
        players: [
          Player(name: '홍길동', wins: 0, holes: 85),
          Player(name: '김철수', wins: 6, holes: 75),
          Player(name: '신짱구', wins: 9, holes: 68),
          Player(name: '봉미선', wins: 1, holes: 80),
        ],
        wins: 0,
        losses: 16,
        draws: 2,
      ),
      WLDcard(
        date: '2024-03-27',
        players: [
          Player(name: '홍길동', wins: 3, holes: 80),
          Player(name: '김철수', wins: 5, holes: 74),
          Player(name: '신짱구', wins: 1, holes: 85),
          Player(name: '신형만', wins: 1, holes: 85),
        ],
        wins: 3,
        losses: 5,
        draws: 10,
      ),
      WLDcard(
        date: '2024-01-20',
        players: [
          Player(name: '홍길동', wins: 8, holes: 75),
          Player(name: '두루미', wins: 10, holes: 72),
          Player(name: '봉미선', wins: 5, holes: 80),
          Player(name: '신형만', wins: 5, holes: 88),
        ],
        wins: 8,
        losses: 9,
        draws: 1,
      ),
      // 추가 경기 기록...
    ];

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
              onPressed: _logout,
              child: const Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
