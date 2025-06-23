import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePageFlexible());
  }
}

class MyHomePageFlexible extends StatelessWidget {
  const MyHomePageFlexible({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flexible & Expanded")),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              // height: 100,
              color: Colors.red,
              // child: Text("Text 1 - perpanjang"),
            ),
          ),

          Expanded(
            // fit: FlexFit.tight,
            flex: 5,
            child: ListView(
              children: [
                Text("Text1"),
                Text("Text1"),
                Text("Text1"),
                Text("Text1"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
