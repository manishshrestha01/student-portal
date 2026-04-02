import 'package:codeit_app/bindings/controller_binding.dart';
import 'package:codeit_app/routes/app_pages.dart';
import 'package:codeit_app/views/splash_view.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Inter',
      ),
      getPages: AppPages.routes,
      initialBinding: ControllerBinding(),
      home: SplashView(),
    );
  }
}

