import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/task_controller.dart';
import 'add_task_screen.dart';
import '../widgets/toggle_theme_button.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});

  final TaskController controller = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Tasks",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          ThemeToggleButton(),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade700,
        onPressed: () {
          Get.to(() => const AddTaskScreen());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
           TextField(
  onChanged: controller.searchTask,

  decoration: InputDecoration(
    hintText: "Search task...",
    prefixIcon: const Icon(Icons.search),
    filled: true,
    fillColor: Theme.of(context).cardColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
  ),
),

            const SizedBox(height: 20),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _chip("All", true),
                  _chip("Today", false),
                  _chip("Yesterday", false),
                  _chip("Future", false),
                  _chip("Completed", false),
                  _chip("Pending", false),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Obx(() {
                if (controller.filteredTasks.isEmpty) {
                  return const Center(
                    child: Text(
                      "No Tasks Yet",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: controller.filteredTasks.length,
                  itemBuilder: (context, index) {
                    final task = controller.filteredTasks[index];

                    return Dismissible(
                      key: Key(index.toString()),
                      background: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Delete",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      secondaryBackground: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Edit",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      confirmDismiss: (direction) async {
                        FocusManager.instance.primaryFocus?.unfocus();

                        if (direction == DismissDirection.startToEnd) {
                          return await Get.dialog(
                            AlertDialog(
                              title: const Text("Delete Task"),
                              content: const Text(
                                "Are you sure you want to delete this task?",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    Get.back(result: false);
                                  },
                                  child: const Text("No"),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  onPressed: () {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    Get.back(result: true);
                                  },
                                  child: const Text(
                                    "Yes",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          FocusManager.instance.primaryFocus?.unfocus();

                          Get.to(
                            () => AddTaskScreen(
                              task: task,
                              index: index,
                            ),
                          );

                          return false;
                        }
                      },
                      onDismissed: (direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          await controller.deleteTask(index);

                          Get.snackbar(
                            "Deleted",
                            "Task successfully deleted",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                      child: Card(
                        elevation: 3,
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.green.shade100,
                            child: const Icon(
                              Icons.task_alt,
                              color: Colors.green,
                            ),
                          ),
                          title: Text(
                            task.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String text, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ChoiceChip(
        label: Text(text),
        selected: selected,
        selectedColor: Colors.green.shade700,
        labelStyle: TextStyle(
          color: selected ? Colors.white : Colors.black,
        ),
        onSelected: (_) {},
      ),
    );
  }
}