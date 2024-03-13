import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

dynamic database;

class Employee {
  final int empId;
  final String name;
  final double sal;
  Employee({required this.empId, required this.name, required this.sal});

  Map<String, dynamic> employeeMap() {
    return {
      'empID': empId,
      'name': name,
      'sal': sal,
    };
  }
}

Future<void> insertEmployee(Employee emp) async {
  final localDB = await database;
  localDB.insert('bat', emp.employeeMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<void> deleteEmpData(Employee emp) async {
  final localDB = await database;

  await localDB.delete('bat', where: "empId=?", whereArgs: [emp.empId]);
}

Future<List<Map<String, dynamic>>> getEmployeeData() async {
  final localDB = await database;
  List<Map<String, dynamic>> mapEntry = await localDB.query("bat");
  return mapEntry;
}

void main() async {
  runApp(const MainApp());

  print(await getDatabasesPath());

  database = openDatabase(
    join(await getDatabasesPath(), 'mohit.db'),
    version: 1,
    onCreate: (db, version) {
      db.execute('CREATE TABLE bat(empId INT PRIMARY KEY,name TEXT,sal REAL)');
    },
  );
  Employee emp1 = Employee(empId: 1, name: "mohit", sal: 0.3);
  Employee emp2 = Employee(empId: 2, name: "hit", sal: 2.3);
  await insertEmployee(emp1);
  await insertEmployee(emp2);
  print("-----------------------------------------");

  List<Map<String, dynamic>> retVal = await getEmployeeData();
  for (int i = 0; i < retVal.length; i++) {
    print(retVal[i]);
  }
  await deleteEmpData(emp1);

  print("*****************************************");

  print("After Delete");
  retVal = await getEmployeeData();
  for (int i = 0; i < retVal.length; i++) {
    print(retVal[i]);
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
