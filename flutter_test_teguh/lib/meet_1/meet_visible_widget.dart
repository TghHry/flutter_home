import 'package:flutter/material.dart';
// import 'package:flutter_test_teguh/main.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Column"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(color: Colors.green, height: 400, width: 400),
            Container(color: Colors.blue, height: 300, width: 300),
            Container(color: Colors.amber, height: 200, width: 200),
            Container(color: Colors.red, height: 100, width: 100),
          ],
        ),
      ),
    );
  }
}
