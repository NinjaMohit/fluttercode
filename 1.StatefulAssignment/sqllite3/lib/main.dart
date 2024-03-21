import 'package:flutter/material.dart';
import 'package:sqllite3/controller.dart';
import 'package:sqllite3/secodnscreen.dart';
import 'package:sqllite3/database.dart';

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
  Future<void> initialize() async {
    print("In initialize ");
    await databaseCreate();
    //List<ToDoModelClass> data = await getData();
    todoList = await getData();
    setState(() {});
    print(
        "   -------------------------length of todolist-------------------------");
    print(todoList.length);
    print(await getData());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  void add() async {
    todoList.add(
      ModelClass(
        name: nameController.text.trim(),
        lastname: lastnameController.text.trim(),
        pass: passController.text.trim(),
      ),
    );

    print(todoList.length);
    insert(
      ModelClass(
        name: nameController.text.trim(),
        lastname: lastnameController.text.trim(),
        pass: passController.text.trim(),
      ),
    );
    print(await getData());
    clean();
  }

  void clean() {
    nameController.clear();
    lastnameController.clear();
    passController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: nameController,
            ),
            TextFormField(
              controller: lastnameController,
            ),
            TextFormField(
              controller: passController,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                add();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondScreen()));
              },
              child: const Text("login"),
            ),
          ],
        ),
      ),
    );
  }
}
