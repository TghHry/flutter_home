
// import 'package:belajar_flutter/Tugas%2011/model/bus_model.dart';
import 'package:flutter_test_teguh/tugas_11_contoh/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Database? _database;

  static Future<Database> db() async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  static Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'jadwal.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE jadwal (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT,
            kelas INTEGER,
            rute TEXT,
            waktu TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertJadwal(JadwalBus jadwal) async {
  final db = await DbHelper.db();
  await db.insert(
    'jadwal',
    jadwal.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}


  static Future<List<JadwalBus>> getAllJadwal() async {
    final db = await DbHelper.db();
    final List<Map<String, dynamic>> maps = await db.query('jadwal');
    return List.generate(maps.length, (i) => JadwalBus.fromMap(maps[i]));
  }

   Future<void> updateJadwal(JadwalBus jadwal) async { //mengubah data peserta berdasarkan id
    final db = await DbHelper.db();  //hanya baris dengan id yang sesuai ynag akan diubah
    await db.update(
      'jadwal',
      jadwal.toMap(),
      where: 'id = ?',
      whereArgs: [jadwal.id],
    );
  }

  Future<void> deleteJadwal(int id) async { //menghapus data dari tabel berdasarkan id
    final db = await DbHelper.db();
    await db.delete(
      'jadwal',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}


  
