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
          title: const Text('Error'),
          content: const Text('No matching ID found. Please check your details and try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
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
        title: const Text('Find ID'),
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
                'Please enter your name and phone number to find your ID.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Enter your phone number (without -)',
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _isButtonEnabled ? _findEmail : null,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: _isButtonEnabled ? Colors.lightGreen : Colors.grey,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Find ID'),
              ),
              const SizedBox(height: 16),
              if (_foundEmail != null && _showPasswordButton)
                Text(
                  'Your ID is: $_foundEmail',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
