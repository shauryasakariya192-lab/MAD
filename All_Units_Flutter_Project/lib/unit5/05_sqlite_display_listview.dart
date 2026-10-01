import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;
  static Future<Database> get db async {
    if (_db != null) return _db!;
    final path=join(await getDatabasesPath(),'unit5.db');
    _db=await openDatabase(path,version:1,onCreate:(db,v)async{
      await db.execute('CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price REAL)');
      await db.execute('CREATE TABLE students(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, marks INTEGER)');
    });
    return _db!;
  }
}

void main()=>runApp(const MaterialApp(home:Demo()));
class Demo extends StatefulWidget{const Demo({super.key});@override State<Demo>createState()=>_S();}
class _S extends State<Demo>{
 List<Map<String,dynamic>> rows=[];
 @override void initState(){super.initState();load();}
 Future<void>load()async{final d=await DBHelper.db;rows=await d.query('students');setState((){});}
 @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Student Records'),actions:[IconButton(onPressed:load,icon:const Icon(Icons.refresh))]),body:ListView.builder(itemCount:rows.length,itemBuilder:(c,i)=>ListTile(title:Text(rows[i]['name']),subtitle:Text('Marks: ${rows[i]['marks']}'))));
}
