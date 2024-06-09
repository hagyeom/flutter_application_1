import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('board'),
      ),
      body: Center(
        child: Text('All holes completed!'),
      ),
    );
  }
}
