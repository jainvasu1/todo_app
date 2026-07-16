import 'package:flutter/material.dart';
import 'package:todo_app/presentation/screens/add_task_screen.dart';
import 'package:todo_app/presentation/widgets/toggle_theme_button.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),

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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddTaskScreen(),
      ),
    );
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

            /// Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search task...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Filter Chips
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

            const SizedBox(height: 25),

            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(
                      Icons.task_alt,
                      size: 100,
                      color: Colors.green.shade300,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "No Tasks Yet",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Tap the + button to add your first task.",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
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