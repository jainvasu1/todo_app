import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';
import 'home_tab.dart';
import 'profile_screen.dart';
import 'task_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final BottomNavController controller =
      Get.put(BottomNavController());

  final List<Widget> pages = [
    HomeTab(),
    TaskScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[controller.selectedIndex.value],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,

          onTap: controller.changeIndex,

          type: BottomNavigationBarType.fixed,

          selectedItemColor: Colors.green.shade700,
          unselectedItemColor: Colors.grey,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sticky_note_2_rounded),
              label: "Tasks",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}