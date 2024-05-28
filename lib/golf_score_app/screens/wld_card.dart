import 'package:flutter/material.dart';

class WLDcard extends StatelessWidget {
  final String title;
  final String value;
  final Color bordercolor;

  const WLDcard({
    required this.title,
    required this.value,
    required this.bordercolor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-80,
      height: 227,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: bordercolor, // 테두리 색상 설정
          width: 2, // 테두리 두께 설정
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '승패무카드',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
