import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoPage extends StatelessWidget {
  static const nameRoute = '/photopage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gallery Page")),
      body: Center(child: Text("Photo Page", style: TextStyle(fontSize: 50))),
    );
  }
}
