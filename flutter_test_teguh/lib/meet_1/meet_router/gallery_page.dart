import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/meet_1/meet_router/photo_page.dart';
// import 'package:flutter_test_teguh/meet_1/meet_router/photo_page.dart';

class GalleryPage extends StatelessWidget {
  static const nameRoute = '/gallerypage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gallery Page"), leading: Container()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Gallery Page", style: TextStyle(fontSize: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("<< Back", style: TextStyle(fontSize: 25)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(PhotoPage.nameRoute);
                    // MaterialPageRoute(
                    //   builder: (context) {
                    //     return PhotoPage();
                    //   },
                  },
                  child: Text("Next>>", style: TextStyle(fontSize: 25)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
