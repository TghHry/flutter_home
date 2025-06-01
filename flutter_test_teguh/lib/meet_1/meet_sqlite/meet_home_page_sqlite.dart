import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/meet_1/meet_sqlite/create.dart';
import 'package:flutter_test_teguh/meet_1/meet_sqlite/database_instance.dart';
import 'package:flutter_test_teguh/meet_1/meet_sqlite/product_model.dart';

class MyHomePageSqlite extends StatefulWidget {
  const MyHomePageSqlite({super.key});

  @override
  State<MyHomePageSqlite> createState() => _MyHomePageSqliteState();
}

class _MyHomePageSqliteState extends State<MyHomePageSqlite> {
  DatabaseInstance databaseInstance = DatabaseInstance();

  @override
  void initState() {
    databaseInstance.database();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Simple App"),
          actions: [
            IconButton(
  onPressed: () async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateScreen()),
    );
    if (result == true) {
      setState(() {}); // refresh FutureBuilder
    }
  },
  icon: Icon(Icons.add),
),
          ],
        ),
        body: FutureBuilder<List<ProductModel>>(
          future: databaseInstance.all(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.length == 0) {
                return Center(
                  child: Text('Data masih kosong'),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(snapshot.data![index].name ?? ''));
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(color: Colors.green),
              );
            }
          },
        ));
  }
}
