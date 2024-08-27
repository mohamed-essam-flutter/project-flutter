import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskati/core/AppColors.dart';

class IntroAddTask extends StatefulWidget {
  const IntroAddTask({super.key});

  @override
  State<IntroAddTask> createState() => _IntroAddTaskState();
}

class _IntroAddTaskState extends State<IntroAddTask> {
  @override
  Widget build(BuildContext context) {
    var Box=Hive.box('UserBox');
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text('Hello , ${Box.get('name')}',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Appcolors.blue
                      ),),
                      Text('Have a nice day',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ))
                    ],
                    
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:(Box.get('image')!=null)?FileImage(File(Box.get('image')!))
                  : NetworkImage('https://th.bing.com/th/id/R.1871862d87bb8037d953317fb4497189?rik=MBf1NyuchSQUtQ&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f5%2fProfile.png&ehk=Ouu2uMvvMPnkP1bdIY2BTAzbwhRoG9p03NUzbwGLhlg%3d&risl=&pid=ImgRaw&r=0'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}