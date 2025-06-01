import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/meet_1/meet_model/meet_home_page_model.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePageModel(),
    );
  }
}