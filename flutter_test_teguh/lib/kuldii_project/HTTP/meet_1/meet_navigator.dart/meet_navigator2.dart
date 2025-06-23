// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_test_teguh/meet_1/meet_navigator.dart/meet_navigator1.dart';

class PageDua extends StatelessWidget {
  const PageDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Dua")),
      body: Center(child: Text("Ini Page Dua", style: TextStyle(fontSize: 50))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.keyboard_arrow_left),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
