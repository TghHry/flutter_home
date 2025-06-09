import 'package:flutter_test_teguh/tugas_11/model_peserta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; //untuk membuat path yang sesuai database

class DbHelperPendaftaran { //mengelola database SQlite
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath(); //directory database
    return openDatabase(
      join(dbPath, 'peserta.db'), // gabung path dan nama file ///membuat database peserta.db
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE peserta(id INTEGER PRIMARY KEY AUTOINCREMENT,nama TEXT,email TEXT, kelas TEXT, asal TEXT)',
        ); //id auto nambah dengan int dan nama sampai asal bertipe teks
      },
      version: 1,
    );
  }

  Future<void> insertPendaftaran(Peserta peserta) async { //memanggil database - menyisipkan data peserta ke tabel peserta
    final db = await DbHelperPendaftaran.db(); // perbaikan pemanggilan fungsi
    await db.insert('peserta', peserta.toMap(), //mengubah objek peserta menjadi Map agar bisa disimpan
    conflictAlgorithm: ConflictAlgorithm.replace); // id sama maka data akan diganti
  }

  Future<List<Peserta>> getAllPeserta() async { //mengambil data dari tabel peserta
    final db = await DbHelperPendaftaran.db();
    final List<Map<String, dynamic>> maps = await db.query('peserta'); //mengubah hasil query (list of map) ke list peserta
    return List.generate(
      maps.length,
      (i) => Peserta.fromMap(maps[i]),
    );
  }

  Future<void> updatePeserta(Peserta peserta) async { //mengubah data peserta berdasarkan id
    final db = await DbHelperPendaftaran.db();  //hanya baris dengan id yang sesuai ynag akan diubah
    await db.update(
    'peserta',
    peserta.toMap(),
    where: 'id = ?',
    whereArgs: [peserta.id],
    );
  }

  Future<void> deletePeserta(int id) async { //menghapus data dari tabel berdasarkan id
    final db = await DbHelperPendaftaran.db();
    await db.delete(
      'peserta',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

///kesimpulan :

/// db() membuat database dan tabel
/// insertPendaftaran() menyimpan data baru
/// getAllPeserta() mengambil semua Data
/// updatePeserta() update data berdasarkan id
/// delete peserta() hapus data berdasarkan id