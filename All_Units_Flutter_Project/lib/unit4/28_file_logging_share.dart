import 'dart:io';import 'package:flutter/material.dart';import 'package:path_provider/path_provider.dart';import 'package:share_plus/share_plus.dart';
void main()=>runApp(const MaterialApp(home:Demo()));
class Demo extends StatefulWidget{const Demo({super.key});@override State<Demo>createState()=>_S();}
class _S extends State<Demo>{String status='No log yet';Future<File>get log async{final d=await getApplicationDocumentsDirectory();return File('${d.path}/app_log.txt');}
Future<void>addLog()async{final f=await log;await f.writeAsString('${DateTime.now().toIso8601String()} - User opened log screen\n',mode:FileMode.append);setState(()=>status='Log appended');}
Future<void>share()async{final f=await log;if(await f.exists())await SharePlus.instance.share(ShareParams(files:[XFile(f.path)],text:'Application log'));}
@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('File Logger')),body:Center(child:Column(mainAxisSize:MainAxisSize.min,children:[Text(status),ElevatedButton(onPressed:addLog,child:const Text('Append Log')),ElevatedButton(onPressed:share,child:const Text('Export / Share Log'))])));}
