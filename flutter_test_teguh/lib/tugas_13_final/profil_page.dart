import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/tugas_13_final/login_page.dart';
// import 'package:flutter_test_teguh/tugas_13_final/database/db_helper.dart';
import 'package:flutter_test_teguh/tugas_13_final/dashboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPage extends StatefulWidget {

  final String name;
  final String email;
  final String phone;

  const ProfilPage({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
  }) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const TugasTigasBelas()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama: ${widget.name}", style: TextStyle(fontSize: 18)),
            Text("Email: ${widget.email}", style: TextStyle(fontSize: 18)),
            Text("Phone: ${widget.phone}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Info Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => InfoPage()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Dashboard'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DashboardPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Info Aplikasi')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline, size: 80, color: Colors.blue),
            SizedBox(height: 10),
            Text('Versi Aplikasi:', style: TextStyle(fontSize: 16)),
            Text('1.0.0', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Dikembangkan oleh : ', style: TextStyle(fontSize: 16)),
            Text('Teguh Hariyanto', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

