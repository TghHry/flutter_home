import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_test_teguh/main.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Date Format")),
        body: Center(
          child: Text(
            DateFormat.yMMMMEEEEd().add_Hms().format(DateTime.now()),
            // DateFormat.yMMMMEEEEd().add_Hms().format(DateTime.now()),
            // DateTime.now().toString(),
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
