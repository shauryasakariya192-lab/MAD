import 'dart:convert'; import 'dart:io';
import 'package:flutter/material.dart'; import 'package:path_provider/path_provider.dart';
void main()=>runApp(const MaterialApp(home:Demo()));
class Student{final String name;final int roll;Student(this.name,this.roll);
Map<String,dynamic>toJson()=>{'name':name,'roll':roll};
factory Student.fromJson(Map<String,dynamic>j)=>Student(j['name'],j['roll']);}
class Demo extends StatefulWidget{const Demo({super.key});@override State<Demo>createState()=>_DemoState();}
class _DemoState extends State<Demo>{
List<Student> students=[]; Future<File>get file async{final d=await getApplicationDocumentsDirectory();return File('${d.path}/students.json');}
Future<void>save()async{students=[Student('Jadav Tushar',15),Student('Riya',16)];
await(await file).writeAsString(jsonEncode(students.map((e)=>e.toJson()).toList()));setState((){});}
Future<void>load()async{final f=await file;if(!await f.exists())return;final l=jsonDecode(await f.readAsString())as List;
students=l.map((e)=>Student.fromJson(e)).toList();setState((){});}
@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Student JSON File')),body:Column(children:[
Row(mainAxisAlignment:MainAxisAlignment.center,children:[ElevatedButton(onPressed:save,child:const Text('Save')),ElevatedButton(onPressed:load,child:const Text('Load'))]),
Expanded(child:ListView(children:students.map((s)=>ListTile(title:Text(s.name),subtitle:Text('Roll ${s.roll}'))).toList()))]));}
