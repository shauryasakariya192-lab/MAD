import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  String result='Press Load';
  Future<void> load() async {
    const url='https://jsonplaceholder.typicode.com/todos/1';
    if(cache.containsKey(url)){
      result='CACHE HIT\\n${cache[url]}';
    }else{
      final response=await http.get(Uri.parse(url));
      cache[url]=response.body;
      result='NETWORK FETCH\\n${response.body}';
    }
    if(mounted)setState((){});
  }
  @override Widget build(BuildContext context)=>Scaffold(
    appBar:AppBar(title:const Text('Cache First HTTP')),
    body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[
      ElevatedButton(onPressed:load,child:const Text('Load')),
      Expanded(child:SingleChildScrollView(child:Text(result)))
    ])));

}
