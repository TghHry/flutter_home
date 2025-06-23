import 'package:flutter_test_teguh/tugas_15/screen/edit_screen.dart';
import 'package:flutter_test_teguh/tugas_15/screen/home_screen.dart';
import 'package:flutter_test_teguh/tugas_15/screen/login_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil App',
      initialRoute: '/profile',
      routes: {
        '/login':
            (context) => const LoginScreen(), // pastikan LoginScreen sudah ada
        '/profile': (context) => const ProfileUserScreen(),
        '/edit': (context) => const EditProfileScreen(),
      },
    );
  }
}