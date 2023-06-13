import 'dart:io';
import 'package:getx_api/new_model/task.dart';
import 'package:sqflite/sqflite.dart';
class DBHelper{
  static Database? db;
  static final int version = 1;
  static final String tableName = "tasks";

  static Future<void> initDb()async{
    if(db!=null){
      return;
    }

    String _Path = await getDatabasesPath() + 'tasks.db';
    db = await openDatabase(
     _Path,
      version: version,
      onCreate: (db,version){
       print("creatingt new one ");
       return db.execute(
         "CRETED TABLE $tableName("
         "id INTEGER PRIMARY KEY AUTOINCREMENT,"
       "title STRING, note STRING)",
        );
     },
    );


  }

  static Future<int> insert(Task task)async {
    print("insert function called");
    return await db?.insert(tableName,task!.toJson())??1;
  }

  static Future<List<Map<String , dynamic>>> query() async{

    print("query function called");
    return await db!.query(tableName);
  }
}