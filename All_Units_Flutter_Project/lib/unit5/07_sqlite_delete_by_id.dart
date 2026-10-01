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
 final id=TextEditingController();String msg='';
 Future<void>del()async{final d=await DBHelper.db;final n=await d.delete('students',where:'id = ?',whereArgs:[int.parse(id.text)]);setState(()=>msg='$n record(s) deleted');}
 @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Delete Student')),body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[TextField(controller:id,keyboardType:TextInputType.number,decoration:const InputDecoration(labelText:'Student ID')),ElevatedButton(onPressed:del,child:const Text('Delete')),Text(msg)])));
}
