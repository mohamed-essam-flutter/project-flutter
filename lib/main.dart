import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/AppColors.dart';
import 'package:taskati/core/TaskModel.dart';
import 'package:taskati/core/home.dart';
import 'package:taskati/core/intro_add_task.dart';
import 'package:taskati/services/local_storage.dart';

Future<void> main() async {
  Hive.registerAdapter(TaskmodelAdapter());
  await Hive.initFlutter();
   await Hive.openBox('UserBox');
   await Hive.openBox<Taskmodel>('TaskBox');
  LocalStorage.init();

  runApp( MainApp());
}

// ignore: must_be_immutable
class MainApp extends StatelessWidget {
   const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode:ThemeMode.light ,
      darkTheme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Appcolors.black
        ),
        scaffoldBackgroundColor: Appcolors.black,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Appcolors.blue
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Appcolors.blue
                      )
                    ),errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Appcolors.red
                      )
                    ),focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Appcolors.red
                      )
                    )
        )
      ) ,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white
        ),
        scaffoldBackgroundColor:Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Appcolors.blue
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Appcolors.blue
                      )
                    ),errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Appcolors.red
                      )
                    ),focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Appcolors.red
                      )
                    )
        )
      ),
      home: LocalStorage.GetCacheData('upload')==true ?const IntroAddTask():home_screen()
      
    );
  }
}
