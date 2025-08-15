import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  const Answers({super.key, required this.text, required this.onTap});

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap(); // Fix: Actually calling the function
      },
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
