import 'package:flutter/material.dart';
import 'package:flutter_test_teguh/tugas_13/db_helper.dart';

class EditKehadiranPage extends StatefulWidget {
  final Map<String, dynamic> data; // menerima data dari halaman sebelumnya (list)

  EditKehadiranPage({required this.data});

  @override
  _EditKehadiranPageState createState() => _EditKehadiranPageState();
}

class _EditKehadiranPageState extends State<EditKehadiranPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController namaController;
  late TextEditingController keteranganController;
  //mengontrol input form

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.data['nama']);
    keteranganController = TextEditingController(text: widget.data['keterangan']);
  }

  Future<void> _updateData() async { // memperbarui data berdasarkan id
    final db = await DbHelper.db();
    await db.update(
      'kehadiran',
      {
        'nama': namaController.text,
        'keterangan': keteranganController.text,
      },
      where: 'id = ?',      
      whereArgs: [widget.data['id']],  // kenapa pakai where? agar data dapat diubah pda baris tertentu
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Kehadiran')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                controller: keteranganController,
                decoration: InputDecoration(labelText: 'Keterangan'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _updateData,
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Kenapa Pakai Sintaks Ini?
// Sintaks	                       Tujuan	                             Kenapa Dipakai

// sqflite	                      Akses database SQLite	               Ringan, cocok untuk aplikasi lokal
// TextEditingController	        Kontrol form input	                 Supaya bisa isi dan ambil isi textfield
// await db.query(...)   	        Ambil data	                         Query sederhana untuk data list
// await db.rawQuery(...)         Query kustom	                       Bisa pakai GROUP BY, JOIN, dll
// Map<String, Map<String, int>>	Menyusun laporan	                   Supaya bisa tampilkan laporan nested (nama → keterangan → jumlah)
// setState()                   	Refresh UI                           Dibutuhkan agar UI berubah saat data berubah