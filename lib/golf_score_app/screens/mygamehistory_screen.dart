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

    return MaterialApp(
      title: '골프앱',
      home: MyGameHistory(member: member, gameRecords: gameRecords),
    );
  }
}

class MyGameHistory extends StatefulWidget {
  final Member member;
  final List<WLDcard> gameRecords;
  List<WLDcard> _filteredGameRecords =[];

  MyGameHistory({Key? key, required this.member, required this.gameRecords}) : super(key: key);

  @override
  _MyGameHistoryState createState() => _MyGameHistoryState();
}

class _MyGameHistoryState extends State<MyGameHistory> {
  String? _selectedValue = '전체';
  bool _isAscending = true;

  @override
  void initState() {
    super.initState();
    _initializeFilteredGameRecords(_selectedValue); // 초기값 설정
  }

  void _toggleSortOrder() {
    setState(() {
      _isAscending = !_isAscending;
      widget._filteredGameRecords = widget._filteredGameRecords.reversed.toList();
    });
  }

  void _initializeFilteredGameRecords(String? selectedValue) {
    if (selectedValue == '전체') {
      setState(() {
        widget._filteredGameRecords = widget.gameRecords;
      });
    } else if (selectedValue == '승리한 경기') {
      setState(() {
        widget._filteredGameRecords = widget.gameRecords
            .where((record) => record.wins > record.losses && record.wins > record.draws)
            .toList();
      });
    } else if (selectedValue == '패배한 경기') {
      setState(() {
        widget._filteredGameRecords = widget.gameRecords
            .where((record) => record.losses > record.wins && record.losses > record.draws)
            .toList();
      });
    } else if (selectedValue == '무승부 경기') {
      setState(() {
        widget._filteredGameRecords = widget.gameRecords
            .where((record) => record.draws > record.wins && record.draws > record.losses)
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width - 20;
    final double size = (containerWidth - 3) / 4;

    void _onDropdownGameChanged(String? newValue) {
      if (newValue == '전체') {
        setState(() {
          widget._filteredGameRecords = widget.gameRecords;
        });
      } else if (newValue == '승리한 경기') {
        setState(() {
          widget._filteredGameRecords = widget.gameRecords
              .where((record) => record.wins > record.losses && record.wins > record.draws)
              .toList();
        });
      } else if (newValue == '패배한 경기') {
        setState(() {
          widget._filteredGameRecords = widget.gameRecords
              .where((record) => record.losses > record.wins && record.losses > record.draws)
              .toList();
        });
      } else if (newValue == '무승부 경기') {
        setState(() {
          widget._filteredGameRecords = widget.gameRecords
              .where((record) => record.draws > record.wins && record.draws > record.losses)
              .toList();
        });
      }
    }

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
                      _buildStatColumn('총 경기 홀 수', widget.member.totalHoles.toString(), Colors.black, size),
                      _buildDivider(),
                      _buildStatColumn('승리한 횟수', widget.member.wins.toString(), Colors.red, size),
                      _buildDivider(),
                      _buildStatColumn('패배한 횟수', widget.member.losses.toString(), Colors.blue, size),
                      _buildDivider(),
                      _buildStatColumn('무승부한 횟수', widget.member.draws.toString(), Colors.green, size),
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
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: DropdownGame(
                                  initialValue: _selectedValue, // 초기값 설정
                                  onChanged: (newValue) {
                                    _onDropdownGameChanged(newValue);
                                  },
                                ),
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
                                  '경기 ${widget.gameRecords.length}건',
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: TextButton.icon(
                                  onPressed: _toggleSortOrder,
                                  icon: Icon(_isAscending ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
                                  label: Text(
                                    _isAscending ? '오래된순' : '최신순',
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        for (var record in widget._filteredGameRecords)
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
  final ValueChanged<String?> onChanged;
  final String? initialValue; // 초기값 추가

  const DropdownGame({Key? key, required this.onChanged, this.initialValue}) : super(key: key);

  @override
  _DropdownGameState createState() => _DropdownGameState();
}

class _DropdownGameState extends State<DropdownGame> {
  late String? _selectedValue;

  final List<String> _dropdownItems = [
    '전체',
    '승리한 경기',
    '패배한 경기',
    '무승부 경기',
  ];

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue; // 초기값 설정
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedValue,
      hint: const Text('전체'),
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue; // 선택된 값 업데이트
          widget.onChanged(newValue); // 콜백 호출
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
