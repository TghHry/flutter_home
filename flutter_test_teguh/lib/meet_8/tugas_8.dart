import 'package:flutter_test_teguh/kuldii_project/HTTP/meet_1/meet1.dart';
// import 'package:flutter_test_teguh/meet_2/meet2.dart';
import 'package:flutter_test_teguh/meet_2/tugas_flutter_2.dart';
import 'package:flutter_test_teguh/meet_3/tugas_flutter3.dart';
import 'package:flutter_test_teguh/meet_4/tugas_flutter_4.dart';
import 'package:flutter_test_teguh/meet_5/tugas_flutter5.dart.dart';
import 'package:flutter_test_teguh/meet_6/meet_6_tugas.dart';
import 'package:flutter_test_teguh/meet_7/meet_7_tugas.dart';
import 'package:flutter/material.dart';

class TugasDelapan extends StatefulWidget {
  const TugasDelapan({super.key});

  @override
  State<TugasDelapan> createState() => _TugasDelapanState();
}

class _TugasDelapanState extends State<TugasDelapan> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [const TugasTujuh(), const TentangPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
        ],
      ),
    );
  }
}

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          "Tentang Aplikasi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Aplikasi Form Input dengan Navigasi Drawer",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Aplikasi ini memungkinkan pengguna mengisi formulir interaktif dengan navigasi melalui drawer dan bottom navigation. "
              "Fitur-fitur yang tersedia antara lain checkbox, switch mode (dark/light), dropdown kategori, pemilihan tanggal dan waktu.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Dibuat oleh: Teguh Hariyanto",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "Versi: 1.0.0",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Tanggal dibuat : 28-05-2025",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.home_work),
                title: Text('Tugas Satu'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilPage(),
                      ));
                },
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.home_work),
                title: Text('Tugas Dua'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TugasFlutter2(),
                      ));
                },
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.home_work),
                title: Text('Tugas Tiga'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TugasTiga(),
                      ));
                },
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.home_work),
                title: Text('Tugas Empat'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TugasEmpat(),
                      ));
                },
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.home_work),
                title: Text('Tugas Lima'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TugasLima(),
                      ));
                },
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.home_work),
                title: Text('Tugas Enam'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TugasEnam(),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
