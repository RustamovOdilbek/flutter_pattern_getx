import 'package:flutter/material.dart';
import 'package:flutter_pattern_getx/pages/starter_page.dart';
import 'package:flutter_pattern_getx/service/di_service.dart';

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
      home: StarterPage(),
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
