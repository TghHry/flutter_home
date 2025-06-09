import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // untuk DateFormat
import 'package:flutter_test_teguh/tugas_13/db_helper.dart';

class TambahKehadiranPage extends StatefulWidget { //StatefulWidget: karena membutuhkan state untuk form input
  @override
  _TambahKehadiranPageState createState() => _TambahKehadiranPageState();
}

class _TambahKehadiranPageState extends State<TambahKehadiranPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();

  String selectedKeterangan = 'Hadir';

  //meyimpan data kehadiran. proses : 1. validasi form
  // 2.dapatkan koneksi database, 3. ambil nilai dari input field, 4. format tanggal sekarang
  //simpan ke tabel 'kehadiran', 6. kembali kehalaman sebelumnya

  void _simpanKehadiran() async {
    if (_formKey.currentState!.validate()) {
      final db = await DbHelper.db();

      String nama = namaController.text;
      String tanggal = DateFormat('yyyy-MM-dd').format(DateTime.now());
      String keterangan = selectedKeterangan;

      await db.insert('kehadiran', {
        'nama': nama,
        'tanggal': tanggal,
        'keterangan': keterangan,
      });

      print(
          'Data yang disimpan: nama=$nama, tanggal=$tanggal, keterangan=$keterangan');

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Kehadiran')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (val) => val!.isEmpty ? 'Wajib diisi' : null,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedKeterangan,
                items: ['Hadir', 'Izin', 'Alpha'].map((status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    selectedKeterangan = val!;
                  });
                },
                decoration: InputDecoration(labelText: 'Keterangan'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _simpanKehadiran,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// Sintaks Penting yang Digunakan

// Final Variables: Variabel yang tidak bisa diubah setelah inisialisasi

// Required Parameters: Parameter wajib di constructor

// Factory Constructor: Constructor khusus untuk membuat objek dari bentuk lain

// Async/Await: Untuk operasi database yang asynchronous

// StatefulWidget: Widget yang bisa berubah state-nya

// GlobalKey<FormState>: Untuk mengontrol form

// TextEditingController: Mengontrol input field

// DateFormat: Memformat tanggal

// DropdownButtonFormField: Input berbentuk dropdown

// setState: Memperbarui tampilan ketika state berubah