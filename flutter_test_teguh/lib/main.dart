import 'package:flutter/material.dart';
// import 'package:flutter_test_teguh/tugas_11_contoh/home.dart';
// import 'package:flutter_test_teguh/tugas_13/login_page.dart';

import 'package:flutter_test_teguh/utils/splash_screen.dart';
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
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        // TugasTigasBelas.id: (context) => TugasTigasBelas(),
      },
      // home: TugasEnamA(),
      // home: JadwalPage(),
    );
  }
}
