import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/kuldii_project/HTTP/meet_1/meet_navigator.dart/meet_navigator2.dart';

class PageSatu extends StatelessWidget {
  const PageSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Satu")),
      body: Center(
        child: Text("Ini Page Satu", style: TextStyle(fontSize: 50)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return PageDua();
              },
            ),
          );
        },
        child: Icon(Icons.keyboard_arrow_right),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
