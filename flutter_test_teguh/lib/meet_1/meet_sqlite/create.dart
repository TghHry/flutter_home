import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/meet_1/meet_sqlite/database_instance.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  DatabaseInstance databaseInstance = DatabaseInstance();
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama Produk"),
            TextField(
              controller: nameController,
            ),
            SizedBox(height: 15),
            Text("kategori"),
            TextField(
              controller: categoryController,
            ),
            SizedBox(height: 15),
            ElevatedButton(
                onPressed: () async {
                  await databaseInstance.insert({
                    'name': nameController.text,
                    'category': categoryController.text,
                    'createdAt': DateTime.now().toIso8601String(),
                    'updatedAt': DateTime.now().toIso8601String(),
                  });
                  Navigator.pop(context, true);
                  setState(() {});
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
