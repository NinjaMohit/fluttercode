import 'package:flutter/material.dart';

class Assignment3 extends StatefulWidget {
  const Assignment3({super.key});

  @override
  State<Assignment3> createState() => _ToggleApp();
}

class _ToggleApp extends State<Assignment3> {
  bool button1 = false;
  bool button2 = false;

  void toggleChange1() {
    setState(() {
      if (button1 == false) {
        button1 = true;
      } else {
        button1 = false;
      }
    });
  }

  void toggleChange2() {
    setState(() {
      if (button2 == false) {
        button2 = true;
      } else {
        button2 = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toggle App"),
        backgroundColor: Colors.blue,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 200,
                color: button1 ? Colors.red : Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: toggleChange1,
                child: const Text("Button 1"),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 200,
                color: button2 ? Colors.black : Colors.red,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: toggleChange2,
                child: const Text("Button 2"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
