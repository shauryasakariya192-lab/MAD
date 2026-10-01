import 'package:flutter/material.dart';

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

  final Map<String,String> cache={};
  String status='Cache is empty';
  void add(){cache['student']='ansh';setState(()=>status='Cache has ${cache.length} item');}
  void clear(){cache.clear();setState(()=>status='Cache cleared. Next request must fetch fresh data.');}
  @override Widget build(BuildContext context)=>Scaffold(
    appBar:AppBar(title:const Text('Clear Cache')),
    body:Center(child:Column(mainAxisSize:MainAxisSize.min,children:[
      Text(status), ElevatedButton(onPressed:add,child:const Text('Simulate Fetch')),
      ElevatedButton(onPressed:clear,child:const Text('Clear Cache'))
    ])));

}
