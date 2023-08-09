import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:greenedu/routes/names.dart';
import 'package:greenedu/routes/pages.dart';

import 'color/colorapp.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.logoColor),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      initialRoute: AppRoutes.INITIAL,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
    );
  }
}
