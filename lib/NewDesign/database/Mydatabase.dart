import 'dart:io';

import 'package:mymatrimonyapp/NewDesign/Dashboard/Favourite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MyDataBase {
  Future<Database> initDatabase() async {
    Directory directory = await getApplicationCacheDirectory();
    String path = join(directory.path, 'crudopration.db');
    var db = await openDatabase(path, onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE UserData (
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            FullName TEXT NOT NULL,
            EmailAddress TEXT UNIQUE NOT NULL,
            MobileNumber TEXT NOT NULL,
            DateOfBirth DATE NOT NULL,
            City TEXT NOT NULL,
            Gender TEXT NOT NULL,
            Hobbies TEXT,
            Password TEXT NOT NULL,
            IS_FAVOURITE INTEGER NOT NULL
          );
        ''');
    }, onUpgrade: (db, oldVersion, newVersion) {}, version: 1);
    return db;
  }

  Future<List<Map<String, dynamic>>> selectAllUserData() async {
    Database db = await initDatabase();
    List<Map<String, dynamic>> userData = await db.rawQuery("SELECT * FROM UserData");
    return userData
    ;
  }

  Future<void> insertUserData(Map<String, dynamic> map) async {
    Database db = await initDatabase();
    await db.insert("UserData", map);
  }

  Future<void> updateUserData(Map<String, dynamic> user) async {
    Database db = await initDatabase();
    await db.update("UserData", user, where: "ID = ?", whereArgs: [user["ID"]]);
  }

  Future<void> FavouriteUser(Map<String, dynamic> user) async {
    Database db = await initDatabase();
    await db.update(
      "UserData" ,
      {"IS_FAVOURITE": user["IS_FAVOURITE"]},
      where: "ID = ?",
      whereArgs: [user["ID"]],
    );
  }

  Future<List<Map<String, dynamic>>> getFavoriteUsers() async {
    final db = await initDatabase();
    return await db.query("UserData", where: "IS_FAVOURITE = ?", whereArgs: [1]);
  }

  Future<void> updateFavoriteStatus(int userId, int isFav) async {
    final db = await initDatabase();
    await db.update(
      "UserData",
      {"IS_FAVOURITE": isFav},
      where: "ID = ?",
      whereArgs: [userId],
    );
  }

  Future<dynamic> deleteUserData(int userId) async {
    Database db = await initDatabase();
    await db.delete("UserData", where: "ID = ?", whereArgs: [userId]);
  }
}





