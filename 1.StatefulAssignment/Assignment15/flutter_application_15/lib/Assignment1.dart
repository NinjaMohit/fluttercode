import 'package:flutter/material.dart';

class Assignment1 extends StatefulWidget {
  const Assignment1({super.key});

  @override
  State<Assignment1> createState() => _ListApp();
}

class _ListApp extends State<Assignment1> {
  List<int> numbers = List.empty(growable: true);
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "List App",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(5),
            height: 40,
            width: 150,
            color: Colors.blue,
            child: Text(
              "${numbers[index]}",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
            numbers.add(count);
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
