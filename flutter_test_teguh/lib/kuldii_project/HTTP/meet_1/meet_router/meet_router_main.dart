import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/kuldii_project/HTTP/meet_1/meet_router/gallery_page.dart';
// import 'package:flutter_test_teguh/meet_1/meet_router/meet_router_main.dart';
import 'package:flutter_test_teguh/kuldii_project/HTTP/meet_1/meet_router/meet_router_page.dart';
import 'package:flutter_test_teguh/kuldii_project/HTTP/meet_1/meet_router/photo_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      initialRoute: HomePage.nameRoute,
      routes: {
        HomePage.nameRoute: (context) => HomePage(),
        GalleryPage.nameRoute: (context) => GalleryPage(),
        PhotoPage.nameRoute: (context) => PhotoPage(),
      },
    );
  }
}
