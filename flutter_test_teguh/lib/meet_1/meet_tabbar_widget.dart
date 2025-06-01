import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Tab> myTab = [
    Tab(text: 'Tab 1', icon: Icon(Icons.access_alarm)),
    Tab(text: 'Tab 2', icon: Icon(Icons.mode_night)),
    Tab(text: 'Tab 3', icon: Icon(Icons.ios_share_outlined)),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("My Apps"),
            bottom: TabBar(
              labelColor: Colors.black,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.blue,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              indicatorColor: Colors.black,
              indicatorWeight: 5,
              indicator: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(50),
                border: Border(top: BorderSide(color: Colors.black, width: 10)),
              ),
              tabs: myTab,
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text("Tab 1", style: TextStyle(fontSize: 40))),
              Center(child: Text("Tab 2", style: TextStyle(fontSize: 40))),
              Center(child: Text("Tab 3", style: TextStyle(fontSize: 40))),
            ],
          ),
        ),
      ),
    );
  }
}
