import 'package:flutter/material.dart';

void main () {
  runApp(appBar());
}

class appBar extends StatelessWidget {
  const appBar({super.key});

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
