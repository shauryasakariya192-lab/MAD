import 'dart:io';import 'package:flutter/material.dart';import 'package:http/http.dart'as http;import 'package:path_provider/path_provider.dart';
void main()=>runApp(const MaterialApp(home:Demo()));
class Demo extends StatefulWidget{const Demo({super.key});@override State<Demo>createState()=>_S();}
class _S extends State<Demo>{String data='Press Load';Future<File>get cache async{final d=await getApplicationDocumentsDirectory();return File('${d.path}/api_cache.json');}
Future<void>load()async{final f=await cache;try{final r=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));if(r.statusCode!=200)throw Exception();await f.writeAsString(r.body);data='NETWORK\n${r.body}';}catch(e){data=await f.exists()?'CACHED FALLBACK\n${await f.readAsString()}':'No network and no cache';}if(mounted)setState((){});}
@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('JSON Network + Fallback')),body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[ElevatedButton(onPressed:load,child:const Text('Load Data')),Expanded(child:SingleChildScrollView(child:Text(data)))])));}
