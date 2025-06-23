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
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "Belum Ada data";

  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
      if (response.statusCode == 200) {
        Map<String, dynamic> mybody = jsonDecode(response.body);
        setState(() {
          data =
              "Akun: ${mybody['data']['first_name']} ${mybody['data']['last_name']}";
        });
      } else {
        setState(() {
          data = "Gagal mengambil data";
        });
      }
    } catch (e) {
      setState(() {
        data = "Error: $e";
      });
    }
  }

  Future<void> deleteUser() async {
    try {
      var response =
          await http.delete(Uri.parse("https://reqres.in/api/users/2"));
      if (response.statusCode == 204) {
        setState(() {
          data = "Berhasil menghapus data";
        });
      } else {
        setState(() {
          data = "Gagal menghapus data";
        });
      }
    } catch (e) {
      setState(() {
        data = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP DELETE"),
        actions: [
          IconButton(onPressed: fetchData, icon: Icon(Icons.get_app)),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(data),
          SizedBox(height: 35),
          ElevatedButton(onPressed: deleteUser, child: Text("Delete")),
        ],
      ),
    );
  }
}
