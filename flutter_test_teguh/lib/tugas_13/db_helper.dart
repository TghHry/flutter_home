import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_test_teguh/tugas_13/model.dart';
import 'dart:io';

class DbHelper {
  //Kelas Pengelola DataBase
  static Database?
      _database; //variabel statis untuk menyimpan koneksi database agar tidak dibuka berulang-ulang

  static Future<Database> db() async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  } //Fungsi db() dipakai untuk mengakses database. jika belum dibuat, maka bisa dibuat initdb().

  static Future<Database> _initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'kehadiran.db');
    // mendapatkan path folder penyimpanan lokal
    //gabungkan dengan nama file kehadira.db

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE kehadiran (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT,
            tanggal TEXT,
            waktu TEXT,
            keterangan TEXT
          )
        ''');
      },
    );
  }

  // membuka atau membuat database SQLite
  //tabel kehadiran dibuat dengan 6 kolom, id , nama, tanggal, jam, waktu, keterangan.

// static Future<List<Kehadiran>> getLaporanPerOrang() async {

  //1. deklarasi fungsi
  // static: fungsi ini adalah metode kelas, bisa dipanggil langsung tanpa objeck
  //future <List<Kehadiran>>: mengembalikan future yang berisi List dari objeck kehadiran
  //  async : menandakan fungsi ini berisi operasi asynchronos

// final db = await DbHelper.db();
  // 2. mendapatkan koneksi database
  //await : menunggu sampai koneksi database siap
  //DbHelper.db() : memanggil metode untuk mendapatkan koneksi database
  //hasil disimpan di variabel db 

// final result = await db.query('kehadiran');
  //3. Query data
  //db.query('kehadiran') : mengakses query SQL untuk mengambi semua data dari tabel 'kehadiran'
  //await : menunggu sampai query selesai dieksekusi
  //hasil query disimpan di variabel result(berupa List<Map<String, dynamic>>)

  // 4. konversi hasil ke objeck kehadiran
  //result.map(...) : transformasi setiap elemen dalam List result
  //(e) => kehadiran.fromMap(e) :untuk setiap Map e, konversi menjadi objek kehadiran menggunakan factory constructor FromMap
  //.toList(): mengubah hasil map(yang berupa iterable) menjadi List
 

// Mengapa Sintaks Ini Digunakan?



// static:

// Digunakan karena fungsi ini tidak memerlukan akses ke state instance

// Bisa dipanggil langsung seperti Kehadiran.getLaporanPerOrang()


// Future dan async/await:

// Operasi database adalah I/O bound dan membutuhkan waktu

// async/await membuat kode lebih mudah dibaca dibanding callback/promise

// Menghindari blocking UI thread


// .map().toList():

// Pola fungsional yang efisien untuk transformasi koleksi data

// Lebih ringkas dibanding for-loop manual

// Menggunakan factory constructor fromMap untuk konversi yang konsisten


// Return Type List<Kehadiran>:

// Memberikan type safety

// Memudahkan pemanggil fungsi karena tahu pasti return type-nya

// IDE bisa memberikan autocomplete yang lebih baik


// Alur Eksekusi
// Fungsi dipanggil

// Menunggu koneksi database siap

// Mengeksekusi query SELECT * FROM kehadiran

// Menunggu hasil query

// Mengkonversi setiap baris hasil ke objek Kehadiran

// Mengembalikan List yang berisi semua objek Kehadiran

  static Future<List<Kehadiran>> getLaporanPerOrang() async { 
    final db = await DbHelper.db();
    final result = await db.query('kehadiran');
    return result.map((e) => Kehadiran.fromMap(e)).toList();
  }

  // static Future<void> deleteDatabaseFile() async {
  //   Directory documentsDirectory = await getApplicationDocumentsDirectory();
  //   String path = join(documentsDirectory.path, 'kehadiran.db');
  //   await deleteDatabase(path);
  //   _database = null; // Reset cache database
  // }
}
