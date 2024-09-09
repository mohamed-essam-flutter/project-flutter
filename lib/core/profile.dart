import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/AppColors.dart';
import 'package:taskati/core/cusstom_widget.dart';
import 'package:taskati/core/intro_add_task.dart';
import 'package:taskati/core/naviggator.dart';
import 'package:taskati/services/local_storage.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? path ;
  String? name;

  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            if(name!=null&&path!=null){
              LocalStorage.CacheData('name',name);
              LocalStorage.CacheData('image',path);
              LocalStorage.CacheData('upload',true);
              pub_replace(context: context, route: IntroAddTask());

            }else if(name==null && path!=null ){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
              Text('Enter your name ..') ));
            }else if(name!=null && path==null ){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
              Text('Upload image ') ));
            }else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
              Text('Upload image and Enter your name') ));
            }
          }, child: Text('Done',style: 
          TextStyle(
            color: Appcolors.blue,
            fontSize: 20
          ),))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage:(path!=null)?FileImage(File(path!))
                  : NetworkImage('https://th.bing.com/th/id/R.1871862d87bb8037d953317fb4497189?rik=MBf1NyuchSQUtQ&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f5%2fProfile.png&ehk=Ouu2uMvvMPnkP1bdIY2BTAzbwhRoG9p03NUzbwGLhlg%3d&risl=&pid=ImgRaw&r=0'),
                ),
                Gap(10),
                custom_button_widget(onPressed: (){
                  ImagePicker().pickImage(source: ImageSource.camera).then((value) {
                    if(value!=null){
                      setState(() {
                        path=value.path;
                      });
                    }
                  },);
                },text: "Up load from camera",width: 200,),
                Gap(5),
                custom_button_widget(text: "Up load from Gallery", width: 200, onPressed: (){
                  ImagePicker().pickImage(source: ImageSource.gallery).then((value){
                    if(value!=null){
                      setState(() {
                        path=value.path;
                      });
                    }
                  });
                }),
                Gap(10),
                Divider(color: Appcolors.blue,),
                Gap(10),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                    name=value;
                    });
                  }, 
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

