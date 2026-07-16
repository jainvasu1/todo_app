import 'package:get/get.dart';

import '../../data/models/task_model.dart';
import '../../data/repositories/task_repository.dart';

class TaskController extends GetxController {
  final TaskRepository repository = TaskRepository();

  RxList<TaskModel> tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void loadTasks() {
    tasks.assignAll(repository.getTasks());
  }

  Future<void> addTask(TaskModel task) async {
    await repository.addTask(task);
    loadTasks();
  }

  Future<void> deleteTask(int index) async {
    await repository.deleteTask(index);
    loadTasks();
  }

  Future<void> updateTask(int index, TaskModel task) async {
    await repository.updateTask(index, task);
    loadTasks();
  }
}