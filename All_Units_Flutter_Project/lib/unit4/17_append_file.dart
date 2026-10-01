import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false, home: HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller=TextEditingController(); String log='';
  Future<File> get file async {final d=await getApplicationDocumentsDirectory();return File('${d.path}/log.txt');}
  Future<void> append()async{
    final f=await file; await f.writeAsString('${controller.text}\\n',mode:FileMode.append);
    controller.clear(); log=await f.readAsString(); if(mounted)setState((){});
  }
  @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Append Text')),
    body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[
      TextField(controller:controller),ElevatedButton(onPressed:append,child:const Text('Append')),
      Expanded(child:SingleChildScrollView(child:Text(log)))
    ])));

}
