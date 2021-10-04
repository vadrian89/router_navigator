import 'package:flutter/material.dart';

class SecondLevelScreen extends StatelessWidget {
  final String text;
  const SecondLevelScreen({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(text)),
      );
}
