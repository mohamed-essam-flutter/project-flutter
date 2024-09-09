import 'package:flutter/material.dart';
import 'package:taskati/core/AppColors.dart';

class custom_button_widget extends StatelessWidget {
  const custom_button_widget({
    super.key, required this.text, required this.width,  this.hight, required this.onPressed,
  });
  final String text ;
  final double width ;
  final double? hight;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: hight,
      child: ElevatedButton(onPressed: onPressed,style:ElevatedButton.styleFrom(
        backgroundColor: Appcolors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ), child: Text(text,style: TextStyle(
        color: Colors.white
      ),),));
  }
}