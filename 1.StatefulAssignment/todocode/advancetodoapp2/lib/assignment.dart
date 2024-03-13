import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await createDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TODOAppUI(),
    );
  }
}

class TODOAppUI extends StatefulWidget {
  const TODOAppUI({super.key});
  @override
  State<TODOAppUI> createState() => _TODOAppUIState();
}

class _TODOAppUIState extends State<TODOAppUI> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> showBottomSheet(bool doedit,
      [ToDoModelClass? toDoModelObj]) async {
    // ... (unchanged code)
    await showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Create Tasks",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: GoogleFonts.quicksand(
                          color: const Color.fromRGBO(89, 57, 241, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: "Enter Title",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(89, 57, 241, 1),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Description",
                        style: GoogleFonts.quicksand(
                          color: const Color.fromRGBO(89, 57, 241, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormField(
                        controller: descriptionController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Enter Description",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(89, 57, 241, 1),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Date",
                        style: GoogleFonts.quicksand(
                          color: const Color.fromRGBO(89, 57, 241, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormField(
                        controller: dateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: "Enter Date",
                          suffixIcon: const Icon(Icons.date_range_rounded),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(89, 57, 241, 1),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2025),
                          );
                          String formatedDate =
                              DateFormat.yMMMd().format(pickedDate!);
                          dateController.text = formatedDate;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 300,
                  margin: const EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          13,
                        ),
                      ),
                      backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
                    ),
                    onPressed: () {
                      doedit ? submit(doedit, toDoModelObj) : submit(doedit);
                      Navigator.of(context).pop();
                      dateController.clear();
                      descriptionController.clear();
                      titleController.clear();
                    },
                    child: Text(
                      "Submit",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<ToDoModelClass> todoList = List.empty(growable: true);

  Future<void> allToList() async {
    List<ToDoModelClass> list = await getData();
    setState(() {
      todoList = list;
    });
  }

  void submit(bool doedit, [ToDoModelClass? toDoModelObj]) {
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty) {
      if (!doedit) {
        setState(() {
          insertData(
            ToDoModelClass(
              title: titleController.text.trim(),
              description: descriptionController.text.trim(),
              date: dateController.text.trim(),
            ),
          );
          print(titleController.text);
          print(descriptionController.text);
          print(dateController.text);
        });
      } else {
        setState(() {
          toDoModelObj!.date = dateController.text.trim();
          toDoModelObj.title = titleController.text.trim();
          toDoModelObj.description = descriptionController.text.trim();
        });
      }
    }
    clearController();
  }

  void clearController() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  void removeTasks(ToDoModelClass toDoModelObj) {
    // ... (unchanged code)
    setState(() {
      todoList.remove(toDoModelObj);
    });
  }

  void editTask(ToDoModelClass toDoModelObj) {
    // ... (unchanged code)
    titleController.text = toDoModelObj.title;
    descriptionController.text = toDoModelObj.description;
    dateController.text = toDoModelObj.date;
    showBottomSheet(true, toDoModelObj);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "Good Morning",
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "Core2Web",
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(
                      40,
                    ),
                  ),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "CREATE TASKS",
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(
                              40,
                            ),
                          ),
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: todoList.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              closeOnScroll: true,
                              endActionPane: ActionPane(
                                extentRatio: 0.2,
                                motion: const DrawerMotion(),
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const SizedBox(
                                          height: 14,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            editTask(todoList[index]);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  89, 57, 241, 1),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            removeTasks(todoList[index]);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  89, 57, 241, 1),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              key: ValueKey(index),
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  bottom: 20,
                                  top: 20,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  border: Border.all(
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.05),
                                      width: 0.5),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 20,
                                      color: Color.fromRGBO(0, 0, 0, 0.13),
                                    )
                                  ],
                                  borderRadius:
                                      const BorderRadius.all(Radius.zero),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 110,
                                            width: 110,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color.fromRGBO(
                                                  217, 217, 217, 1),
                                            ),
                                            child:
                                                Image.asset("assets/img.png"),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 260,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                todoList[index].title,
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                todoList[index].description,
                                                style: GoogleFonts.inter(
                                                    color: const Color.fromRGBO(
                                                        0, 0, 0, 0.7),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                todoList[index].date,
                                                style: GoogleFonts.inter(
                                                    color: const Color.fromRGBO(
                                                        0, 0, 0, 0.7),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Checkbox(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          activeColor: Colors.green,
                                          value: true,
                                          onChanged: (val) {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
        onPressed: () async {
          await showBottomSheet(false);
        },
        child: const Icon(
          size: 50,
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ToDoModelClass {
  int? idNo;
  String title;
  String description;
  String date;

  ToDoModelClass({
    this.idNo,
    required this.title,
    required this.description,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'idNo': idNo,
      'title': title,
      'description': description,
      'date': date,
    };
  }

  @override
  String toString() {
    return '{idNo:$idNo,title:$title,description:$description,date:$date}';
  }
}

dynamic database;

Future<void> createDatabase() async {
  database = await openDatabase(
    p.join(await getDatabasesPath(), 'todoListDB.db'),
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
CREATE TABLE todoapp(
idNo INTEGER PRIMARY KEY,
title TEXT,
description TEXT,
date TEXT,
)
''');
    },
  );
}

Future<void> insertData(ToDoModelClass obj) async {
  final localDB = await database;
  await localDB.insert(
    "todoapp",
    obj.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> deleteData(int data) async {
  final localDB = await database;
  await localDB.delete(
    "todoapp",
    where: "idNo= ?",
    whereArgs: [data],
  );
}

Future<void> updateData(ToDoModelClass obj) async {
  final localDB = await database;
  await localDB.update(
    "todoapp",
    obj.toMap(),
    where: 'idNo=?',
    whereArgs: [obj.idNo],
  );
}

Future<List<ToDoModelClass>> getData() async {
  final localDB = await database;
  List<Map<String, dynamic>> getMap = await localDB.query("todoapp");
  return List.generate(getMap.length, (index) {
    return ToDoModelClass(
      idNo: getMap[index]['idNo'],
      title: getMap[index]['title'],
      description: getMap[index]['description'],
      date: getMap[index]['date'],
    );
  });
}
