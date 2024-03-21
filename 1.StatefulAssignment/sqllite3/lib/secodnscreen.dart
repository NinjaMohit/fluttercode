import 'package:flutter/material.dart';
import 'package:sqllite3/controller.dart';
import 'package:sqllite3/database.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 120,
                  width: 80,
                  color: Colors.lightBlue,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        todoList[index].name,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        todoList[index].lastname,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        todoList[index].pass,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            );
          }),
    );
  }
}
