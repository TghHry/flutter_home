import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/kuldii_project/HTTP/meet_1/meet_appbar_widget.dart';
// import 'package:flutter_test_teguh/meet_1/meet_date_format.dart';
import 'package:flutter_test_teguh/kuldii_project/HTTP/meet_1/meet_dialog.dart';
import 'package:flutter_test_teguh/kuldii_project/HTTP/meet_1/meet_dismissible.dart';
import 'package:flutter_test_teguh/kuldii_project/HTTP/meet_1/meet_extract_widget.dart';
import 'package:flutter_test_teguh/kuldii_project/HTTP/meet_1/meet_fitted.dart';
import 'package:flutter_test_teguh/kuldii_project/HTTP/meet_1/meet_model/meet_home_page_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer")),
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
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              leading: Icon(Icons.home, size: 35),
              title: Text("Home Page", style: TextStyle(fontSize: 25)),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyHomePageModel()),
                );
              },
              leading: Icon(Icons.settings, size: 35),
              title: Text("Home Page Model", style: TextStyle(fontSize: 25)),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => appBar()),
                );
              },
              leading: Icon(Icons.settings, size: 35),
              title: Text("AppBar", style: TextStyle(fontSize: 25)),
            ),
            // ListTile(
            //   // onTap: () {
            //     Navigator.of(context).push(
            //       // MaterialPageRoute(builder: (context) => fiturText),
            //     // );
            //   // },
            //   leading: Icon(Icons.settings, size: 35),
            //   title: Text("Date Format Page", style: TextStyle(fontSize: 25)),
            // ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MeetDialog()),
                );
              },
              leading: Icon(Icons.settings, size: 35),
              title: Text("Met Dialog", style: TextStyle(fontSize: 25)),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MeetDismissible()),
                );
              },
              leading: Icon(Icons.settings, size: 35),
              title: Text("Meet dismissible", style: TextStyle(fontSize: 25)),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MeetExtractWidget()),
                );
              },
              leading: Icon(Icons.settings, size: 35),
              title: Text("Meet Extra widget", style: TextStyle(fontSize: 25)),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MeetFitted()),
                );
              },
              leading: Icon(Icons.settings, size: 35),
              title: Text("Fitted", style: TextStyle(fontSize: 25)),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("Dismissible", style: TextStyle(fontSize: 35)),
      ),
    );
  }
}
