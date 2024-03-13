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
    );
  }
}

class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State<Assignment> createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  List mynames = ["mohit", "sudhir", "ayu", "umesh"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: mynames.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  leading: Text('${index + 1}'),
                  title: Text(mynames[index]),
                  subtitle: const Text('number'),
                  trailing: const Icon(Icons.add),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(
                      "img.png",
                    ),
                    backgroundColor: Color.fromARGB(255, 27, 178, 0),
                  ),
                )
              ],
            );
          }),
    );
  }
}
