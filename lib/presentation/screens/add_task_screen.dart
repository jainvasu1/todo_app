import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/models/task_model.dart';
import '../controllers/task_controller.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});
  

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState(
    
  );
  
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  final TaskController controller = Get.find<TaskController>();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController =
      TextEditingController();

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  String category = "Today";

  String status = "Pending";

  final List<String> statusList = [
    "Pending",
    "Completed",
  ];

  @override
  void initState() {
    super.initState();
    updateCategory();
  }

  void updateCategory() {
    final today = DateTime.now();

    final current = DateTime(
      today.year,
      today.month,
      today.day,
    );

    final taskDate = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );

    if (taskDate.isBefore(current)) {
      category = "Yesterday";
    } else if (taskDate == current) {
      category = "Today";
    } else {
      category = "Future";
    }

    setState(() {});
  }

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      selectedDate = picked;
      updateCategory();
    }
  }

  Color chipColor() {
    switch (category) {
      case "Today":
        return Colors.green;

      case "Future":
        return Colors.blue;

      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Add Task",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10),

              const Text(
                "Task Title *",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: titleController,

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Task title is required";
                  }
                  return null;
                },

                decoration: InputDecoration(
                  hintText: "Enter task title",
                  filled: true,
                  fillColor: Theme.of(context).cardColor,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: descriptionController,
                maxLines: 4,

                decoration: InputDecoration(
                  hintText: "Write description",

                  filled: true,
                  fillColor: Theme.of(context).cardColor,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                "Select Date",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 8),

              InkWell(
                onTap: pickDate,

                child: Container(
                  width: double.infinity,

                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 18,
                  ),

                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,

                    borderRadius: BorderRadius.circular(14),

                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                  ),

                  child: Row(
                    children: [

                      Icon(
                        Icons.calendar_month,
                        color: Colors.green.shade700,
                      ),

                      const SizedBox(width: 12),

                      Text(
                        DateFormat('dd MMM yyyy')
                            .format(selectedDate),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                "Category",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 10),

              Chip(
                backgroundColor: chipColor(),

                label: Text(
                  category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                "Status",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 8),

              DropdownButtonFormField<String>(
                value: status,

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).cardColor,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),

                items: statusList
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),

                onChanged: (value) {
                  status = value!;
                  setState(() {});
                },
              ),

              const SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () async {
  if (_formKey.currentState!.validate()) {
    final task = TaskModel(
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      date: selectedDate,
      category: category,
      status: status,
    );

    await controller.addTask(task);

    Get.back();

    Get.snackbar(
      "Success",
      "Task Added Successfully",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
},
                  child: const Text(
                    "SAVE TASK",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}