import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/home.dart';
import 'package:taskati/core/intro_add_task.dart';

Future<void> main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('UserBox');

  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});
  var Box=Hive.box('UserBox');

  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Box.get('upload')==true ?home_screen():IntroAddTask()
    );
  }
}
