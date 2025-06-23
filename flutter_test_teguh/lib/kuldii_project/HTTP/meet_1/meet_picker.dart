import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePAgeDatePicker());
  }
}

class MyHomePAgeDatePicker extends StatefulWidget {
  @override
  State<MyHomePAgeDatePicker> createState() => _MyHomePAgeDatePickerState();
}

class _MyHomePAgeDatePickerState extends State<MyHomePAgeDatePicker> {
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Date Picker")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectDate.toString(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            OutlinedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: selectDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2030),
                  initialEntryMode: DatePickerEntryMode.input,
                  // selectableDayPredicate: (day) {
                  //   if ((day.isAfter(
                  //         DateTime.now().subtract(Duration(days: 5)),
                  //       )) &&
                  //       (day.isBefore(DateTime.now().add(Duration(days: 2))))) {
                  //     return true;
                  //   }
                  //   return false;
                  // },
                  helpText: "Help text",
                  cancelText: "Cancel text",
                  confirmText: "Confirm Text",
                  fieldHintText: "Masukkan Tanggal lahir anda",
                  fieldLabelText: "field Label Text",
                ).then((value) {
                  if (value != null)
                    setState(() {
                      selectDate = value;
                    });
                });
              },
              child: Text("Date Picker"),
            ),
          ],
        ),
      ),
    );
  }
}
