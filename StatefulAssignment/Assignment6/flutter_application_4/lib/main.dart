import 'package:flutter/material.dart';
import 'Assignment5.dart';
import 'Assignment.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Assignment(),
      debugShowCheckedModeBanner: false,
    );
  }
}
