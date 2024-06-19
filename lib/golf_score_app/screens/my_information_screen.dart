import 'package:flutter/material.dart';
import 'package:flutter_application_1/golf_score_app/models/member.dart'; // Member 클래스 import
import 'package:shared_preferences/shared_preferences.dart';

//void main() => runApp(const MyApp());

/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '골프앱',
      home: MyInformation(),
    );
  }
}*/

class MyInformation extends StatefulWidget {
  const MyInformation({super.key, required this.userName});

  final String userName;

  @override
  _MyInformationState createState() => _MyInformationState();
}

class _MyInformationState extends State<MyInformation> {
  bool _isEditingEnabled = false;
  late TextEditingController _nameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _idController;
  late TextEditingController _pwController;
  Member? member;
  String name = '';

  @override
  void initState() {
    super.initState();
    _loadMemberData();
  }

  Future<void> _loadMemberData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      member = Member(
        name: prefs.getString('name') ?? '홍길동',
        phoneNumber: prefs.getString('phoneNumber') ?? '01000000000',
        id: prefs.getString('id') ?? 'hong123@gmail.com',
        pw: prefs.getString('pw') ?? 'password',
        memberCode: '0000',
        totalHoles: 90,
        wins: 39,
        losses: 34,
        draws: 17,
        friends: ['김철수', '거북이', '두루미', '봉미선', '신짱구', '신형만'],
      );
      _nameController = TextEditingController(text: member!.name);
      _phoneNumberController = TextEditingController(text: member!.phoneNumber);
      _idController = TextEditingController(text: member!.id);
      _pwController = TextEditingController(text: member!.pw);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _idController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('개인정보 관리'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 132,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFC8C2FA),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 27),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '프로필 사진',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 158,
                        height: 41,
                        child: ElevatedButton(
                          onPressed: () {
                            // 갤러리에 들어가....?
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFEFEEEE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 5),
                              Icon(Icons.photo_album, color: Colors.black),
                              SizedBox(width: 9),
                              Text(
                                '편집하기',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabeledTextField('이름', _nameController, enabled: _isEditingEnabled),
                  _buildLabeledTextField('전화번호', _phoneNumberController, enabled: _isEditingEnabled),
                  _buildLabeledTextField('아이디', _idController, enabled: _isEditingEnabled),
                  _buildLabeledTextField('비밀번호', _pwController, enabled: _isEditingEnabled),
                  // 회원코드는 편집이 불가능하도록 설정
                  _buildLabeledTextField('회원코드', TextEditingController(text: '0000'), enabled: false),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 72,
                color: Color(0xFFEFEEEE),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isEditingEnabled = !_isEditingEnabled;
                            if (!_isEditingEnabled) {
                              _updateMemberData();
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFEFEEEE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          elevation: 0,
                          minimumSize: Size(double.infinity, 72),
                        ),
                        child: Text(
                          _isEditingEnabled ? '수정 완료' : '정보 수정',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _deleteMemberData();
                          Navigator.pop(context); // 이전 화면으로 돌아가기
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFEFEEEE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          elevation: 0,
                          minimumSize: Size(double.infinity, 72),
                        ),
                        child: Text(
                          '계정 탈퇴',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabeledTextField(String label, TextEditingController controller, {required bool enabled}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: 80,
        child: Row(
          children: [
            SizedBox(width: 25),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: Container(
                      height: 40,
                      child: TextField(
                        enabled: enabled,
                        controller: controller,
                        style: TextStyle(
                          fontSize: 20,
                          color: enabled ? Color(0xFF888888) : Colors.black,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 25),
          ],
        ),
      ),
    );
  }

  void _updateMemberData() {
    print('회원 정보가 업데이트되었습니다.');
  }

  void _deleteMemberData() {
    setState(() {
      member = null;
    });
    print('회원 정보가 삭제되었습니다.');
  }
}
