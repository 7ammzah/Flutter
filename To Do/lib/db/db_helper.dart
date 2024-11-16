import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do/models/task.dart';

class DBHelper {
  static Database? database;
  static const int version = 1;
  static const String tableName = 'tasks';

  static Future<void> initDB() async {
    if (database != null) {
      debugPrint('DB not noll');
      return;
    } else {
      try {
        String path = await getDatabasesPath() + 'task.db';
        debugPrint('In DataBase path');
        database = await openDatabase(path , version: 1,
            onCreate: (Database db, int version) async {
          debugPrint('Create a new one');
           await db.execute(
            'CREATE TABLE $tableName ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT, '
            'title STRING, note TEXT, data STRING, name TEXT, startTime STRING, endTime STRING, '
            'remind INTEGER, repeat STRING, '
            'color INTEGER, isCompleted INTEGER)',
          );
          debugPrint('DateBase Created');
        });
        //return database;
        //debugPrint('DateBase Created');
      } catch (e) {
        print(e);
      }
    }
  }

  static Future<int> insert(Task? task) async {
    print('insert fuction');
    return await database!.insert(tableName, task!.toJson());
  }

  static Future<int> delete(Task? task) async {
    print('delete fuction');
    return await database!
        .delete(tableName, where: 'id = ?', whereArgs: [task!.id]);
  }

  static Future<List<Map<String, dynamic?>>> query() async {
    print('query fuction');
    return await database!.query(tableName);
  }

  static Future<int> update(int id) async {
    print('update fuction');
    return await database!.rawUpdate('''
    UPDATE tasks
    SET isComleted = ?
    WHERE id = ?
''', [1, id]);
  }
}
