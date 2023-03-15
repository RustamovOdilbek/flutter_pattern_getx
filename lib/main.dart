import 'package:flutter/material.dart';
import 'package:flutter_pattern_getx/pages/home_page.dart';
import 'package:flutter_pattern_getx/pages/main_page.dart';
import 'package:flutter_pattern_getx/service/bind_service.dart';
import 'package:flutter_pattern_getx/service/di_service.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() async{
  await DIService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      // initialBinding: BindService(),
      // getPages: [
      //   GetPage(
      //     name: MainPage.id,
      //     page: () =>  MainPage(),
      //     binding: BindService(),
      //   ),
      // ],
    );
  }
}
