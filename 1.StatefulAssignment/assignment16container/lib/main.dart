import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Assignment(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State<Assignment> createState() => _Assignment8State();
}

class _Assignment8State extends State<Assignment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          " container flexing ",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /* Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 100,
            width: 100,
            color: Colors.yellow,
            child: const Text("hello"),
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.lightBlue,
            margin: const EdgeInsets.all(20),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                border: Border.all(
              width: 5,
              color: Colors.red,
            )),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.elliptical(20, 30))),
          ),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                border: Border.all(
                  color: Colors.red,
                  width: 5,
                )),
          ),*/
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                border: Border.all(color: Colors.blue, width: 6),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.purple,
                      offset: Offset(10, 10),
                      blurRadius: 8),
                  BoxShadow(
                      color: Color.fromARGB(255, 39, 69, 176),
                      offset: Offset(10, 10),
                      blurRadius: 8),
                  BoxShadow(
                      color: Color.fromARGB(255, 176, 39, 76),
                      offset: Offset(10, 10),
                      blurRadius: 8)
                ]),
          ),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.blue, width: 5),
                gradient: const LinearGradient(
                    stops: [0.5, 0.5], colors: [Colors.red, Colors.green])),
          ),
        ],
      ),
    );
  }
}
