import 'package:flutter/material.dart';import 'package:connectivity_plus/connectivity_plus.dart';import 'package:shared_preferences/shared_preferences.dart';import 'package:http/http.dart'as http;
void main()=>runApp(const MaterialApp(home:Demo()));
class Demo extends StatefulWidget{const Demo({super.key});@override State<Demo>createState()=>_S();}
class _S extends State<Demo>{String status='Waiting for connectivity';late final dynamic sub;
@override void initState(){super.initState();sub=Connectivity().onConnectivityChanged.listen((results){if(!results.contains(ConnectivityResult.none))sync();});}
Future<void>sync()async{final p=await SharedPreferences.getInstance();final records=p.getStringList('pending_records')??[];for(final r in records){await http.post(Uri.parse('https://httpbin.org/post'),body:r);}if(records.isNotEmpty)await p.remove('pending_records');if(mounted)setState(()=>status='Synced ${records.length} offline record(s)');}
@override void dispose(){sub.cancel();super.dispose();}
@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Automatic Background Sync')),body:Center(child:Text(status)));}
