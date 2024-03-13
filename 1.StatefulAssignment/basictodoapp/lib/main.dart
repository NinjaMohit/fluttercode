import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

class TodoListModelClass {
  final String? title;
  final String? description;
  final String? date;

  TodoListModelClass(
      {required this.title, required this.description, required this.date});
}

class _TodoListState extends State<TodoList> {
  List<TodoListModelClass> alltext = [
    TodoListModelClass(
      title: "Mohit",
      description: "Pawar",
      date: "22-Jul-2023",
    ),
  ];
  List<Color> allcolor = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
    const Color.fromRGBO(250, 232, 232, 1),
  ];
//  int index = 0;

  TextEditingController allDate = TextEditingController();
  TextEditingController allTitle = TextEditingController();
  TextEditingController allDescription = TextEditingController();

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
              padding:
                  const EdgeInsets.only(top: 3, left: 10, right: 10, bottom: 4),
              height: 130,
              width: 330,
              decoration: BoxDecoration(
                color: allcolor[index % allcolor.length],
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                border: Border.all(width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        height: 52,
                        width: 52,
                        padding: const EdgeInsets.only(
                            top: 15, left: 15, right: 15, bottom: 15),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        /*   border: Border.all(
                            width: 1,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                          ),
                        )*/
                        /*child: Image.network(
                          "https://cdn-icons-png.flaticon.com/512/1160/1160358.png",
                          height: 2,
                          width: 2,
                        ),*/
                        child: Image.asset(
                          "assets/img.png",
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
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 1,
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
                  Row(
                    children: [
                      Text(
                        "10-July-2023",
                        style: TextStyle(fontSize: 10),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit_outlined,
                              color: Colors.blue,
                            ),
                            style: ButtonStyle(
                                fixedSize:
                                    MaterialStatePropertyAll(Size(2, 2))),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          IconButton(
                            onPressed: () {
                              // Delete item
                              setState(() {
                                alltext.removeAt(index);
                              });
                            },
                            style: ButtonStyle(
                                fixedSize:
                                    MaterialStatePropertyAll(Size(2, 2))),
                            icon: Icon(
                              Icons.delete_outline_rounded,
                              color: Colors.blue,
                            ),
                          ),
                        ],
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
          showModalBottomSheet(
            isScrollControlled: true,
            enableDrag: false,
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Create Text",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    // height: 350,
                    //width: 360,

                    child: Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Title"),
                          const SizedBox(
                            height: 7,
                          ),
                          GestureDetector(
                            child: TextField(
                              controller: allTitle,
                              decoration: InputDecoration(
                                hintText: "Enter a title",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          const Text("Description"),
                          GestureDetector(
                            child: TextField(
                              controller: allDescription,
                              decoration: InputDecoration(
                                hintText: "Description",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Date"),
                          GestureDetector(
                            child: TextField(
                              controller: allDate,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2024),
                                  lastDate: DateTime(2025),
                                );

                                String formattedDate =
                                    DateFormat.yMMMd().format(pickedDate!);
                                setState(() {
                                  allDate.text = formattedDate;
                                });
                              },

                              decoration: InputDecoration(
                                hintText: "Date",
                                filled: true,
                                suffixIcon: Icon(Icons.calendar_today),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              // keyboardType: TextInputType.datetime,
                              //readOnly: true,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (allTitle.text.isNotEmpty &&
                          allDescription.text.isNotEmpty &&
                          allDate.text.isNotEmpty) {
                        TodoListModelClass newData = TodoListModelClass(
                            title: allTitle.text,
                            description: allDescription.text,
                            date: allDate.text);

                        setState(() {
                          alltext.add(newData);
                        });
                        allTitle.clear();
                        allDescription.clear();
                        allDate.clear();
                      }
                    },
                    child: Text("Submit"),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
