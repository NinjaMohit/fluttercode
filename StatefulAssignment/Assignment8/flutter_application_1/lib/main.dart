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
          appBar: AppBar(
              title: const Text("Padding and margin"),
              backgroundColor: Colors.deepPurple),
          body: Center(
            child: Container(
                color: Colors.blue,
                child: Container(
                  height: 250,
                  width: 250,
                  color: Colors.amber,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(30),
                  child: Image.network(
                      "https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg"),
                )),
          )),
    );
  }
}
