import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/theme_controller.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {

    final ThemeController controller =
        Get.find<ThemeController>();

    return Obx(
      () => IconButton(
        onPressed: controller.toggleTheme,

        icon: Icon(
          controller.isDark.value
              ? Icons.light_mode
              : Icons.dark_mode,

          color: Colors.white,
        ),
      ),
    );
  }
}