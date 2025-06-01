import 'package:flutter/material.dart';
// import 'package:flutter_test_teguh/main.dart';

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
        appBar: AppBar(
          title: Text("My List"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              title: Text("Sandhika Rahardi"),
              subtitle: Text(
                "This is subtitle okay fjdnfjndidnfidj cdncjdncjndi ducbdyucbduybcdu bscbsuchbs vfhbvuyfebi hfydbubyuds hdycyudbucsab",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/luffy.jpg"),
              ),
              trailing: Text("10.00"),
              dense: true,
            ),
            Divider(),
            ListTile(
              title: Text("Sandhika Rahardi"),
              subtitle: Text("This is subtitle okay..."),
              leading: CircleAvatar(),
              trailing: Text("10.00"),
            ),
            Divider(),
            ListTile(
              title: Text("Sandhika Rahardi"),
              subtitle: Text("This is subtitle okay..."),
              leading: CircleAvatar(),
              trailing: Text("10.00"),
            ),
            Divider(),
            ListTile(
              title: Text("Sandhika Rahardi"),
              subtitle: Text("This is subtitle okay..."),
              leading: CircleAvatar(),
              trailing: Text("10.00"),
            ),
          ],
        ),
      ),
    );
  }
}
