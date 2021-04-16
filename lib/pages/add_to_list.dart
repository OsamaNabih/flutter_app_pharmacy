import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class drug {
   int id;
   String drug_name ;
   int quantity;
   String price;
   int client_id;

   drug({this.id , this.drug_name , this.quantity , this.price , this.client_id});


  Map< String , dynamic> toMap() {
    return {
      'id': id,
      'drug_name': drug_name,
      'quantity': quantity,
      'price' :price ,
      'client_id' : client_id
    };
  }
  getprice(){
    print(this.id);
  }

   createDatabase() async {
     String databasesPath = await getDatabasesPath();
     String dbPath = join(databasesPath, 'list.db');
     var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
     return database;
   }
   void populateDb(Database database, int version) async {
     await database.execute("CREATE TABLE drug (id INTEGER PRIMARY KEY,drug_name TEXT,quantity INTEGER ,price TEXT,client_id  INTEGER)");
     print("done");

}
   Future<void> insertdrug(drug drug) async {
     // Get a reference to the database.
     final Database db = await createDatabase();

     await db.insert(
       'drug',
       drug.toMap(),
       conflictAlgorithm: ConflictAlgorithm.replace,
     );
   }
   Future<List<drug>> get_drugs() async {
     // Get a reference to the database.
     final Database db = await createDatabase();

     // Query the table for all The Dogs.
     final List<Map<String, dynamic>> maps = await db.query('drug');

     // Convert the List<Map<String, dynamic> into a List<Dog>.
     return List.generate(maps.length, (i) {
       return drug(
         id: maps[i]['id'],
         drug_name: maps[i]['drug_name'],
         quantity: maps[i]['quantity'],
         price: maps[i]['price'],
         client_id: maps[i]['client_id'],
       );
     });
   }

}
void pro()async{
  drug l=drug(id:1,drug_name:"flu",quantity:2,price:"55",client_id:2);
  await l.insertdrug(l);
  List<drug> ll =await l.get_drugs();
  print(ll[0].drug_name);
}
void main () {
  WidgetsFlutterBinding.ensureInitialized();
  pro();
}