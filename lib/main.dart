import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/presentation/controllers/task_controller.dart';


import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/theme_controller.dart';
import 'data/models/task_model.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TaskModelAdapter());

  await Hive.openBox<TaskModel>("tasks");

  Get.put(ThemeController());
  Get.put(TaskController());

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final ThemeController controller =
        Get.find<ThemeController>();

    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,

        themeMode: controller.themeMode,

        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: const Color(0xffE8F5E9),
        ),

        darkTheme: ThemeData.dark(),

        initialRoute: AppRoutes.splash,
        getPages: AppPages.routes,
      ),
    );
  }
}