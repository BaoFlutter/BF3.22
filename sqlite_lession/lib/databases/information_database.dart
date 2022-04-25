import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:state_lession/models/information.dart';

class InformationDatabase {
  final String DB_NAME = "information.db";
  final String TABLE = "information";
  final String ID = "id";
  final String AVERAGE_SCORE = "average_score";
  final String ADJUSTMENT = "adjustment";

  static final InformationDatabase _instance = InformationDatabase._();

  InformationDatabase._();

  factory InformationDatabase() {
    return _instance;
  }

  static Database? _database;

  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await init();
    return _database;
  }

  // Có database sẵn
  /*
  Future<Database> init() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, DB_NAME);

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets/databases", DB_NAME));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }
    // open the database
    var db = await openDatabase(path, readOnly: true);
    return db;
  }

   */

  Future<Database> init() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, DB_NAME);

    var database = openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return database;
  }

  void _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $TABLE(
        $ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $AVERAGE_SCORE REAL,
        $ADJUSTMENT TEXT)
    ''');
    print("Database was created!");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    // Run migration according database versions
  }


  Future<int> addInformation(Information? information) async {
    var client = await db;
    return client!.insert(TABLE, information!.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Information?> fetchInformation(int id) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps =
    client!.query(TABLE, where: '$ID = ?', whereArgs: [id]);

    var maps = await futureMaps;
    if (maps.length != 0) {
      return Information.fromJson(maps.first);
    }
    return null;
  }


  Future<List<Information>> fetchAll() async {
    var client = await db;
    var res = await client!.query(TABLE);

    if (res.isNotEmpty) {
      var informations = res.map((wordMap) => Information.fromJson(wordMap)).toList();
      return informations;
    }
    return [];
  }

  Future<int> updateInformation(Information information) async {
    var client = await db;
    return client!.update(TABLE, information.toJson(),
        where: '$ID = ?', whereArgs: [information.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future closeDb() async {
    var client = await db;
    client!.close();
  }


}