import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static late Database database;


  static createDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'cart.db');
    database = await openDatabase(
        path,
        version: 1,
        onCreate: (database, version) {
          database.execute(
              'CREATE TABLE userCart (id INTEGER PRIMARY KEY , username TEXT , item TEXT, qty INTEGER , price REAL)')
              .then((value) {})
              .catchError((error) {});
        },
        onOpen: (database) {
          getDataFromDatabase(database);
    }

    ).then((value) {
      return database = value;
    });
  }

  static insertToDatabase({
    required int id,
    required String username,
    required String item,
    required int qty,
    required double price,

}) async {
    await database.transaction((txn) async {
      txn.rawInsert('INSERT INTO userCart (id,username,item,qty,price) VALUES ($id,"$username","$item",$qty,$price)').then((value) {
        print(value);
      }).catchError((error){
        print(error.toString());
      });
    });
  }

  static var cart = [];
  static Future getDataFromDatabase(Database database) async {
    cart = await database.rawQuery('select id,username,item from userCart where id > 5');
    printFullText(cart.toString());

  }
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

