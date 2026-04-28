import 'package:codeit_app/bindings/controller_binding.dart';
import 'package:codeit_app/routes/app_pages.dart';
import 'package:codeit_app/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await GetStorage.init('MyStorage');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CODE IT',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialBinding: ControllerBinding(),
      home: SplashView(),
      theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
    );
  }
}
