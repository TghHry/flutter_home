import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: profilePage(),
    );
  }

  Scaffold profilePage() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Saya"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Teguh Hariyanto",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 30,
              ),
              Text(
                "Jakarta Timur",
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
          Text("Deskipsi : Seorang pelajar yang sedang belajar Flutter"),
        ],
      ),
    );
  }
}
