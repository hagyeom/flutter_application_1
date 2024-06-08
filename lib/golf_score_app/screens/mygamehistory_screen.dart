import 'package:flutter/material.dart';
import 'wld_card.dart';
import 'package:flutter_application_1/golf_score_app/models/member.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final member = Member(
      name: '홍길동',
      phoneNumber: '010-1234-5678',
      id: 'hong123@gmail.com',
      pw: 'password',
      memberCode: '0000',
      totalHoles: 18,
      wins: 5,
      losses: 10,
      draws: 3,
      friends: ['김철수', '봉미선', '신짱구'],
    );

    final List<WLDcard> gameRecords = [
      WLDcard(
        date: '2023-05-12',
        players : [
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
        date: '2023-05-15',
        players: [
          Player(name: 'Alice', wins: 3, holes: 72),
          Player(name: 'Bob', wins: 2, holes: 74),
          Player(name: 'Charlie', wins: 4, holes: 70),
          Player(name: 'Diana', wins: 1, holes: 76),
        ],
        wins: 10,
        losses: 2,
        draws: 1,
      ),
      WLDcard(
        date: '2023-05-16',
        players: [
          Player(name: 'Eve', wins: 5, holes: 68),
          Player(name: 'Frank', wins: 3, holes: 70),
          Player(name: 'Grace', wins: 4, holes: 72),
          Player(name: 'Heidi', wins: 2, holes: 74),
        ],
        wins: 12,
        losses: 3,
        draws: 0,
      ),
      // 추가 경기 기록...
    ];

    return MaterialApp(
      title: '골프앱',
      home: MyGameHistory(member: member, gameRecords: gameRecords),
    );
  }
}

class MyGameHistory extends StatelessWidget {
  final Member member;
  final List<WLDcard> gameRecords;

  const MyGameHistory({Key? key, required this.member, required this.gameRecords}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width - 20;
    final double size = (containerWidth - 3) / 4;

    return Scaffold(
      appBar: AppBar(
        title: const Text('내 경기 기록'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: const Color(0xFFEFEFEE),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: containerWidth,
                height: 100,
                color: Colors.white,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildStatColumn('총 경기 홀 수', member.totalHoles.toString(), Colors.black, size),
                      _buildDivider(),
                      _buildStatColumn('승리한 횟수', member.wins.toString(), Colors.red, size),
                      _buildDivider(),
                      _buildStatColumn('패배한 횟수', member.losses.toString(), Colors.blue, size),
                      _buildDivider(),
                      _buildStatColumn('무승부한 횟수', member.draws.toString(), Colors.green, size),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Divider(
                color: Color(0xFF888888),
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Container(
                  width: containerWidth,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: DropdownGame(),
                              ),
                              const SizedBox(width: 12),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: DropdownDate(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  '경기 ${gameRecords.length}건',
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: TextButton.icon(
                                  onPressed: () {
                                    // Add your onPressed logic here
                                  },
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  label: const Text(
                                    '최신순',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        for (var record in gameRecords)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: WLDcard(
                              date: record.date,
                              wins: record.wins,
                              losses: record.losses,
                              draws: record.draws,
                              players: record.players,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, String value, Color color, double width) {
    return Container(
    width: width,
      height: 100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
            Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 50,
      color: const Color(0xFFCACACA),
      margin: const EdgeInsets.symmetric(vertical: 25),
    );
  }
}

class DropdownGame extends StatefulWidget {
  const DropdownGame({Key? key}) : super(key: key);

  @override
  _DropdownGameState createState() => _DropdownGameState();
}

class _DropdownGameState extends State<DropdownGame> {
  String? _selectedValue;

  final List<String> _dropdownItems = [
    '전체',
    '승리한 경기',
    '패배한 경기',
    '무승부 경기',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedValue,
      hint: const Text('전체'),
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
        });
      },
      items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class DropdownDate extends StatefulWidget {
  const DropdownDate({Key? key}) : super(key: key);

  @override
  _DropdownDateState createState() => _DropdownDateState();
}

class _DropdownDateState extends State<DropdownDate> {
  String? _selectedValue;

  final List<String> _dropdownItems = [
    '기간 전체',
    '1주일 이내',
    '1달 이내',
    '1년 이내',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedValue,
      hint: const Text('기간 전체'),
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
        });
      },
      items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
