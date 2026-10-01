import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
void main()=>runApp(const MaterialApp(home:Demo()));
class Demo extends StatefulWidget{const Demo({super.key});@override State<Demo>createState()=>_S();}
class _S extends State<Demo>{final c=TextEditingController(text:'Jadav Tushar - BCA - Atmiya University');String text='';
Future<File>get file async{final d=await getApplicationDocumentsDirectory();return File('${d.path}/unit5.txt');}
Future<void>write()async{await(await file).writeAsString(c.text);setState(()=>text='File saved');}
Future<void>read()async{final f=await file;text=await f.exists()?await f.readAsString():'File not found';setState((){});}
@override Widget build(BuildContext x)=>Scaffold(appBar:AppBar(title:const Text('File Storage')),body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[TextField(controller:c),Row(children:[ElevatedButton(onPressed:write,child:const Text('Write')),ElevatedButton(onPressed:read,child:const Text('Read'))]),Text(text)])));}
