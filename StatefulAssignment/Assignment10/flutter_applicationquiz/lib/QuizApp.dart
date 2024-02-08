import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _MainApp();
}

class _MainApp extends State<QuizApp> {
  int counter = 1;

  void countincreament() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz App",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Question : ",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              Text("$counter/10"),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
          const SizedBox(
            child: Text("What is your Fav Player ?"),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Rohit Sharma",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Virat Kohli",
                style: TextStyle(color: Colors.blue),
              )),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {},
              child: const Text(
                "MS Dhoni",
                style: TextStyle(color: Colors.blue),
              )),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Yuvraj Sing",
                style: TextStyle(color: Colors.blue),
              )),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
          onPressed: countincreament,
          child: const Icon(Icons.arrow_circle_down_rounded)),
    );
  }
}
