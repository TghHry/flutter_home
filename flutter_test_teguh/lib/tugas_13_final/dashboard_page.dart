
import 'package:flutter/material.dart';
// import 'package:absensi_sederhana/profil.dart';
// import 'package:absensi_sederhana/list_kehadiran.dart';
// import 'package:absensi_sederhana/laporan_kehadiran.dart';
import 'package:flutter_test_teguh/tugas_13_final/laporan_kehadiran_page.dart';
import 'package:flutter_test_teguh/tugas_13_final/list_kehadiran_page.dart';
import 'package:flutter_test_teguh/tugas_13_final/profil_page.dart';
// import 'package:flutter_test_teguh/tugas_13_final/profil_page.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListKehadiranPage(),
                      ));
                },
                child: Text("List Kehadiran")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LaporanKehadiranPage(),
                      ));
                },
                child: Text("Laporan Kehadiran")),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => ProfilPage(name: name, email: email, phone: phone),
            //           ));
            //     },
            //     child: Text("Profil")),
          ],
        ),
      ),
    );
  }
}