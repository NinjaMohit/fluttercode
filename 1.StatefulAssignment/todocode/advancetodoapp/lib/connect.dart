import 'package:sqflite/sqflite.dart';
import 'package:advancetodoapp/advtodo.dart';

dynamic database;
int? length;

Future<void> insertOrderData(Info obj) async {
  final localDB = await database;
  await localDB.insert(
    "List",
    obj.infoMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> deleteOrderData(int data) async {
  final localDB = await database;

  await localDB.delete(
    "List",
    where: "taskid = ?",
    whereArgs: [data],
  );
}

Future<void> updateOrderData(Info obj) async {
  final localDB = await database;
  await localDB.update("List", obj.infoMap(),
      where: 'taskid=?', whereArgs: [obj.taskid]);
}

Future<List<Info>> getOrderData() async {
  final localDB = await database;
  List<Map<String, dynamic>> infoMap = await localDB.query("List");
  return List.generate(infoMap.length, (i) {
    return Info(
        taskid: infoMap[i]['taskid'],
        title: infoMap[i]['title'],
        description: infoMap[i]['description'],
        date: infoMap[i]['date']);
  });
}
