import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            height: 120,
            width: 120,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(2, 147, 172, 1),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
