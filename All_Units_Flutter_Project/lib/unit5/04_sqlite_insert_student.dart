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
 final name=TextEditingController(text:'Jadav Tushar');final marks=TextEditingController(text:'90');String msg='';
 Future<void>add()async{final d=await DBHelper.db;final id=await d.insert('students',{'name':name.text,'marks':int.parse(marks.text)});setState(()=>msg='Inserted student ID: $id');}
 @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Insert Student')),body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[TextField(controller:name),TextField(controller:marks,keyboardType:TextInputType.number),ElevatedButton(onPressed:add,child:const Text('Insert')),Text(msg)])));
}
