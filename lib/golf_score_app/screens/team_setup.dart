//팀을 어떻게 나눌것인가요 페이지

import 'package:flutter/material.dart';
import 'hole_input.dart';
import 'app_bar_public.dart';


int setmod = 0;//직접 설정 = 0, 랜덤 설정 = 1


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '팀 설정',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TeamSetup(),
    );
  }
}

class TeamSetup extends StatelessWidget {
  const TeamSetup({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면 크기 가져오기
    final Size screenSize = MediaQuery.of(context).size;
    final double buttonWidth =
        screenSize.width * 0.735; // 너비 계산: 360 * 0.735 = 265
    final double buttonHeight =
        screenSize.height * 0.15625; // 높이 계산: 800 * 0.15625 = 125
// 글자 크기 계산
    final double textSize = buttonHeight * 0.4; // 버튼 높이의 40%를 글자 크기로 설정
    final double StextSize = buttonHeight * 0.2;
    return Scaffold(
      appBar: MakeAppBar.build(context),
      body: Container(
        color: Color(0xFFEFEFEE),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '팀을 어떻게 나누실건가요?',
                style: TextStyle(fontSize: StextSize),
              ),
              Text(
                '개인전, 2:2 3:1 로 나누어집니다.',
                style: TextStyle(fontSize: StextSize),
              ),
              SizedBox(height: 50), // 버튼 간의 간격 추가

              // 랜덤 설정 버튼
              Container(
                width: buttonWidth, // 버튼의 가로 길이 설정
                height: buttonHeight, // 버튼의 세로 길이 설정
                child: ElevatedButton(
                  onPressed: () {
                    setmod = 1;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HoleInput(holeIndex: 0,),),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Color(0xFFDBE4CB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5, // 버튼 배경색: #B9CA98
                  ),
                  child: Text(
                    '랜덤 설정',
                    style: TextStyle(fontSize: textSize, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 50), // 버튼 간의 간격 추가

              // 직접 설정 버튼
              Container(
                width: buttonWidth, // 버튼의 가로 길이 설정
                height: buttonHeight, // 버튼의 세로 길이 설정
                child: ElevatedButton(
                  onPressed: () {
                    setmod = 0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HoleInput(holeIndex: 0,),),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Color(0xFFB9CA98),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5, // 버튼 배경색: 녹색
                  ),
                  child: Text(
                    '직접 설정',
                    style: TextStyle(fontSize: textSize, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
