import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool statusSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Switch")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.amber,
              width: 1000,
              height: 100,
              child: Switch(
                activeColor: Colors.black,
                inactiveThumbColor: Colors.white,
                value: statusSwitch,
                activeThumbImage: AssetImage("assets/images/true.webp"),
                inactiveThumbImage: AssetImage("assets/images/false.jpg"),
                onChanged: (value) {
                  setState(() {
                    statusSwitch = value;
                  });
                  print(statusSwitch);
                },
              ),
            ),
            // if (statusSwitch == true)
            SizedBox(height: 25),
            Text(
              statusSwitch ? "Switch On" : "Switch Off",
              style: TextStyle(fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }
}
