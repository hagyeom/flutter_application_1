// find_id_screen.dart
// 이름 및 전화번호 입력 후 아이디 찾기 버튼 누르면 그에 해당하는 아이디가 버튼 밑에 뜸
// 팝업창 형식이 아님...
// 아이디 찾았다는 메시지를 클릭하면 find_password_screen.dart로 이동
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'find_password_screen.dart'; // Import FindPasswordScreen

class FindIdScreen extends StatefulWidget {
  const FindIdScreen({Key? key}) : super(key: key);

  @override
  _FindIdScreenState createState() => _FindIdScreenState();
}

class _FindIdScreenState extends State<FindIdScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool _isButtonEnabled = false;
  String? _foundEmail;
  bool _showPasswordButton = false;

  @override
  void initState() {
    super.initState();
    nameController.addListener(_checkIfFieldsAreFilled);
    phoneController.addListener(_checkIfFieldsAreFilled);
  }

  void _checkIfFieldsAreFilled() {
    setState(() {
      _isButtonEnabled = nameController.text.isNotEmpty && phoneController.text.isNotEmpty;
    });
  }

  Future<void> _findEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedName = prefs.getString('userName');
    final String? storedPhone = prefs.getString('userPhone');
    final String? storedEmail = prefs.getString('userEmail');

    if (storedName == nameController.text && storedPhone == phoneController.text) {
      setState(() {
        _foundEmail = storedEmail;
        _showPasswordButton = true; // Show the button to proceed to FindPasswordScreen
      });
    } else {
      setState(() {
        _foundEmail = null;
        _showPasswordButton = false; // Hide the button if no matching ID is found
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('오류'),
          content: const Text('아이디를 찾을 수 없습니다. 잘못 입력하신 부분이 없는지 확인해주세요.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('예'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('아이디 찾기'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          // Navigate to FindPasswordScreen when the button is shown and the screen is tapped
          if (_showPasswordButton) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FindPasswordScreen()),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '회원정보에 입력한 본인 정보로 아이디를 찾습니다.',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                '1. 사용하신 이름을 입력해주세요.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: '이름 입력',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '2. 사용하신 전화번호을 입력해주세요.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: '전화번호 입력 ( - 제외 )',
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _isButtonEnabled ? _findEmail : null,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: _isButtonEnabled ? const Color(0xFFB9CA98) : Colors.grey,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('아이디 찾기'),
              ),
              const SizedBox(height: 16),
              if (_foundEmail != null && _showPasswordButton)
                Text(
                  '당신의 아이디는 $_foundEmail 입니다. \n(비빌번호를 찾기를 원하신다면 여기를 클릭해주세요)',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
