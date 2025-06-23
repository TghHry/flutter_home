import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  Color primary = const Color(0xffEEF444C);

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenHeight / 2.5,
            width: screenWidth,
            decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                )),
            child: Center(
              child: Icon(Icons.person,
                  color: Colors.white, size: screenWidth / 5),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenHeight / 15,
              bottom: screenHeight / 20,
            ),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: screenWidth / 18,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: screenWidth / 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: Text(
                    "Employee ID",
                    style: TextStyle(
                      fontSize: screenWidth / 26,
                    ),
                  ),
                ),
                Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(2, 2),
                        ),
                      ]),
                  child: Row(
                    children: [
                      Container(
                        width: screenWidth / 8,
                        child: Icon(Icons.person,
                            color: primary, size: screenWidth / 15),
                      ),
                      Expanded(
                        child: TextFormField(
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: screenHeight / 35,
                              ),
                              border: InputBorder.none,
                              hintText: "Enter your employee id"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
