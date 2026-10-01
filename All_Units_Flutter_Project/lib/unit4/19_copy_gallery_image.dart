import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
void main()=>runApp(const MaterialApp(home:Demo()));
class Demo extends StatefulWidget{const Demo({super.key});@override State<Demo>createState()=>_DemoState();}
class _DemoState extends State<Demo>{
String message='No image copied';
Future<void>pickAndCopy()async{
 final picked=await ImagePicker().pickImage(source:ImageSource.gallery); if(picked==null)return;
 final dir=await getApplicationDocumentsDirectory();
 final name='copied_${DateTime.now().millisecondsSinceEpoch}.jpg';
 final copied=await File(picked.path).copy('${dir.path}/$name');
 setState(()=>message='Copied to: ${copied.path}');
}
@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Copy Gallery Image')),
body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[ElevatedButton(onPressed:pickAndCopy,child:const Text('Pick Image')),Text(message)])));}
