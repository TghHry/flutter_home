import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();
  String hasilresponse = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP PUT"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: jobC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Job",
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              var myresponse = await http.put(
                Uri.parse("https://reqres.in/api/users/2"),
                headers: {
                  "Content-Type": "application/json",
                  "x-api-key": "reqres-free-v1" // Ganti dengan kunci API Anda
                },
                body: jsonEncode({"name": nameC.text, "job": jobC.text}),
              );

              // Memeriksa status kode
              if (myresponse.statusCode == 200 || myresponse.statusCode == 204) {
                Map<String, dynamic> data = jsonDecode(myresponse.body);
                setState(() {
                  hasilresponse = "${data['name']} - ${data['job']}";
                });
              } else {
                setState(() {
                  hasilresponse = "Gagal mengirim data: ${myresponse.statusCode}";
                });
              }
            },
            child: Text("SUBMIT"),
          ),
          SizedBox(height: 50),
          Divider(),
          SizedBox(height: 10),
          Text(hasilresponse),
        ],
      ),
    );
  }
}
