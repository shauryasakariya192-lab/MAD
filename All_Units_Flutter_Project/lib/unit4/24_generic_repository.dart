import 'package:flutter/material.dart';
abstract class LocalDataSource<T>{Future<List<T>>load();Future<void>save(List<T>items);}
abstract class RemoteDataSource<T>{Future<List<T>>fetch();}
class MemoryLocal<T> implements LocalDataSource<T>{List<T>data=[];@override Future<List<T>>load()async=>data;@override Future<void>save(List<T>items)async=>data=List.of(items);}
class MockRemote implements RemoteDataSource<String>{@override Future<List<String>>fetch()async=>['Flutter','Dart','Offline Data'];}
class Repository<T>{final LocalDataSource<T>local;final RemoteDataSource<T>remote;Repository(this.local,this.remote);
Future<List<T>>getItems()async{final cached=await local.load();if(cached.isNotEmpty)return cached;final fresh=await remote.fetch();await local.save(fresh);return fresh;}}
void main()=>runApp(const MaterialApp(home:Demo()));
class Demo extends StatelessWidget{const Demo({super.key});@override Widget build(BuildContext c){final repo=Repository<String>(MemoryLocal(),MockRemote());return Scaffold(appBar:AppBar(title:const Text('Generic Repository')),body:FutureBuilder<List<String>>(future:repo.getItems(),builder:(c,s)=>ListView(children:(s.data??[]).map((e)=>ListTile(title:Text(e))).toList())));}}
