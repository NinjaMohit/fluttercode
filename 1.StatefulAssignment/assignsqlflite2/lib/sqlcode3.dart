import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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

Future<void> insert(Employee emp) async {
  final localDB = await database;

  localDB.insert('EMP', emp.employeeMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<void> deleteEmpData(Employee emp) async {
  final localDB = await database;

  await localDB.delete('EMP', where: "empId=?", whereArgs: [emp.empId]);
}

Future<List<Map<String, dynamic>>> getData() async {
  final localDB = await database;
  List<Map<String, dynamic>> mapEntry = await localDB.query("EMP");
  return mapEntry;
}

void main() async {
  runApp(const MainApp());
  database = await openDatabase(
    join(await getDatabasesPath(), 'EmpDB.db'),
    version: 1,
    onCreate: (db, version) {
      db.execute('Create table EMP(empId INT PRIMARY KEY,name TEXT,sal REAL)');
    },
  );

  Employee emp1 = Employee(empId: 1, name: "mohit", sal: 0.3);
  Employee emp2 = Employee(empId: 2, name: "hit", sal: 2.3);

  await insert(emp1);
  await insert(emp2);
  print("-----------------------------------------");

  List<Map<String, dynamic>> retVal = await getData();
  for (int i = 0; i < retVal.length; i++) {
    print(retVal[i]);
  }

  await deleteEmpData(emp1);

  print("****************************************");

  print("After Delete");
  retVal = await getData();
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
