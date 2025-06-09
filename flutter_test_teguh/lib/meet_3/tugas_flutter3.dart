import 'package:flutter/material.dart';

class TugasTiga extends StatelessWidget {
  const TugasTiga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAE4D5),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Formulir & Galeri",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xffEAE4D5),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(top: 10),
                      child: Center(
                        child: Text(
                          "Formulir",
                          style: TextStyle(fontSize: 24, color: Colors.black87),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                          horizontal: 10, vertical: 8),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          label: Text("Nama"),
                          hint: Text("Masukkan Nama"),
                          fillColor: Color(0xffF2F2F2),
                          filled: true,
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Color(0xffB6B09F), width: 5)),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8,
                        right: 8,
                        bottom: 10,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: Text("Email"),
                          hint: Text("Masukkan Email"),
                          fillColor: Color(0xffF2F2F2),
                          filled: true,
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Color(0xffB6B09F), width: 5)),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8,
                        right: 8,
                        bottom: 10,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          label: Text("Handphone"),
                          hint: Text("Masukkan No Handphone"),
                          fillColor: Color(0xffF2F2F2),
                          filled: true,
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Color(0xffB6B09F), width: 5)),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8,
                        right: 8,
                        bottom: 10,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          label: Text("Deskripsi"),
                          hint: Text("Masukkan Deskripsi"),
                          fillColor: Color(0xffF2F2F2),
                          filled: true,
                          prefixIcon: Icon(Icons.notes),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Color(0xffB6B09F), width: 5)),
                        ),
                      ),
                    ),
                    Divider(color: Colors.black),
                    Center(
                      child: Text(
                        "Galeri",
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ),
                    GridView.count(
                      padding: EdgeInsets.all(15),
                      crossAxisSpacing: 5,
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xffD2D0A0),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 27,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      color: Color(0xffD2D0A0),
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Center(
                                    child: Text(
                                      "Warna 1",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xff73946B),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 27,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Center(
                                    child: Text(
                                      "Warna 2",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xff537D5D),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 27,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Center(
                                    child: Text(
                                      "Warna 3",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xff9EBC8A),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 27,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Center(
                                    child: Text(
                                      "Warna 4",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xff73946B),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 27,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Center(
                                    child: Text(
                                      "Warna 5",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xff73946B),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 27,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Center(
                                    child: Text(
                                      "Warna 6",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
