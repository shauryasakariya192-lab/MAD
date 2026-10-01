import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MaterialApp(home: UsernameApp()));

class UsernameApp extends StatefulWidget {
  const UsernameApp({super.key});
  @override State<UsernameApp> createState() => _UsernameAppState();
}
class _UsernameAppState extends State<UsernameApp> {
  final controller = TextEditingController(text: 'ansh');
  String saved = 'No username saved';
  @override void initState(){super.initState(); load();}
  Future<void> load() async {
    final p=await SharedPreferences.getInstance();
    setState(()=>saved=p.getString('username')??'No username saved');
  }
  Future<void> save() async {
    final p=await SharedPreferences.getInstance();
    await p.setString('username',controller.text); await load();
  }
  @override Widget build(BuildContext c)=>Scaffold(
    appBar:AppBar(title:const Text('Remember Username')),
    body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[
      TextField(controller:controller,decoration:const InputDecoration(labelText:'Username')),
      ElevatedButton(onPressed:save,child:const Text('Save')),
      Text('Saved Username: $saved')
    ])));
}
