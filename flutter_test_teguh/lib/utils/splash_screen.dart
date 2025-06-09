// import 'package:belajar_flutter2/study_case_meet_16/siswa_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/constant/app_image.dart';
import 'package:flutter_test_teguh/constant/app_style.dart';
import 'package:flutter_test_teguh/helper/preference.dart';
import 'package:flutter_test_teguh/meet_8/tugas_8.dart';
import 'package:flutter_test_teguh/tugas_13_contoh/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id = "/splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changePage() {
    Future.delayed(Duration(seconds: 3), () async {
      bool isLogin = await PreferenceHandler.getLogin();
      // print("isLogin: $isLogin");
      // if (isLogin) {
      //   return Navigator.pushNamedAndRemoveUntil(
      //     context,
      //     MeetDuaBelasB.id,
      //     (route) => false,
      //   );
      // } else {
      //   Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      // }
      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   TugasTigasBelas.id,
      //   (route) => false,
      // );
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TugasTigasBelas(),
          ));
    });
  }

  @override
  void initState() {
    changePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001F54),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset("assets/images/luffy2.jpg", height: 200),
            SizedBox(height: 20),
            Text(
              "Absensi Kehadiran",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            SafeArea(
              child: Text("v 1.0.0", style: AppStyle.fontRegular(fontSize: 10)),
            ),
          ],
        ),
      ),
    );
  }
}
