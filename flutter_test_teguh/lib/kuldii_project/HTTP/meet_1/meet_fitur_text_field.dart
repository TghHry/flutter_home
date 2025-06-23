import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController myContoller = TextEditingController();

  String hasil = "Hasil Input";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Text Field")),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: myContoller,
                  onChanged: (value) {
                    // setState(() {
                    //    print("ONCHANGE");
                    // hasil = value;
                    // });
                  },
                  onSubmitted: (value) {
                    setState(() {
                      print("ONCHANGE");
                      hasil = value;
                    });
                  },
                  onEditingComplete: () {
                    print("Edit  Sukses");
                    print(myContoller.text);
                  },
                ),
                Text(hasil),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// fitur text field

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("Fitur Text Field")),
//         body: Center(
//           child: Padding(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 TextField(
//                   autocorrect: false,
//                   autofocus: false,
//                   enableSuggestions: true,
//                   enableInteractiveSelection: true,
//                   obscureText: true,
//                   obscuringCharacter: '*',
//                   keyboardType: TextInputType.number,
//                   maxLength: 8,
//                   // readOnly: true,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// decoration text field
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("Fitur Text Field")),
//         body: Center(
//           child: Padding(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 TextField(
//                   showCursor: true,
//                   cursorColor: Colors.red,
//                   // cursorHeight: 25,
//                   // cursorWidth: 10,
//                   // cursorRadius: Radius.circular(20),
//                   textAlign: TextAlign.left,
//                   textAlignVertical: TextAlignVertical.center,
//                   textCapitalization: TextCapitalization.none,
//                   style: TextStyle(color: Colors.red, fontSize: 20),
//                   decoration: InputDecoration(
//                     icon: Icon(Icons.person),
//                     label: Text("Name"),
//                     labelStyle: TextStyle(color: Colors.red),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red),
//                     ),
//                     // prefix: Icon(Icons.person_2),
//                     hintText: "Please input your name",
//                     hintStyle: TextStyle(color: Colors.red),
//                     // prefixText: "Name",
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

// }
