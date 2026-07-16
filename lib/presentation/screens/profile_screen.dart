import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/presentation/widgets/toggle_theme_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

appBar: AppBar(
  backgroundColor: Colors.green.shade700,
  elevation: 0,
  centerTitle: true,
  title: const Text(
    "Profile",
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
          children: [

            const SizedBox(height: 10),

            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.green.shade700,
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 60,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              "VAYUZ USER",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              "vayuz@gmail.com",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),


            const SizedBox(height: 10),

            _profileTile(
              icon: Icons.info_outline,
              title: "App Version",
              trailing: Text(
                "1.0.0",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            const SizedBox(height: 10),

            _profileTile(
              icon: Icons.lock_outline,
              title: "Change Password",
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Theme.of(context).iconTheme.color,
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {

                  Get.offAllNamed('/login');

                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileTile({
    required IconData icon,
    required String title,
    required Widget trailing,
  }) {
    return Card(
      color: Theme.of(Get.context!).cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green.shade100,
          child: Icon(
            icon,
            color: Colors.green.shade700,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(Get.context!).textTheme.titleMedium,
        ),
        trailing: trailing,
      ),
    );
  }
}