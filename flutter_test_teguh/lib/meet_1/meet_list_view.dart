import 'package:flutter/material.dart';
// import 'package:flutter_test_teguh/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Color> myColor = [
    Colors.red,
    Colors.amber,
    Colors.blue,
    Colors.green,
  ];

  final List <Widget> myList = List.generate(
    100,
    (index) => Text(
      "${index + 1}",
      style: TextStyle(fontSize: 100 + double.parse(index.toString())),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("List view")),
        body: ListView(children: myList),

        // ListView.separated(
        //   separatorBuilder: (context, index) {
        //     return Container(height: 100, color: Colors.white);
        //   },
        //   itemCount: myColor.length,
        //   itemBuilder: (context, index) {
        //     return Container(width: 300, height: 300, color: myColor[index]);
        //   },
        // ),
      ),
    );
  }
}
