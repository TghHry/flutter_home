import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ProfilPage(),
    );
  }
}

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 50, color: Colors.grey),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nama',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Teguh Hariyanto',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                TextButton(
                  onPressed: () {
                    // Aksi edit
                  },
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Icon(Icons.info, color: Colors.grey),
                SizedBox(width: 8),
                Text('Tentang', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 4),
            Text(
              'Ada',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Divider(),
            Row(
              children: [
                Icon(Icons.phone, color: Colors.grey),
                SizedBox(width: 8),
                Text('Telepon', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 4),
            Text(
              '+62 896-6964-8065',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Divider(),
            Row(
              children: [
                Icon(Icons.link, color: Colors.grey),
                SizedBox(width: 8),
                Text('Tautan', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 4),
            TextButton(
              onPressed: () {
                // Aksi untuk menambah tautan
              },
              child: Text(
                'Tambah tautan',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}