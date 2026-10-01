import 'package:flutter/material.dart';import 'package:http/http.dart'as http;
class CacheEntry{final String data;final DateTime savedAt;CacheEntry(this.data,this.savedAt);bool get valid=>DateTime.now().difference(savedAt).inMinutes<5;}
void main()=>runApp(const MaterialApp(home:Demo()));
class Demo extends StatefulWidget{const Demo({super.key});@override State<Demo>createState()=>_S();}
class _S extends State<Demo>{final Map<String,CacheEntry>cache={};String text='Press Load';
Future<void>load()async{const url='https://jsonplaceholder.typicode.com/todos/1';final old=cache[url];
if(old!=null&&old.valid){text='VALID CACHE\n${old.data}';}else{final r=await http.get(Uri.parse(url));cache[url]=CacheEntry(r.body,DateTime.now());text='FRESH NETWORK DATA\n${r.body}';}setState((){});}
@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('5-Minute Cache')),body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[ElevatedButton(onPressed:load,child:const Text('Load')),Text(text)])));}
