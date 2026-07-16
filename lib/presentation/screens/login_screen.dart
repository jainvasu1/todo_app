import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),

              /// Illustration
              Image.asset(
                "assets/gifs/panda.gif",
                height: 180,
              ),

              const SizedBox(height: 20),

              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Sign in to manage your daily tasks",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 40),

              CustomTextField(
                controller: controller.emailController,
                hintText: "Email",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 18),

              CustomTextField(
                controller: controller.passwordController,
                hintText: "Password",
                prefixIcon: Icons.lock_outline,
                obscureText: true,
              ),

              const SizedBox(height: 15),

              Obx(
                () => Row(
                  children: [
                    Checkbox(
                      value: controller.rememberMe.value,
                      activeColor: Colors.green.shade700,
                      onChanged: controller.toggleRememberMe,
                    ),
                    const Text(
                      "Remember Me",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Obx(
                () => CustomButton(
                  text: "SIGN IN",
                  isLoading: controller.isLoading.value,
                  onPressed: controller.login,
                ),
              ),

              const SizedBox(height: 30),

              const Divider(),

              const SizedBox(height: 10),

              const Text(
                "Hardcoded Credentials",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email : vayuz@gmail.com",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Password : vayuz123",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}