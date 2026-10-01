import 'dart:convert';import 'dart:io';import 'package:flutter/material.dart';import 'package:http/http.dart'as http;import 'package:path_provider/path_provider.dart';
void main()=>runApp(const MaterialApp(home:Demo()));
class Item{int id;String title;Item(this.id,this.title);Map<String,dynamic>toJson()=>{'id':id,'title':title};factory Item.fromJson(Map<String,dynamic>j)=>Item(j['id'],j['title']);}
class Demo extends StatefulWidget{const Demo({super.key});@override State<Demo>createState()=>_S();}
class _S extends State<Demo>{List<Item>items=[];Future<File>get file async{final d=await getApplicationDocumentsDirectory();return File('${d.path}/pipeline.json');}
@override void initState(){super.initState();loadLocal();}
Future<void>saveLocal()async=>(await file).writeAsString(jsonEncode(items.map((e)=>e.toJson()).toList()));
Future<void>loadLocal()async{final f=await file;if(await f.exists()){final l=jsonDecode(await f.readAsString())as List;items=l.map((e)=>Item.fromJson(e)).toList();if(mounted)setState((){});}}
Future<void>fetch()async{final r=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos?_limit=5'));final l=jsonDecode(r.body)as List;items=l.map((e)=>Item.fromJson({'id':e['id'],'title':e['title']})).toList();await saveLocal();setState((){});}
Future<void>edit(Item item)async{item.title='${item.title} (edited locally)';await saveLocal();setState((){});}
Future<void>sync()async{for(final i in items){await http.put(Uri.parse('https://jsonplaceholder.typicode.com/todos/${i.id}'),headers:{'Content-Type':'application/json'},body:jsonEncode(i.toJson()));}if(mounted)ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Local changes re-synced')));}
@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Complete Offline Pipeline'),actions:[IconButton(onPressed:sync,icon:const Icon(Icons.sync))]),floatingActionButton:FloatingActionButton(onPressed:fetch,child:const Icon(Icons.cloud_download)),body:ListView(children:items.map((i)=>ListTile(title:Text(i.title),subtitle:Text('ID ${i.id}'),onTap:()=>edit(i))).toList()));}
