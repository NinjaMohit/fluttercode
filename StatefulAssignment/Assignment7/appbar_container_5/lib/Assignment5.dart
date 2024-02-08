import 'package:flutter/material.dart';

class Assignment5 extends StatelessWidget {
  const Assignment5({super.key});

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
            Image.asset(
              'lib/assets/img1.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              'lib/assets/img4.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              'lib/assets/img3.png',
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
