import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/screen/home/main_food_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      home: MainFoodPage(),
    );
  }
}
