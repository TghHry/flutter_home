import 'package:flutter/material.dart';
// import 'package:flutter_test_teguh/meet_1/meet_drawer/meet_main_drawer.dart';
import 'package:flutter_test_teguh/meet_1/meet_drawer/meet_page_drawer.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting Page")),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 150,
              color: Colors.red,
              alignment: Alignment.bottomLeft,
              child: Text(
                "Menu Pilihan",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => PageSatu()),
                );
              },
              leading: Icon(Icons.home, size: 35),
              title: Text("Home", style: TextStyle(fontSize: 25)),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SettingPage()),
                );
              },
              leading: Icon(Icons.settings, size: 35),
              title: Text("Setting", style: TextStyle(fontSize: 25)),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("Some Time Here", style: TextStyle(fontSize: 35)),
      ),
    );
  }
}
