import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main()=>runApp(const MaterialApp(home:Demo()));
class Demo extends StatefulWidget{const Demo({super.key});@override State<Demo>createState()=>_DemoState();}
class _DemoState extends State<Demo>{
final controller=TextEditingController();List<String> queue=[];
@override void initState(){super.initState();load();}
Future<void>load()async{final p=await SharedPreferences.getInstance();queue=p.getStringList('offline_queue')??[];if(mounted)setState((){});}
Future<void>saveOffline()async{final p=await SharedPreferences.getInstance();queue.add(jsonEncode({'form':controller.text,'savedAt':DateTime.now().toIso8601String()}));await p.setStringList('offline_queue',queue);controller.clear();setState((){});}
@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Offline Form Queue')),body:Column(children:[
Padding(padding:const EdgeInsets.all(12),child:TextField(controller:controller)),ElevatedButton(onPressed:saveOffline,child:const Text('Save Unsent Form')),
Expanded(child:ListView.builder(itemCount:queue.length,itemBuilder:(c,i)=>ListTile(title:Text(queue[i]))))]));}
