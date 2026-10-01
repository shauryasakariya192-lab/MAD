import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
void main()=>runApp(const MaterialApp(home:Demo()));
class Demo extends StatefulWidget{const Demo({super.key});@override State<Demo>createState()=>_S();}
class _S extends State<Demo>{final url='https://picsum.photos/600/400';String status='Load an image';
Future<void>cache()async{final file=await DefaultCacheManager().getSingleFile(url);setState(()=>status='Cached at: ${file.path}');}
Future<void>clear()async{await DefaultCacheManager().emptyCache();setState(()=>status='Image cache cleared');}
@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Image Cache')),body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[
Image.network(url,height:220),ElevatedButton(onPressed:cache,child:const Text('Download / Cache')),ElevatedButton(onPressed:clear,child:const Text('Clear Cache')),Text(status)])));}
