import 'package:flutter/material.dart';

class TugasLima extends StatefulWidget {
  const TugasLima({super.key});

  @override
  State<TugasLima> createState() => _TugasLimaState();
}

class _TugasLimaState extends State<TugasLima> {
  int nilaiTambah = 0;
  bool _showName = false;
  bool _isPressed = false;
  bool _isFavorite = false;
  bool _inkWellText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 5"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            nilaiTambah++;
          });
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showName = !_showName;
                });
              },
              child: Text(_showName ? "Sembunyikan Nama" : "Tampilkan Nama"),
            ),
            SizedBox(height: 20),
            if (_showName) Text("Nama Saya : Teguh Hariyanto"),
            SizedBox(height: 20),
            IconButton(
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: _isFavorite ? Colors.red : Colors.grey,
                )),
            if (_isFavorite) Text("Disukai"),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                setState(() {
                  _isPressed = !_isPressed;
                });
              },
              child: Text("Lihat Selengkapnya"),
            ),
            if (_isPressed)
              Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: Text("He Doop joke a we"),
              ),
            Text("Nilai $nilaiTambah"),
            SizedBox(height: 20),
            InkWell(
              splashColor: Colors.red,
              onTap: () {
                print("Kotak Disentuh");
                setState(() {
                  _inkWellText = !_inkWellText;
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/toyota_gr.jpg",
                    width: 200,
                    height: 200,
                  ),
                  if (_inkWellText)
                    Container(
                      // color: Colors.red,
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Dodge Challenger SRT Hellcat",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            // backgroundColor: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onLongPress: () {
                print("Tekan Lama");
              },
              onTap: () {
                print("Ditekan sekali");
              },
              onDoubleTap: () {
                print("Ditekan Dua Kali");
                print(nilaiTambah);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.red),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.touch_app,
                      color: Colors.white,
                    ),
                    Text(
                      "Tekan Disini",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
