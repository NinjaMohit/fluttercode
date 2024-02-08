import 'package:flutter/material.dart';
import 'package:flutter_application_15/Assignment.dart';
import 'package:flutter_application_15/Assignment1.dart';
import 'package:flutter_application_15/Assignment2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Assignment2(),
    );
  }
}
