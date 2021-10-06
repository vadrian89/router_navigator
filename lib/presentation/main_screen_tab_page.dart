import 'package:flutter/material.dart';

class MainScreenTabPage extends StatelessWidget {
  final Function() onBtnTap;
  final String text;

  const MainScreenTabPage({
    Key? key,
    required this.onBtnTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: onBtnTap, child: const Text("Push me")),
        ],
      );
}
