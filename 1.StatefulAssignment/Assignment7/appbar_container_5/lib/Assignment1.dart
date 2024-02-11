import 'package:flutter/material.dart';

class Assignment1 extends StatelessWidget {
  const Assignment1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Project"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        actions: const [
          Icon(Icons.favorite),
          Icon(Icons.feedback),
        ],
      ),
    );
  }
}
