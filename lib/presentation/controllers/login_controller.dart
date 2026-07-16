import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../core/routes/app_routes.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool rememberMe = false.obs;
  RxBool isLoading = false.obs;

  final Box loginBox = Hive.box("loginBox");

  @override
  void onInit() {
    super.onInit();
    loadSavedCredentials();
  }

  void loadSavedCredentials() {
    rememberMe.value = loginBox.get("rememberMe", defaultValue: false);

    if (rememberMe.value) {
      emailController.text = loginBox.get("email", defaultValue: "");
      passwordController.text = loginBox.get("password", defaultValue: "");
    }
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final savedPassword = loginBox.get("password", defaultValue: "vayuz123");

    if (email != "vayuz@gmail.com" || password != savedPassword) {
      Get.snackbar(
        "Login Failed",
        "Invalid Email or Password",
      );
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    if (rememberMe.value) {
      await loginBox.put("rememberMe", true);
      await loginBox.put("email", email);
      await loginBox.put("password", password);
    } else {
      await loginBox.put("rememberMe", false);
      await loginBox.put("email", "");
      await loginBox.put("password", loginBox.get("password", defaultValue: "vayuz123"));
    }

    isLoading.value = false;

    Get.offAllNamed(AppRoutes.home);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}