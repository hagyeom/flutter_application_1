/*
작성자: 윤하겸
작성일: 2024-06-07
*/
// 경기 시작 전 페이지
// 골프장의 각 홀의 파 값을 입력받음
// 이전 경기 기록이 있을 시 경기 기록 잔류 경고창을 띄움
import 'package:flutter/material.dart';

class BeforeTheGameStarts extends StatefulWidget {
  const BeforeTheGameStarts({super.key});

  @override
  State<BeforeTheGameStarts> createState() => _BeforeTheGameStartsState();
}

class _BeforeTheGameStartsState extends State<BeforeTheGameStarts> {
  bool hasPreviousGameRecord = true; // 실제 데이터에 맞게 설정

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (hasPreviousGameRecord) {
        _showPreviousGameRecordWarning();
      }
    });
  }

  void _showPreviousGameRecordWarning() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                '이전 경기 기록이 남아있습니다.\n이어서 하시겠습니까?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // '예' 버튼을 눌렀을 때의 동작 추가
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('예'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // '아니요' 버튼을 눌렀을 때의 동작 추가
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('아니요'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('경기 시작 전'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              '골프장의 각 홀의 파값을 입력하세요.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            Table(
              border: TableBorder.all(color: Colors.green),
              children: [
                _buildTableRow(['홀', '1', '2', '3']),
                _buildTableRow(['파', '', '', '']),
                _buildTableRow(['홀', '4', '5', '6']),
                _buildTableRow(['파', '', '', '']),
                _buildTableRow(['홀', '7', '8', '9']),
                _buildTableRow(['파', '', '', '']),
                _buildTableRow(['OUT', '', '', '']),
                _buildTableRow(['홀', '10', '11', '12']),
                _buildTableRow(['파', '', '', '']),
                _buildTableRow(['홀', '13', '14', '15']),
                _buildTableRow(['파', '', '', '']),
                _buildTableRow(['홀', '16', '17', '18']),
                _buildTableRow(['파', '', '', '']),
                _buildTableRow(['IN', '', '', '']),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // 입력 완료 버튼 눌렀을 때의 동작
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              child: const Text('입력 완료'),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(List<String> cells) {
    return TableRow(
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cell,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16.0),
          ),
        );
      }).toList(),
    );
  }
}
