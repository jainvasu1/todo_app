import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/presentation/controllers/task_controller.dart';
import 'package:todo_app/presentation/widgets/toggle_theme_button.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

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
    "TODO Dashboard",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  actions: const [
    ThemeToggleButton(),
  ],
),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Greeting Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome 👋",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "TODO APP",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Text(
              "Quick Overview",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => _buildCard(
                      context: context,
                      title: "Today's Tasks",
                      count: controller.todayTasks.toString(),
                      icon: Icons.today,
                      color: Colors.orange,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Obx(
                    () => _buildCard(
                      context: context,
                      title: "Completed",
                      count: controller.completedTasks.toString(),
                      icon: Icons.check_circle,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => _buildCard(
                      context: context,
                      title: "Pending",
                      count: controller.pendingTasks.toString(),
                      icon: Icons.pending_actions,
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Obx(
                    () => _buildCard(
                      context: context,
                      title: "Future",
                      count: controller.futureTasks.toString(),
                      icon: Icons.calendar_month,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

          
            const SizedBox(height: 20),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12, top: 4),
            child: Text(
              'Made by Vasudha Jain ❤️',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required String title,
    required String count,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(2, 4),
          )
        ],
      ),
      child: Column(
        children: [

          CircleAvatar(
            radius: 25,
            backgroundColor: color.withValues(alpha: 0.15),
            child: Icon(
              icon,
              color: Colors.green.shade700,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            count,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}