import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/word_model.dart';

class DictionaryDatabase {
  final String DB_NAME = "en_vi_dict.db";
  final String TABLE = "en_vi_dict";
  final String ID = "word_id";
  final String WORD = "word";
  final String PRONOUNCE = "pronounce";
  final String MEANING = "meaning";

  static final DictionaryDatabase _instance = DictionaryDatabase._();

  DictionaryDatabase._();

  factory DictionaryDatabase() {
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

  Future<int> addWord(WordModel? word) async {
    var client = await db;
    return client!.insert(TABLE, word!.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<WordModel?> fetchWord(int id) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps =
    client!.query(TABLE, where: '$ID = ?', whereArgs: [id]);

    var maps = await futureMaps;
    if (maps.length != 0) {
      return WordModel.fromJson(maps.first);
    }
    return null;
  }
  Future<WordModel?> fetchWordByWord(String word) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps =
    client!.query(TABLE, where: '$WORD = ?', whereArgs: [word]);

    var maps = await futureMaps;
    if (maps.length != 0) {
      return WordModel.fromJson(maps.first);
    }
    return null;
  }

  Future<List<WordModel>> fetchAll() async {
    var client = await db;
    var res = await client!.query(TABLE);

    if (res.isNotEmpty) {
      var words = res.map((wordMap) => WordModel.fromJson(wordMap)).toList();
      return words;
    }
    return [];
  }

  Future<int> updateWord(WordModel newWord) async {
    var client = await db;
    return client!.update(TABLE, newWord.toJson(),
        where: '$ID = ?', whereArgs: [newWord.word_id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future closeDb() async {
    var client = await db;
    client!.close();
  }

  Future<List<WordModel>> searchEnglishResults(String searchWord) async {
    var client = await db;
    var response = await client!
        .query(TABLE, where: '$WORD like ?', whereArgs: ['$searchWord%%'], limit: 14 );
    List<WordModel> list = response.map((c) => WordModel.fromJson(c)).toList();
    return list;
  }
  
}