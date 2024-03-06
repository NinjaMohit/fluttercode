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
            decoration: BoxDecoration(
              color: const Color.fromRGBO(2, 147, 172, 1),
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.red,
                  offset: Offset(10, 10),
                  blurRadius: 20,
                )
              ],
            ),
            child: Image.network(
                "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
          ),
        ),
      ),
    );
  }
}
