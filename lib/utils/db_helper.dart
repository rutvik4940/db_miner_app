import 'dart:io';

import 'package:db_miner_app/screen/category_model/category_model.dart';
import 'package:db_miner_app/screen/db_model/dp_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
 static DBHelper helper = DBHelper._();
  DBHelper._();

  Database? database;

  Future<Database>? checkbb() async {
    if (database != null) {
      return database!;
    } else {
      return await initdb();
    }
  }

  Future<Database> initdb() async {
    Directory dir = await getApplicationSupportDirectory();
    String path = join(dir.path, "rutvik.db");

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String quotesQuery =
            "CREATE TABLE quotes (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,author TEXT,quotes TEXT)";
        String categoryQuery="CREATE TABLE category (id INTEGER PRIMARY KEY AUTOINCREMENT,category TEXT)";
        db.execute(quotesQuery);
        db.execute(categoryQuery);
      },
    );
  }

  Future<void> insertQuery(dbModel model) async {
    database = await checkbb();
    database!.insert(
      "quotes",
      {
        "name": model.name,
        "author": model.author,
        "quotes": model.quotes,
      },
    );
  }
 Future<List<dbModel>>? readQuery()
  async {
    database= await checkbb();
    String quotes= "SELECT * FROM quotes";
    List<Map>list=await database!.rawQuery(quotes);
    List<dbModel> l1=list.map((e) => dbModel.mapToModel(e)).toList();
    return l1;
  }
  Future<void> deleteQuery(int id)
  async {
    database=await checkbb();
    database!.delete("quotes",where: "id=?",whereArgs: [id]);
  }

 Future<void> insertcategory(categoryModel model) async {
   database = await checkbb();
   database!.insert(
     "category",
     {
       "category":model.name,
     },
   );
 }
 Future<List<categoryModel>>? readcategory()
 async {
   database= await checkbb();
   String category= "SELECT * FROM category";
   List<Map>list=await database!.rawQuery(category);
   List<categoryModel> l2=list.map((e) => categoryModel.mapToModel(e)).toList();
   return l2;
 }
 Future<void> deletecategory(int id)
 async {
   database=await checkbb();
   database!.delete("category",where: "id=?",whereArgs: [id]);
 }
}
