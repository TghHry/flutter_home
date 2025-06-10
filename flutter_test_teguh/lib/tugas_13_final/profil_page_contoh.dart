import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPage extends StatefulWidget {
  final String name;
  final String email;
  final String phone;

  const ProfilPage({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
  }) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Column(
        children: [
          Text("Nama: ${widget.name}"),
          Text("Email: ${widget.email}"),
          Text("Phone: ${widget.phone}"),
        ],
      ),
    );
  }
}
