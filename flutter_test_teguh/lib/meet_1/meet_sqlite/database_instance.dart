import 'dart:io';
// import 'package:flutter/foundation.dart';
import 'package:flutter_test_teguh/meet_1/meet_sqlite/product_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// import 'path';

class DatabaseInstance {
  final String _databaseName = 'my_database.db';
  final int _databaseVersion = 1;

  //product tabel
  final String table = 'product';
  final String id = 'id';
  final String name = 'name';
  final String category = 'category';
  final String createdAt = 'created_at';
  final String updatedAt = 'updated_at';

  Database? _database;
  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $table (
  $id INTEGER PRIMARY KEY, 
  $name TEXT NULL,
  $category TEXT NULL,
  $createdAt TEXT, 
  $updatedAt TEXT)''');
  }



  Future<List<ProductModel>> all() async {
    final data = await _database!.query(table);
    List<ProductModel> result =
        data.map((e) => ProductModel.fromJson(e)).toList();
    print(result);
    return result;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final query = await _database!.insert(table, row);
    return query;
  }
}
