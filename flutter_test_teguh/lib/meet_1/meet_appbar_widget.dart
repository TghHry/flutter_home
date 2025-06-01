import 'package:flutter/material.dart';
// import 'package:flutter_test_teguh/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          leading: Container(color: Colors.amberAccent),
          leadingWidth: 50,
          title: Container(height: 35, color: Colors.red),
          actions: [
            Container(color: Colors.purple, width: 35, height: 35),
            Container(color: Colors.black, width: 35, height: 35),
            Container(color: Colors.purple, width: 35, height: 35),
            Container(color: Colors.black, width: 35, height: 35),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(color: Colors.purple, width: 35, height: 35),
          ),
          flexibleSpace: Container(color: Colors.grey, width: 35, height: 350),
        ),
      ),
    );
  }
}
