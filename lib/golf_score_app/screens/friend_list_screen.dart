import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/models/member.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '골프앱',
      home: FriendList(),
    );
  }
}

class FriendList extends StatefulWidget {
  const FriendList({super.key});

  @override
  _FriendList createState() => _FriendList();
}

class _FriendList extends State<FriendList> {
  final List<Member> members = [
    Member(
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
    ),
    Member(
      name: '김철수',
      phoneNumber: '01011111111',
      id: 'kim123@gmail.com',
      pw: 'password1',
      memberCode: '0001',
      totalHoles: 18,
      wins: 10,
      losses: 3,
      draws: 5,
      friends: ['봉미선', '신짱구', '신형만', '홍길동'],
    ),
    Member(
      name: '거북이',
      phoneNumber: '01022222222',
      id: 'gu123@gmail.com',
      pw: 'password2',
      memberCode: '0002',
      totalHoles: 36,
      wins: 25,
      losses: 6,
      draws: 5,
      friends: ['두루미', '신형만', '홍길동'],
    ),
    Member(
      name: '두루미',
      phoneNumber: '01033333333',
      id: 'du123@gmail.com',
      pw: 'password3',
      memberCode: '0003',
      totalHoles: 18,
      wins: 10,
      losses: 3,
      draws: 5,
      friends: ['거북이', '봉미선', '신형만', '홍길동'],
    ),
    Member(
      name: '봉미선',
      phoneNumber: '01044444444',
      id: 'bong123@gmail.com',
      pw: 'password4',
      memberCode: '0004',
      totalHoles: 72,
      wins: 50,
      losses: 10,
      draws: 12,
      friends: ['김철수', '두루미', '신형만', '신짱구', '홍길동'],
    ),
    Member(
      name: '신짱구',
      phoneNumber: '01055555555',
      id: 'sin123@gmail.com',
      pw: 'password5',
      memberCode: '0005',
      totalHoles: 36,
      wins: 20,
      losses: 9,
      draws: 7,
      friends: ['김철수', '봉미선', '홍길동', '신형만'],
    ),
    Member(
      name: '신형만',
      phoneNumber: '01066666666',
      id: 'Sin123@gmail.com',
      pw: 'password6',
      memberCode: '0006',
      totalHoles: 36,
      wins: 16,
      losses: 11,
      draws: 9,
      friends: ['거북이', '김철수', '두루미', '봉미선', '신짱구', '홍길동'],
    ),
    //추가 기록 ...
  ];

  List<String> favorites = [];

  //이름 정렬 함수
  void _sortFriendsList() {
    favorites.sort((a, b) => a.compareTo(b));
    members.forEach((member) {
      member.friends.sort((a, b) => a.compareTo(b));
    });
  }

  //즐겨찾기 추가 또는 해제
  void _toggleFavorite(String friend) {
    setState(() {
      if (favorites.contains(friend)) {
        favorites.remove(friend);
      } else {
        favorites.add(friend);
        _sortFriendsList();
      }
    });
  }

  //친구 목록 추가
  TextEditingController _codeController = TextEditingController();
  void _performActionWithCode(String code) {
    Member? foundMember;
    for (var member in members) {
      if (member.memberCode == code) {
        foundMember = member;
        break;
      }
    }
    // 회원을 찾은 경우
    if (foundMember != null) {
      setState(() {
        // 현재 사용자의 친구 목록에 찾은 회원 이름 추가 지금은 홍길동이라서...
        members.firstWhere((m) => m.name == '홍길동').friends.add(foundMember!.name);
        _sortFriendsList();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${foundMember.name}가 친구 목록에 추가되었습니다.'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      // 회원을 찾지 못한 경우
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('회원을 찾을 수 없습니다.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  //경기 신청
  void _sendGameRequest(String friendName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$friendName님에게 경기를 신청했습니다.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEEEE),
      appBar: AppBar(
        title: const Text('친구 목록'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 50,
              color: const Color(0xFFEFEEEE),
              child: const Stack(
                children: <Widget>[
                  Positioned(
                    top: 20,
                    left: 28,
                    child: Text(
                      '즐겨찾기',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: favorites.map((favoriteName) {
                Member favoriteMember =
                members.firstWhere((m) => m.name == favoriteName);
                return GestureDetector(
                  onLongPress: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          child: Wrap(
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.star),
                                title: const Text('즐겨찾기 해제'),
                                onTap: () {
                                  _toggleFavorite(favoriteMember.name);
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.delete),
                                title: const Text('삭제'),
                                onTap: () {
                                  setState(() {
                                    favorites.remove(favoriteMember.name);
                                    members.firstWhere((m) => m.name == '홍길동').friends.remove(favoriteMember.name);
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.sports),
                                title: const Text('경기 신청'),
                                onTap: () {
                                  _sendGameRequest(favoriteMember.name);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    color: Colors.white,
                    height: 106,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 28),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            color: Color(0xFFC8C2FA),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 26),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              favoriteMember.name,
                              style: const TextStyle(fontSize: 25),
                            ),
                            Text(
                              '${favoriteMember.totalHoles}홀 ${favoriteMember.wins}승 ${favoriteMember.losses}패 ${favoriteMember.draws}무',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFF515151),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            Container(
              height: 50,
              color: const Color(0xFFEFEEEE),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 20,
                    left: 28,
                    child: Row(
                      children: [
                        const Text(
                          '친구',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '${members.where((member) => member.name == '홍길동').expand((member) => member.friends).length}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: members.where((member) => member.name == '홍길동').expand((member) => member.friends).map((friendName) {
                Member friendMember = members.firstWhere((m) => m.name == friendName);
                return GestureDetector(
                  onLongPress: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          child: Wrap(
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.star),
                                title: Text(
                                    favorites.contains(friendMember.name)
                                        ? '즐겨찾기 해제'
                                        : '즐겨찾기에 추가'),
                                onTap: () {
                                  _toggleFavorite(friendMember.name);
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.delete),
                                title: const Text('삭제'),
                                onTap: () {
                                  setState(() {
                                    members.firstWhere((m) => m.name == '홍길동').friends.remove(friendMember.name);
                                    favorites.remove(friendMember.name);
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.sports),
                                title: const Text('경기 신청'),
                                onTap: () {
                                  _sendGameRequest(friendMember.name);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    color: Colors.white,
                    height: 106,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 28),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            color: Color(0xFFC8C2FA),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 26),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              friendMember.name,
                              style: const TextStyle(fontSize: 25),
                            ),
                            Text(
                              '${friendMember.totalHoles}홀 ${friendMember
                                  .wins}승 ${friendMember.losses}패 ${friendMember
                                  .draws}무',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFF515151),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            Container(
              height: 100,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Color(0xFFEFEEEE),
              ),
              child: Container(
                margin: EdgeInsets.only(right: 21),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text(
                            '회원 코드 입력',
                            style: TextStyle(fontSize: 20),
                          ),
                          content: TextField(
                            controller: _codeController,
                            decoration: InputDecoration(
                              hintText: '회원 코드를 입력하세요',
                              hintStyle: TextStyle(fontSize: 15),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('취소'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                String code = _codeController.text;
                                _performActionWithCode(code);
                                Navigator.of(context).pop();
                              },
                              child: Text('확인'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                    backgroundColor: Color(0xFFB8B8B8),
                  ),
                  child: Container(
                    width: 52,
                    height: 52,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}