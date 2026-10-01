import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void>main()async{WidgetsFlutterBinding.ensureInitialized();await Hive.initFlutter();await Hive.openBox('todoBox');runApp(const MaterialApp(home:Demo()));}
class Demo extends StatefulWidget{const Demo({super.key});@override State<Demo>createState()=>_S();}
class _S extends State<Demo>{final c=TextEditingController();final box=Hive.box('todoBox');
@override Widget build(BuildContext x)=>Scaffold(appBar:AppBar(title:const Text('Hive To-Do Note')),body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[TextField(controller:c),ElevatedButton(onPressed:(){box.put('note',c.text);setState((){});},child:const Text('Save')),Text('Saved: ${box.get('note',defaultValue:'No note')}')])));}
