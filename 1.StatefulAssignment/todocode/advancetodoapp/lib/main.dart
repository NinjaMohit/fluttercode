import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:advancetodoapp/advtodo.dart';
import 'package:advancetodoapp/connect.dart';

List<Info> obj1 = [];
List<Info> obj2 = [];

Future getdata() async {
  obj2.clear();
  List<Info> obj1 = await getOrderData();
  for (int i = 0; i < obj1.length; i++) {
    obj2.add(obj1[i]);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  database = openDatabase(join(await getDatabasesPath(), "oist.db"), version: 1,
      onCreate: ((db, version) async {
    await db.execute('''
            CREATE TABLE List (
           taskid INTEGER PRIMARY KEY,
           title TEXT,
           description TEXT,
           date TEXT
           )
           ''');
  }));

  await getdata();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Advancetodo(),
    );
  }
}
