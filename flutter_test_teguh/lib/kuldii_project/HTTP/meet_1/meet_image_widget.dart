import 'package:flutter/material.dart';
// import 'package:flutter_test_teguh/meet_1/meet_1c.dart';

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
          title: Text("Image Widget"),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            color: Colors.amber,
            width: 350,
            height: 500,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/luffy2.jpg"),
              // image: NetworkImage("https://picsum.photos/"),
            ),
          ),
        ),
      ),
    );
  }
}
