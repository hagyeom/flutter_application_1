/*
작성자: 윤하겸
작성일: 2024-05-23
*/
// 아이디 찾기
// 아이디 찾기 버튼 누를 시 '사용하신 아이디는' 팝업창을 띄움
// find_id_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/models/user_repository.dart';
import 'package:flutter_application_1/golf_score_app/screens/find_password_screen.dart';

class FindIDScreen extends StatelessWidget {
  const FindIDScreen({super.key});

  void _showIDDialog(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '사용하신 아이디는',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                userId,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCBD7B5),
                ),
                child: const Text('확인'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final phoneNumberController = TextEditingController();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('아이디/비밀번호 찾기'),
          bottom: TabBar(
            onTap: (index) {
              if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FindPasswordScreen(),
                  ),
                );
              }
            },
            tabs: const [
              Tab(text: '아이디 찾기'),
              Tab(text: '비밀번호 찾기'),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '회원 정보에 입력한 본인 정보로 아이디를 찾습니다.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: '사용하신 이름을 입력해주세요.',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: phoneNumberController,
                decoration: const InputDecoration(
                  labelText: '사용하신 전화번호를 입력해주세요.',
                  hintText: '전화번호 입력 ( - 제외 )',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  String phoneNumber = phoneNumberController.text;

                  UserRepository userRepository = UserRepository();
                  var user = userRepository.findUserByNameAndPhoneNumber(name, phoneNumber);

                  if (user != null) {
                    _showIDDialog(context, user.email);
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: const Text('해당 정보로 등록된 아이디를 찾을 수 없습니다.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('확인'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCBD7B5),
                ),
                child: const Center(child: Text('아이디 찾기')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
