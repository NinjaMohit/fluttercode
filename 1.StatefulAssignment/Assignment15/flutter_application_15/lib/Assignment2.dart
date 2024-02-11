import 'package:flutter/material.dart';

class Assignment2 extends StatefulWidget {
  const Assignment2({super.key});

  @override
  State<Assignment2> createState() => _App();
}

class _App extends State<Assignment2> {
  List<int> imageList = List.empty(growable: true);
  int count = 0;

  void increment() {
    setState(() {
      count++;
      imageList.add(count);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "App Bar",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            color: Colors.blue,
            height: 40,
            width: 200,
            child: Text("${imageList[index]}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
