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
      home: MyHomePageTheme(),
      theme: ThemeData(
        brightness: Brightness.light,
        // visualDensity: VisualDensity.compact,
        // visualDensity: VisualDensity(horizontal: 2, vertical: 2),
        // primarySwatch: Colors.red,
        // primaryColor: Colors.amber,
        // primarySwatch: Colors.blueGrey,
        textTheme: TextTheme(),
        appBarTheme: AppBarTheme(color: Colors.green),
      ),
    );
  }
}

class MyHomePageTheme extends StatelessWidget {
  const MyHomePageTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Apps'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "This is a text",
              style: TextStyle(
                fontSize: 35,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            SizedBox(height: 20),
            Text("This is a text", style: TextStyle(fontSize: 35)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Button", style: TextStyle(fontSize: 35)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.mediation),
      ),
    );
  }
}
