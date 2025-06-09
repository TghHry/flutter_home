import 'package:flutter/material.dart';

class TugasEmpat extends StatelessWidget {
  const TugasEmpat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulir & Produk"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    // fillColor: Colors.black12,
                    // filled: true,
                    label: Text("Nama"),
                    prefixIcon: Icon(Icons.person),
                    hint: Text("Masukkan Nama"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    // fillColor: Colors.lightBlueAccent,
                    // filled: true,
                    label: Text("Email"),
                    prefixIcon: Icon(Icons.email),
                    hint: Text("Masukkan Email"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    // fillColor: Colors.black12,
                    // filled: true,
                    label: Text("Handphone"),
                    prefixIcon: Icon(Icons.phone),
                    hint: Text("Masukkan Nomor Handphone"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    label: Text("Deskripsi"),
                    prefixIcon: Icon(Icons.description),
                    hint: Text("Masukkan Deskripsi"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            Divider(),
            Text(
              "Daftar Produk",
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
            Card(
              elevation: 2,
              color: Colors.white,
              child: ListTile(
                leading: Image.asset(
                  "assets/images/nissan.jpg",
                ),
                title: Text(
                  "    Nissan Skyline R34",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("     Rp2.000.000"),
                trailing: Icon(Icons.arrow_right),
              ),
            ),
            Card(
              elevation: 2,
              color: Colors.white,
              child: ListTile(
                leading: Image.asset("assets/images/nissan2.jpg"),
                title: Text(
                  "Nissan Skyline R34",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Rp2.000.000"),
                trailing: Icon(Icons.arrow_right),
              ),
            ),
            Card(
              elevation: 2,
              color: Colors.white,
              child: ListTile(
                leading: Image.asset("assets/images/supra.jpg"),
                title: Text(
                  "Nissan Skyline R34",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Rp2.000.000"),
                trailing: Icon(Icons.arrow_right),
              ),
            ),
            Card(
              elevation: 2,
              color: Colors.white,
              child: ListTile(
                leading: Image.asset("assets/images/SUV.jpg"),
                title: Text(
                  "Nissan Skyline R34",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Rp2.000.000"),
                trailing: Icon(Icons.arrow_right),
              ),
            ),
            Card(
              elevation: 2,
              color: Colors.white,
              child: ListTile(
                leading: Image.asset(
                  "assets/images/toyota_gr.jpg",
                  fit: BoxFit.cover,
                ),
                title: Text(
                  "Nissan Skyline R34",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Rp2.000.000"),
                trailing: Icon(Icons.arrow_right),
              ),
            ),
            // Spacer(flex: 1),
            SizedBox(height: 80),
            Container(
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.lightBlueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
            ),
          ],
        ),
      ),
    );
  }
}
