import 'package:flutter/material.dart';

class Assignment2 extends StatefulWidget {
  const Assignment2({super.key});

  @override
  State<Assignment2> createState() => _App();
}

class _App extends State<Assignment2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Padding and marging",
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          child: Container(
            color: Colors.amber,
            height: 200,
            width: 200,
            // alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            child: Image.network(
              "https://static-cse.canva.com/blob/825910/ComposeStunningImages6.jpg",
            ),
          ),
        ),
      ),
    );
  }
}
