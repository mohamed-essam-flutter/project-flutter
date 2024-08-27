import 'package:flutter/material.dart';

pub({required BuildContext context,required Widget route}){

  Navigator.of(context).push(MaterialPageRoute(builder: (context) => route,));
}
pub_replace({required BuildContext context,required Widget route}){
  
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => route,));
}