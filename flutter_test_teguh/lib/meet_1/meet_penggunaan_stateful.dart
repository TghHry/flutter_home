import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_test_teguh/main.dart';

void main() {
  runApp(Myapp());
}

// class MyApp extends StatelessWidget {
//   int counter = 1;
//   MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("Dynamic Apps")),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,

//           children: [
//             Text(counter.toString(), style: TextStyle(fontSize: 20)),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     counter++;
//                     print(counter);
//                   },
//                   child: Icon(Icons.add),
//                 ),

//                 ElevatedButton(
//                   onPressed: () {
//                     if (counter != 1) {
//                       counter--;
//                     }
//                     print(counter);
//                   },
//                   child: Icon(Icons.remove),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Dynamic Apps")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Text(
              counter.toString(),
              style: TextStyle(fontSize: 20 + double.parse(counter.toString())),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (counter != 0) {
                      setState(() {
                        counter++;
                      });
                    }
                  },
                  child: Icon(Icons.add),
                ),

                ElevatedButton(
                  onPressed: () {
                    if (counter != 1) {
                      setState(() {
                        counter--;
                      });
                    }
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
