import 'package:flutter/material.dart';

class MeetDialog extends StatefulWidget {
  @override
  State<MeetDialog> createState() => _MeetDialogState();
}

class _MeetDialogState extends State<MeetDialog> {
  String data = "Belum ada Input";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dialog")),
      body: Center(child: Text(data, style: TextStyle(fontSize: 35))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Telah diklik");
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Center(child: Text("Confirm")),
                content: Text("Are You sure to delete this item ?"),
                actions: [
                  FloatingActionButton(
                    onPressed: () {
                      print("Klik Yes");
                      setState(() {
                        data = "Yes";
                      });

                      Navigator.of(context).pop(true);
                    },
                    child: Text("Yes"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      print("Klik No");

                      setState(() {
                        data = "No";
                      });
                      Navigator.of(context).pop(false);
                    },
                    child: Text("No"),
                  ),
                ],
              );
            },
          ).then((value) => print(value));
        },
        child: Icon(Icons.delete),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
