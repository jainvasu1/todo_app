import 'package:get/get.dart';

import '../../data/models/task_model.dart';
import '../../data/repositories/task_repository.dart';

class TaskController extends GetxController {
  final TaskRepository repository = TaskRepository();

  RxList<TaskModel> tasks = <TaskModel>[].obs;

  RxList<TaskModel> filteredTasks = <TaskModel>[].obs;
  RxString selectedFilter = "All".obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void loadTasks() {
    tasks.assignAll(repository.getTasks());
    filterTasks(selectedFilter.value);
  }

  void filterTasks(String filter) {
    selectedFilter.value = filter;

    switch (filter) {
      case "All":
        filteredTasks.assignAll(tasks);
        break;
      case "Today":
        filteredTasks.assignAll(
          tasks.where((e) => e.category == "Today").toList(),
        );
        break;
      case "Yesterday":
        filteredTasks.assignAll(
          tasks.where((e) => e.category == "Yesterday").toList(),
        );
        break;
      case "Future":
        filteredTasks.assignAll(
          tasks.where((e) => e.category == "Future").toList(),
        );
        break;
      case "Completed":
        filteredTasks.assignAll(
          tasks.where((e) => e.status == "Completed").toList(),
        );
        break;
      case "Pending":
        filteredTasks.assignAll(
          tasks.where((e) => e.status == "Pending").toList(),
        );
        break;
    }
  }

  Future<void> addTask(TaskModel task) async {
    await repository.addTask(task);
    loadTasks();
  }

  Future<void> updateTask(int index, TaskModel task) async {
    await repository.updateTask(index, task);
    loadTasks();
  }

  Future<void> deleteTask(int index) async {
    await repository.deleteTask(index);
    loadTasks();
  }

  void searchTask(String keyword) {
    if (keyword.trim().isEmpty) {
      filterTasks(selectedFilter.value);
      return;
    }

    final filtered = tasks.where(
      (task) => task.title.toLowerCase().contains(keyword.toLowerCase()),
    );

    filteredTasks.assignAll(filtered.toList());
  }

  int get totalTasks => tasks.length;

  int get completedTasks =>
      tasks.where((task) => task.status == "Completed").length;

  int get pendingTasks =>
      tasks.where((task) => task.status == "Pending").length;

  int get todayTasks =>
      tasks.where((task) => task.category == "Today").length;

  int get yesterdayTasks =>
      tasks.where((task) => task.category == "Yesterday").length;

  int get futureTasks =>
      tasks.where((task) => task.category == "Future").length;
}