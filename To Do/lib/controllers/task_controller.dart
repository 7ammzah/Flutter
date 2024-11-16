import 'package:get/get.dart';
import 'package:to_do/db/db_helper.dart';

import '../models/task.dart';

class TaskController extends GetxController {
  final RxList tsakList = <Task>[].obs;

  Future<int> addTask({Task? task}) {
    return DBHelper.insert(task);
  }

  Future<void>getTasks() async {
    final tasks = await DBHelper.query();
    tsakList.assignAll(tasks.map((e) => Task.fromJson(e)).toList());  
  }
  deleteTasks(Task task) async{
    await DBHelper.delete(task);
    getTasks();
  }
  updateIsCompleted(int id) async {
    await DBHelper.update(id);
    getTasks();
  }
}
