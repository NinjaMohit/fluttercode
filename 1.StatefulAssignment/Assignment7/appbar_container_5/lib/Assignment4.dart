import 'package:flutter/material.dart';

class Assignment4 extends StatelessWidget {
  const Assignment4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Project"),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.yellow,
              height: 200,
              width: 300,
            ),
            Container(
              color: Colors.blue,
              height: 200,
              width: 300,
            ),
          ],
        ),
      ),
    );
  }
}
