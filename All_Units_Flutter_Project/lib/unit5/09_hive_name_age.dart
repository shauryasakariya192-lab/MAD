import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void>main()async{WidgetsFlutterBinding.ensureInitialized();await Hive.initFlutter();await Hive.openBox('userBox');runApp(const MaterialApp(home:Demo()));}
class Demo extends StatefulWidget{const Demo({super.key});@override State<Demo>createState()=>_S();}
class _S extends State<Demo>{final name=TextEditingController(text:'Jadav Tushar');final age=TextEditingController(text:'20');final box=Hive.box('userBox');
@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Hive User Data')),body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[TextField(controller:name),TextField(controller:age),ElevatedButton(onPressed:(){box.put('name',name.text);box.put('age',int.tryParse(age.text)??0);setState((){});},child:const Text('Save')),Text('Name: ${box.get('name',defaultValue:'Guest')}\\nAge: ${box.get('age',defaultValue:0)}')])));}
