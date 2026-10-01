import 'dart:convert';import 'dart:io';import 'package:flutter/material.dart';import 'package:path_provider/path_provider.dart';
void main()=>runApp(const MaterialApp(home:NotesPage()));
class NotesPage extends StatefulWidget{const NotesPage({super.key});@override State<NotesPage>createState()=>_S();}
class _S extends State<NotesPage>{final c=TextEditingController();List<String>notes=[];
Future<File>get f async{final d=await getApplicationDocumentsDirectory();return File('${d.path}/notes.json');}
@override void initState(){super.initState();load();}
Future<void>load()async{final x=await f;if(await x.exists())notes=List<String>.from(jsonDecode(await x.readAsString()));if(mounted)setState((){});}
Future<void>persist()async=> (await f).writeAsString(jsonEncode(notes));
Future<void>add()async{if(c.text.trim().isEmpty)return;notes.add(c.text.trim());c.clear();await persist();setState((){});}
Future<void>edit(int i)async{c.text=notes[i];final value=await showDialog<String>(context:context,builder:(d)=>AlertDialog(title:const Text('Update Note'),content:TextField(controller:c),actions:[TextButton(onPressed:()=>Navigator.pop(d,c.text),child:const Text('Save'))]));if(value!=null){notes[i]=value;await persist();setState((){});}}
Future<void>del(int i)async{notes.removeAt(i);await persist();setState((){});}
@override Widget build(BuildContext x)=>Scaffold(appBar:AppBar(title:const Text('Notes CRUD JSON')),body:Column(children:[Padding(padding:const EdgeInsets.all(8),child:Row(children:[Expanded(child:TextField(controller:c)),IconButton(onPressed:add,icon:const Icon(Icons.add))])),Expanded(child:ListView.builder(itemCount:notes.length,itemBuilder:(x,i)=>ListTile(title:Text(notes[i]),onTap:()=>edit(i),trailing:IconButton(icon:const Icon(Icons.delete),onPressed:()=>del(i)))))]));}
