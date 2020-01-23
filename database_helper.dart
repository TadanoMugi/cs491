
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper 
{  
  static final _databaseName = "RFDB.db";
  static final _databaseVersion = 1;

  static final table = 'recipetable';
  
  static final id = '_id';
  static final name = '_name';
  static final image = '_image';
  static final ingredient1 = '_ingredient1';
  static final ingredient2 ='_ingredient2';
  static final ingredient3 ='_ingredient3';
  static final ingredient4 = '_ingredient4';
  static final ingredient5 ='_ingredient5';
  static final ingredient6 ='_ingredient6';
  static final ingredient7 ='_ingredient7';
  static final ingredient8 ='_ingredient8';
  static final ingredient9 ='_ingredient9';
  static final ingredient10 ='_ingredient10';
  static final ingredient11 = '_ingredient11';
  static final ingredient12 = '_ingredient12';
  static final ingredient13 = '_ingredient13';
  static final ingredient14 = '_ingredient14';
  static final ingredient15 = '_ingredient15';
  static final ingredient16 ='_ingredient16';
  static final ingredient17 = '_ingredient17';
  static final ingredient18 = '_ingredient18';
  static final ingredient19 = '_ingredient19';
  static final ingredient20 = '_ingredient20';
  static final ingredient21 = '_ingredient21';
  static final ingredient22 ='_ingredient22';
  static final ingredient23 ='_ingredient23';
  static final ingredient24 ='_ingredient24';
  static final ingredient25 ='_ingredient25';
  static final ingredient26 ='_ingredient26';
  static final ingredient27 ='_ingredient27';
  static final ingredient28 ='_ingredient28';
  static final ingredient29 ='_ingredient29';
  static final ingredient30 ='_ingredient30';
  static final ingredient31 ='_ingredient31';
  static final ingredient32 ='_ingredient32';
  static final ingredient33 ='_ingredient33';
  static final ingredient34 ='_ingredient34';
  static final ingredient35 ='_ingredient35';
  static final ingredient36 ='_ingredient36';
  static final ingredient37 ='_ingredient37';
  static final ingredient38 ='_ingredient38'; 
  static final ingredient39 ='_ingredient39';
  static final ingredient40 ='_ingredient40'; 
  static final rating = '_rating';
  static final numOfReviews = '_numOfReviews';
  static final url = '_url';
  static final urlId = '_urlId';
  static final source = '_source';
  static final prepTime = '_prepTime';
  static final cookingTime = '_cookingTime';
  static final totalTime = '_totalTime';



  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async 
  {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }
  
  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async 
  {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // // SQL code to create the database table
  // Future _onCreate(Database db, int version) async 
  // {
  //   await db.execute('''
  //         CREATE TABLE $table (
  //           $columnId INTEGER PRIMARY KEY,
  //           $columnName TEXT NOT NULL,
  //           $columnAge INTEGER NOT NULL
  //         )
  //         ''');
  // }
  
  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  // Pass all values in the variable row
  // Map : String = column name; dynamic = column value
  Future<int> insert(Map<String, dynamic> row) async 
  {
    Database db = await instance.database;
    return await db.insert(table, row);
    
  }

  // All of the rows are returned as a list of maps, where each map is 
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other 
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is 
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async 
  {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
