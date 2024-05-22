/*
작성자: 윤하겸
작성일: 2024-05-22
*/
// 아이디/비밀번호 찾기(아이디 찾기)
import 'package:flutter/material.dart';

class FindIdPasswordScreen extends StatefulWidget {
  const FindIdPasswordScreen({super.key});

  @override
  FindIdPasswordScreenState createState() => FindIdPasswordScreenState();
}

class FindIdPasswordScreenState extends State<FindIdPasswordScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('아이디/비밀번호 찾기'),
      ),
      body: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: '아이디 찾기'),
              Tab(text: '비밀번호 찾기'),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildFindIdTab(),
                _buildFindPasswordTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFindIdTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            '회원 정보에 입력한 본인 정보로\n아이디를 찾습니다.',
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 16.0),
          const Text('1. 사용하신 이름을 입력해주세요.'),
          const TextField(
            decoration: InputDecoration(
              hintText: '이름 입력',
            ),
          ),
          const SizedBox(height: 16.0),
          const Text('2. 사용하신 전화번호를 입력해주세요.'),
          const TextField(
            decoration: InputDecoration(
              hintText: '전화번호 입력 ( - 제외 )',
            ),
          ),
          const SizedBox(height: 24.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // 아이디 찾기 로직 추가
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFCBD7B5),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('아이디 찾기'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFindPasswordTab() {
    // 비밀번호 찾기 UI 구현
    return const Center(child: Text('비밀번호 찾기 기능 구현 예정'));
  }
}
