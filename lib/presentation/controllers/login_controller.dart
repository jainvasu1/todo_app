import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routes/app_routes.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var rememberMe = false.obs;
  var isLoading = false.obs;

  // Hardcoded Credentials
  static const String validEmail = "vayuz@gmail.com";
  static const String validPassword = "vayuz123"; 

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Missing Information",
        "Please enter email and password.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 1));

    isLoading.value = false;

    if (email == validEmail && password == validPassword) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.snackbar(
        "Login Failed",
        "Invalid email or password.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}