import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final p=await SharedPreferences.getInstance();
  runApp(ThemeApp(initialDark:p.getBool('darkMode')??false));
}
class ThemeApp extends StatefulWidget{
  final bool initialDark; const ThemeApp({super.key,required this.initialDark});
  @override State<ThemeApp> createState()=>_ThemeAppState();
}
class _ThemeAppState extends State<ThemeApp>{
  late bool dark;
  @override void initState(){super.initState();dark=widget.initialDark;}
  Future<void> change(bool v)async{
    final p=await SharedPreferences.getInstance();
    await p.setBool('darkMode',v); setState(()=>dark=v);
  }
  @override Widget build(BuildContext c)=>MaterialApp(
    theme:ThemeData.light(),darkTheme:ThemeData.dark(),
    themeMode:dark?ThemeMode.dark:ThemeMode.light,
    home:Scaffold(appBar:AppBar(title:const Text('Dark Mode')),
      body:SwitchListTile(title:const Text('Dark Mode'),value:dark,onChanged:change)));
}
