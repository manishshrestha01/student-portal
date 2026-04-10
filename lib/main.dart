import 'package:codeit_app/bindings/controller_binding.dart';
import 'package:codeit_app/routes/app_pages.dart';
import 'package:codeit_app/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init('MyStorage');
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Inter',
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialBinding: ControllerBinding(),
      home:  SplashView(),
    );
  }
}
