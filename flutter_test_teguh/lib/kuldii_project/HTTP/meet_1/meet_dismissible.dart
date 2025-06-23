import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_test_teguh/main.dart';


class MeetDismissible extends StatelessWidget {
  final Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Dismissible")),
        body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: 100,
          itemBuilder: (context, index) {
            return Dismissible(
              onDismissed: (direction) {
                print("DISMISSED");
                if (direction == DismissDirection.endToStart) {
                  print("End To Start");
                } else {
                  print("Start To End");
                }
              },
              confirmDismiss: (direction) {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Confirm"),
                      content: Text("Are you sure to delete thi is item ?"),
                      actions: [
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text("Yes"),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text("No"),
                        ),
                      ],
                    );
                  },
                );
              },

              key: Key(index.toString()),
              background: Container(
                color: Colors.red,
                child: Icon(Icons.delete),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 10),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  child: Center(child: Text("${index + 1}")),
                ),
                subtitle: Text(faker.lorem.sentence()),
                title: Text(faker.person.name()),
              ),
            );
          },
        ),
      ),
    );
  }
}
