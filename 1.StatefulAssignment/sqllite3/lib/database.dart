import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

dynamic database;

class ModelClass {
  String name;
  String lastname;
  String pass;

  ModelClass({required this.name, required this.lastname, required this.pass});

  Map<String, dynamic> getMap() {
    return {"name": name, "lastname": lastname, "pass": pass};
  }

  @override
  String toString() {
    // TODO: implement toString
    return '{name:$name,lastname:$lastname,pass:$pass}';
  }
}

Future<void> insert(ModelClass obj) async {
  dynamic localDB = await database;
  print("-------------In insertData----------");
  await localDB.insert("DATA", obj.getMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore);
}

Future<List<ModelClass>> getData() async {
  print("**************************************In getData CLASS");
  final localDB = await database;
  List<Map<String, dynamic>> dataMap = await localDB.query("DATA");

  print(
      "****************************length of data ******************************");
  print(dataMap.length);
  return List.generate(dataMap.length, (i) {
    return ModelClass(
      name: dataMap[i]['name'],
      lastname: dataMap[i]['lastname'],
      pass: dataMap[i]['pass'],
    );
  });
}

Future<void> databaseCreate() async {
  print("-------------In OpenDatabase----------");

  database = await openDatabase(
    join(await getDatabasesPath(), "dataapp.db"),
    version: 1,
    onCreate: (db, version) async {
      await db.execute('CREATE TABLE DATA( name TEXT,lastname TEXT,pass TEXT)');
    },
  );
}
