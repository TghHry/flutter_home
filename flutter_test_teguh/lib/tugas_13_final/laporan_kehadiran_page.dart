import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/tugas_13_final/database/db_helper.dart';
// import 'package:absensi_sederhana/database/db_helper.dart';

class LaporanKehadiranPage extends StatefulWidget {
  static const String id = "/LaporanKehadiranPage";

  @override
  _LaporanKehadiranPageState createState() => _LaporanKehadiranPageState();
}

class _LaporanKehadiranPageState extends State<LaporanKehadiranPage> {
  Map<String, Map<String, int>> laporanPerOrang = {};

  @override
  void initState() {
    super.initState();
    loadLaporan();
  }

  Future<void> loadLaporan() async {
    //query SQLite untuk menghitung absensi setiap orang
    final db = await DbHelper.initDB();
    final result = await db.rawQuery('''
    SELECT nama, keterangan, COUNT(*) as jumlah 
    FROM kehadiran 
    GROUP BY nama, keterangan
    ''');

    setState(() {
      Map<String, Map<String, int>> laporanBaru = {};

      for (var row in result) {
        String nama = row['nama'] as String? ?? '';
        String ket = row['keterangan'] as String? ?? 'Tidak Diketahui';
        int jumlah = row['jumlah'] as int? ?? 0;

        laporanBaru[nama] = laporanBaru[nama] ??
            {}; //membuat struktur Map agar data bisa diakses perorang dan per keterangan
        laporanBaru[nama]![ket] = jumlah;
      }

      laporanPerOrang = laporanBaru;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEFE0),
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.teal[300],
        title: Text(
          "Laporan Kehadiran",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: loadLaporan, icon: Icon(Icons.refresh)),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: laporanPerOrang.length,
        itemBuilder: (context, index) {
          String nama = laporanPerOrang.keys.elementAt(index);
          var data = laporanPerOrang[nama]!;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
              color: Colors.white,
              child: ListTile(
                title: Text(
                  nama,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.person,
                  color: Colors.teal,
                ),
                // trailing: Icon(
                //   Icons.arrow_forward_ios,
                //   color: Colors.teal,
                // ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hadir: ${data['Hadir'] ?? 0}"),
                    Text("Izin: ${data['Izin'] ?? 0}"),
                    Text("Alpha: ${data['Alpha'] ?? 0}"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
