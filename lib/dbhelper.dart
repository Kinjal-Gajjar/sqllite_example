import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper {
  static final _databasename = 'persons.db';
  static final _databaseversion = 1;

  static final table = 'my_table';

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnage = 'age';

  static Database? _database;
  Databasehelper._privateContructor();
  static final Databasehelper instance = Databasehelper._privateContructor();

  Future<Database?> get databse async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databasename);
    return await openDatabase(path,
        version: _databaseversion, onCreate: _oncreate);
  }

  Future _oncreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE $table(
  $columnId INTEGER PRIMARY KEY,
  $columnName TEXT NOT NULL,
  $columnage INTEGER NOT NULL
)
''');
  }

//funcation to insert,query,update and delete
  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.databse;
    return await db!.insert(table, row);
  }

  //Query all rows
  Future<List<Map<String, dynamic>>> queryall() async {
    Database? db = await instance.databse;
    return await db!.query(table);
  }

  //queryspecific
  Future<List<Map<String, dynamic>>> queryspecific(int age) async {
    Database? db = await instance.databse;
    var res = await db!.query(table, where: 'age > ?', whereArgs: [age]);
    // var res = await db!.rawQuery('SELECT *FORM my_table WHERE age>?', [age]);
    return res;
  }

  //delete
  Future<int> deletedata(int id) async {
    Database? db = await instance.databse;
    var res = await db!.delete(table, where: 'id= ?', whereArgs: [id]);
    return res;
  }
//upadate
  Future<int> update(int id) async {
    Database? db = await instance.databse;
    var res = await db!.update(
      table,
      {"name": "Umang Bhanderi", "age": 22},
      where: "id = ?",
      whereArgs: [id],
    );
    return res;
  }
}
