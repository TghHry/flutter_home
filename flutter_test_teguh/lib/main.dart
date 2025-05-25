import 'package:flutter/material.dart';
// import 'package:flutter_test_teguh/meet_6/meet_6_contoh.dart';
// import 'package:flutter_test_teguh/meet_6/meet_6_contoh1.dart';
// import 'package:flutter_test_teguh/meet_5/meet_5_contoh.dart';
import 'package:flutter_test_teguh/meet_6/meet_6_tugas.dart';
// import 'package:flutter_test_teguh/tugas_4/tugas_4.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar_flutter',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      
      // home: TugasEnamA(),
      home: TugasEnam(),
     
    );
  }
}
