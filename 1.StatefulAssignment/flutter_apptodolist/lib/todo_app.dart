import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ToDoApp(),
    );
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  List list = [
    ["ECcentricOG", "Umesh Unde"],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To-do list",
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        separatorBuilder: (context, index) => const Divider(
          height: 2,
        ),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 330,
            child: Card(
              color: const Color.fromRGBO(250, 232, 232, 1),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/Group 42.png",
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            child: Text(
                              list[index][0],
                              style: GoogleFonts.quicksand(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            child: Text(
                              list[index][1],
                              style: GoogleFonts.quicksand(
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "19 Dec 2020",
                        style: GoogleFonts.quicksand(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.edit,
                          color: Color.fromRGBO(0, 139, 148, 1),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.remove,
                          color: Color.fromRGBO(0, 139, 148, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          list.add(
            ["Umesh", "Unde"],
          );
          setState(() {});
        },
        backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
        child: const Icon(Icons.add),
      ),
    );
  }
}
