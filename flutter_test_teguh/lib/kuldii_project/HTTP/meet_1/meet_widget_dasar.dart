import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text("My Apps"),
          centerTitle: true,
          backgroundColor: Colors.grey[400],
        ),
        body: Center(
          child: Text(
            "Halortcghfghkvkkhuirtdgghcooooooo0ooooooooooooo00s",
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              backgroundColor: Colors.blue,
              letterSpacing: 11,
              decorationStyle: TextDecorationStyle.wavy,
              decoration: TextDecoration.underline,
              decorationColor: Colors.amber,
              decorationThickness: 5,
              fontFamily: 'Stick',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
