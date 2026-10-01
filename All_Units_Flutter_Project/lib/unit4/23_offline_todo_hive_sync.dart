import 'dart:convert';import 'package:flutter/material.dart';import 'package:hive_flutter/hive_flutter.dart';import 'package:connectivity_plus/connectivity_plus.dart';import 'package:http/http.dart'as http;
Future<void>main()async{WidgetsFlutterBinding.ensureInitialized();await Hive.initFlutter();await Hive.openBox('todos');runApp(const MaterialApp(home:Todo()));}
class Todo extends StatefulWidget{const Todo({super.key});@override State<Todo>createState()=>_S();}
class _S extends State<Todo>{final c=TextEditingController();late Box box;
@override void initState(){super.initState();box=Hive.box('todos');}
Future<void>add()async{await box.add({'title':c.text,'synced':false});c.clear();setState((){});}
Future<void>sync()async{final r=await Connectivity().checkConnectivity();if(r.contains(ConnectivityResult.none))return;
for(final key in box.keys){final item=Map<String,dynamic>.from(box.get(key));if(item['synced']!=true){final res=await http.post(Uri.parse('https://jsonplaceholder.typicode.com/todos'),headers:{'Content-Type':'application/json'},body:jsonEncode({'title':item['title']}));if(res.statusCode<300){item['synced']=true;await box.put(key,item);}}}setState((){});}
@override Widget build(BuildContext x)=>Scaffold(appBar:AppBar(title:const Text('Offline-first To-Do'),actions:[IconButton(onPressed:sync,icon:const Icon(Icons.sync))]),body:Column(children:[Row(children:[Expanded(child:TextField(controller:c)),IconButton(onPressed:add,icon:const Icon(Icons.add))]),Expanded(child:ListView(children:box.keys.map((k){final m=Map<String,dynamic>.from(box.get(k));return ListTile(title:Text(m['title']),subtitle:Text(m['synced']?'Synced':'Offline'));}).toList()))]));}
