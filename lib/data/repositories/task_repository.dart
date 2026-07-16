import 'package:hive/hive.dart';

import '../models/task_model.dart';

class TaskRepository {
  final Box<TaskModel> taskBox = Hive.box<TaskModel>("tasks");

  List<TaskModel> getTasks() {
    return taskBox.values.toList();
  }

  Future<void> addTask(TaskModel task) async {
    await taskBox.add(task);
  }

  Future<void> updateTask(
    int index,
    TaskModel task,
  ) async {
    await taskBox.putAt(index, task);
  }

  Future<void> deleteTask(int index) async {
    await taskBox.deleteAt(index);
  }

  Future<void> deleteAllTasks() async {
    await taskBox.clear();
  }
}