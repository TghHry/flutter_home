import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Fitted Box")),
        body: Center(
          child: Container(
            color: Colors.blue,
            width: 300,
            height: 100,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.network("https://picsum.photos/200/300.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}
