import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/tugas_14/models/user_model.dart'; // Pastikan untuk mengimpor file UserModel

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserModel userModelInstance = UserModel();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  String result = '';
  bool isUserCreated = false;
  int createdUserId = 2; // Simulasi ID user tetap

  void handleCreate() async {
    final res = await userModelInstance.createUser(nameController.text, jobController.text);
    if (res != null) {
      setState(() {
        result = "✅ Created: ${res['name']} - ${res['job']}";
        isUserCreated = true;
      });
    } else {
      setState(() => result = '❌ Gagal create');
    }
  }

  void handleUpdateUser() async {
    final res = await userModelInstance.updateUser(createdUserId, nameController.text, jobController.text);
    if (res != null) {
      setState(() {
        result = "✅ Updated: ${res['name']} - ${res['job']}";
      });
    } else {
      setState(() => result = '❌ Gagal update');
    }
  }

   void handleDelete() async {
    final success = await userModelInstance.deleteUser(createdUserId);
    if (success) {
      setState(() {
        result = "✅ User berhasil dihapus";
        nameController.clear();
        jobController.clear();
        isUserCreated = false;
      });
    } else {
      setState(() => result = '❌ Gagal hapus');
    }
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CRUD dengan HTTP + ReqRes')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: jobController,
              decoration: InputDecoration(labelText: 'Pekerjaan'),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(onPressed: handleCreate, child: Text('Create')),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: isUserCreated ? handleUpdateUser : null,
                  child: Text('Update'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: isUserCreated ? handleDelete : null,
                  child: Text('Delete'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(result),
          ],
        ),
      ),
    );
  }
}


