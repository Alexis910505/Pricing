import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricing/app/modules/home/home_binding.dart';
import 'package:pricing/app/modules/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pricing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      home: const HomeScreen(),
      initialBinding: HomeBinding(),
    );
  }
}
