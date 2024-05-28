import 'package:flutter/material.dart';
import 'wld_card.dart';
import 'package:flutter_application_1/golf_score_app/models/member.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Member 객체를 생성합니다.
    final member = Member(
      name: 'John Doe',
      phoneNumber: '123-456-7890',
      id: 'john_doe',
      pw: 'password',
      memberCode: 'M001',
      totalHoles: 18,
      wins: 5,
      losses: 10,
      draws: 3,
    );

    return MaterialApp(
      title: '골프앱',
      home: MyGameHistory(member: member),
    );
  }
}

class MyGameHistory extends StatelessWidget {
  final Member member;

  const MyGameHistory({Key? key, required this.member}) : super(key: key);

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
                      crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10), // Add padding to the left
                          child: DropdownGame(),
                        ),
                        const SizedBox(height: 20),
                        WLDcard(
                          title: '총 경기 홀 수',
                          value: '18',
                          bordercolor: Color(0xFFFFB3B3),
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
