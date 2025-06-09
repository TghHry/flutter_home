import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/tugas_13/laporan_per_orang_page.dart';
import 'package:flutter_test_teguh/tugas_13/list_kehadiran_page.dart';
import 'package:flutter_test_teguh/tugas_13/profil.dart';

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
                        builder: (context) => LaporanPerOrangPage(),
                      ));
                },
                child: Text("Laporan Kehadiran")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilPage(),
                      ));
                },
                child: Text("Profil")),
          ],
        ),
      ),
    );
  }
}
