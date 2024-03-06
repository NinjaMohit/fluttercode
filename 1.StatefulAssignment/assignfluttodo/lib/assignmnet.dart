import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> alltext = ["Rohit", "Virat", "sudhir", "mohit"];
  List<Color> allcolor = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
    const Color.fromRGBO(250, 232, 232, 1),
  ];
//  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To-do List",
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
      ),
      body: ListView.builder(
        itemCount: alltext.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              padding: const EdgeInsets.only(
                  top: 2, left: 10, right: 10, bottom: 10),
              height: 113,
              width: 330,
              decoration: BoxDecoration(
                  color: allcolor[index % allcolor.length],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(width: 2)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        padding: const EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(2, 147, 172, 1),
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                        child: Image.asset(
                          "assets/Group 42.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Lorem Ipsum is simply setting industry. ",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                              overflow: TextOverflow.visible,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        "10-July-2023",
                        style: TextStyle(fontSize: 10),
                      ),
                      Spacer(),
                      Icon(Icons.edit_outlined),
                      Icon(Icons.delete_outline_rounded),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
