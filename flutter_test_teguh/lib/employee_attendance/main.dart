import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/employee_attendance/loginscreen.dart';


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
      initialRoute: '/loginscreen',
      routes: {
        '/loginscreen': (context) => Loginscreen(),
      },
    );
  }
}
