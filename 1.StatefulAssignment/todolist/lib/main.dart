import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  List<String> alltext = List.empty(growable: true);
  List<Color> allcolor = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
    const Color.fromRGBO(250, 232, 232, 1),
  ];
//  int index = 0;
  void update() {
    alltext.add("Mohit");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "To-do List",
            style: GoogleFonts.quicksand(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(2, 167, 177, 1)),
      body: ListView.separated(
        itemCount: alltext.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 155,
            child: Card(
              color: allcolor[index],
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 3,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: 15,
                                top: 16,
                                // bottom: 3,
                                right: 15,
                              ),
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Image.asset(
                                "assets/yourFirstImage.jpg",
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              child: Text(
                                alltext[index],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              child: Text(
                                "Simply dummy text of the printing ",
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "14 July 2020",
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
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Text("");
        },
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: update, child: const Text("Add")),
    );
  }
}
