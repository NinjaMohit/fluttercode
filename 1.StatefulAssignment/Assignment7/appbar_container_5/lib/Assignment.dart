import 'package:flutter/material.dart';

class Assignment extends StatelessWidget {
  const Assignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Project"),
        backgroundColor: Colors.yellow,
        actions: const [
          Icon(Icons.favorite),
          Icon(Icons.feedback),
        ],
      ),
    );
  }
}
