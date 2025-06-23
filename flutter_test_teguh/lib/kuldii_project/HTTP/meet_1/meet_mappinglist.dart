import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_test_teguh/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final List<Map<String, dynamic>> myList = [
    {
      "Name": "Sandhika",
      "age": 23,
      "favColor": [
        "Black",
        "Red",
        "Amber",
        "Black",
        "Red",
        "Amber",
        "Black",
        "Red",
        "Amber",
        "Black",
        "Red",
        "Amber"
            "Black",
        "Red",
        "Amber",
      ],
    },
    {
      "Name": "Teguh",
      "age": 25,
      "favColor": [
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
      ],
    },
    {
      "Name": "Yusuf",
      "age": 30,
      "favColor": [
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
      ],
    },
    {
      "Name": "Teguh",
      "age": 25,
      "favColor": [
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
      ],
    },
    {
      "Name": "Teguh",
      "age": 25,
      "favColor": [
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
      ],
    },
    {
      "Name": "Teguh",
      "age": 25,
      "favColor": [
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
      ],
    },
    {
      "Name": "Teguh",
      "age": 25,
      "favColor": [
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
        "Green",
        "Red",
        "Blue",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ID Apps")),
        body: ListView(
          children:
              myList.map((data) {
                // print(data["favColor"]);
                List myfavcolor = data['favColor'];
                return Card(
                  margin: EdgeInsets.all(20),
                  color: Colors.black.withOpacity(0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //row
                      Row(
                        children: [
                          CircleAvatar(),
                          SizedBox(width: 20),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name : ${data['Name']}"),
                                Text("Age : ${data['age']}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        // height: 60,
                        //favColor
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children:
                                myfavcolor.map((color) {
                                  return Container(
                                    color: Colors.amber,
                                    margin: EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 8,
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Text(color),
                                  );
                                }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
