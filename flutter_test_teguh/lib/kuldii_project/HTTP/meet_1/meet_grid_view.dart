import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Container> myList = List.generate(400, (index) {
    return Container(
      height: 50,
      width: 50,
      color: Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      ),
    );
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Grid View")),
        // body: GridView(
        //   padding: EdgeInsets.all(40),
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3,
        //     crossAxisSpacing: 20,
        //     mainAxisSpacing: 10,
        //     childAspectRatio: 3 / 4,
        //   ),
        //   children: myList,
        // ),
        body: GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.all(40),
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 4,
          children: myList,
        ),
      ),
    );
  }
}
