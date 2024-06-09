//앱 바 공통사용
import 'package:flutter/material.dart';
import 'home_screen.dart'; // main.dart 파일에서 MyHomePage를 임포트하는 경우 필요

class MakeAppBar {
  static AppBar build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context); // 뒤로 가기 버튼 동작
        },
      ),
      centerTitle: true,
      title: IconButton(
        icon: Icon(Icons.home),
        onPressed: () {
          // 홈 버튼 동작 (예: 홈 화면으로 이동)
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false,
          );
        },
      ),
    );
  }
}
