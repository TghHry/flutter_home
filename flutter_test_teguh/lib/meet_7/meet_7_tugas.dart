import 'package:flutter_test_teguh/meet_7/checkBox_custom_7.dart';
import 'package:flutter/material.dart';

class TugasTujuh extends StatefulWidget {
  const TugasTujuh({super.key});

  @override
  State<TugasTujuh> createState() => _TugasTujuhState();
}

class _TugasTujuhState extends State<TugasTujuh> {
  //Checkbox
  final bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("Tugas Tujuh")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Navigator Menu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            buildCheckBox(_isChecked),
            ListTile(title: Text('Item 1'), onTap: () {}),
          ],
        ),
      ),
    );
  }

  Row buildCheckBox(bool? valueCheck) {
    return Row(
      children: [
        CheckBoxCustom(valueCheck: valueCheck),
        // Checkbox(
        //   // fillColor: WidgetStateProperty.all(AppColor.army1),
        //   activeColor: Colors.blue,
        //   checkColor: Colors.white,
        //   shape: BeveledRectangleBorder(), // mengatur bentuk checkbox
        //   side: BorderSide(color: Colors.green, width: 0),
        //   value: valueCheck,
        //   onChanged: (value) {
        //     setState(() {
        //       valueCheck = value ?? false;
        //     });
        //   },
        // ),
        // Text(
        //   _isChecked ? "Sudah bagus" : "Belum bagus",
        //   style: TextStyle(fontSize: 18),
        // ),
      ],
    );
  }
}
