import 'package:advancetodoapp2/assign.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

dynamic database;

List listOfdata = [];

class ToDoModelClass {
  int? idNo;
  String title;
  String description;
  String date;

  ToDoModelClass(
      {this.idNo,
      required this.title,
      required this.description,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      'idNo': idNo,
      'title': title,
      'description': description,
      'date': date,
    };
  }
}

Future<void> insertData(ToDoModelClass obj) async {
  final localDB = await database;
  print("insertData mehod, ${listOfdata}");
  await localDB.insert(
    "todoappdata",
    obj.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  await getData();
}

Future deleteData(int data) async {
  final localDB = await database;
  print("DELETE DATABASE , ${listOfdata}");

  await localDB.delete(
    "todoappdata",
    where: "idNo= ?",
    whereArgs: [data],
  );
}

Future<void> updateData(ToDoModelClass obj) async {
  final localDB = await database;
  print("UPDATE DATABASE , ${listOfdata}");

  await localDB.update("todoappdata", obj.toMap(),
      where: 'todoappdata=?', whereArgs: [obj.idNo]);
  await getData();
}

Future getData() async {
  final localDB = await database;
  print("CREATE LIST, $localDB , $listOfdata");

  List<Map<String, dynamic>> getMap = await localDB.query("todoappdata");
  listOfdata = List.generate(getMap.length, (index) {
    return ToDoModelClass(
        idNo: getMap[index]['idNo'],
        title: getMap[index]['title'],
        description: getMap[index]['description'],
        date: getMap[index]['date']);
  });
}

Future createdatabase() async {
  //WidgetsFlutterBinding.ensureInitialized();
  // runApp(const MyApp());
  print("CREATE DATABASE , ${listOfdata}");

  database = await openDatabase(
    p.join(await getDatabasesPath(), 'todoListdataDB.db'),
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
CREATE TABLE todoappdata(
idNo INTEGER PRIMARY KEY,
title TEXT,
description TEXT,
date TEXT
)
''');
    },
  );
  await getData();
  print("AFTER CREATING DATABASE , ${listOfdata}");
}
