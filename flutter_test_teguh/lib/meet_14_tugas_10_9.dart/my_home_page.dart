import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/meet_14_tugas_10_9.dart/model_widget.dart';
import 'package:flutter_test_teguh/meet_14_tugas_10_9.dart/list_widget.dart';
import 'package:flutter_test_teguh/meet_14_tugas_10_9.dart/list_in_map_widget.dart';

class TugasSembilan extends StatelessWidget {
  const TugasSembilan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 9"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListWidget()),
                    );
                  },
                  child: Text("List"),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListInMapWidget()),
                );
              },
              child: Text("List and Map"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ModelWidget()),
                );
              },
              child: Text("Model Kategori"),
            ),
          ],
        ),
      ),
    );
  }
}