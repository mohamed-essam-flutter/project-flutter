import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/naviggator.dart';
import 'package:taskati/core/profile.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  void initState() {
    
    super.initState(
    );
    Future.delayed(const Duration(seconds: 3),() =>
      pub_replace(context: context, route: Profile())
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/task_animation.json'),
            Text('Taskati',style: GoogleFonts.poppins(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
            Gap(10),
            Text('its Time to Get Organized',style: TextStyle(color: Colors.grey,fontSize: 17),)
            
          ],
        ),
      )
    );
  }
}