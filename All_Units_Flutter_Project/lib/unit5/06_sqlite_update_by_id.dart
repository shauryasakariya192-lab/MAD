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
 final id=TextEditingController();final name=TextEditingController(text:'Jadav Tushar');final marks=TextEditingController(text:'95');String msg='';
 Future<void>update()async{final d=await DBHelper.db;final n=await d.update('students',{'name':name.text,'marks':int.parse(marks.text)},where:'id = ?',whereArgs:[int.parse(id.text)]);setState(()=>msg='$n record(s) updated');}
 @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Update Student')),body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[TextField(controller:id,decoration:const InputDecoration(labelText:'ID')),TextField(controller:name),TextField(controller:marks),ElevatedButton(onPressed:update,child:const Text('Update')),Text(msg)])));
}
