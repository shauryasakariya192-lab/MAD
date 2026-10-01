import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  final controller = TextEditingController();
  List<String> items = [];
  @override void initState(){super.initState(); load();}
  Future<void> load() async {
    final p=await SharedPreferences.getInstance();
    if(mounted)setState(()=>items=p.getStringList('items')??[]);
  }
  Future<void> add() async {
    if(controller.text.trim().isEmpty)return;
    final p=await SharedPreferences.getInstance();
    items.add(controller.text.trim()); controller.clear();
    await p.setStringList('items',items); if(mounted)setState((){});
  }
  @override Widget build(BuildContext context)=>Scaffold(
    appBar: AppBar(title: const Text('Persistent List')),
    body: Column(children:[
      Padding(padding: const EdgeInsets.all(12),child: Row(children:[
        Expanded(child:TextField(controller:controller)),
        IconButton(onPressed:add,icon:const Icon(Icons.add))
      ])),
      Expanded(child:ListView.builder(itemCount:items.length,itemBuilder:(c,i)=>ListTile(title:Text(items[i]))))
    ]));

}
