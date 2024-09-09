import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/AppColors.dart';
import 'package:taskati/core/cusstom_widget.dart';
import 'package:taskati/services/local_storage.dart';

class EditprofileScreen extends StatefulWidget {
  const EditprofileScreen({super.key});

  @override
  State<EditprofileScreen> createState() => _EditprofileScreenState();
}

class _EditprofileScreenState extends State<EditprofileScreen> {
  String? path;
  String? name;
  String? editName;
  @override
  void initState() {
    super.initState();
    path=LocalStorage.GetCacheData('image');
    name=LocalStorage.GetCacheData('name');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios_sharp,color: Appcolors.blue)),
        actions: [
          Icon(Icons.sunny,color: Appcolors.blue,),
          Gap(5)
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(50),
                Stack(
                  children: [
                    CircleAvatar(
                      radius:80,
                      backgroundColor: Appcolors.blue,
                      backgroundImage: (path!=null)?
                      FileImage(File(path!)):
                      NetworkImage('https://th.bing.com/th/id/R.1871862d87bb8037d953317fb4497189?rik=MBf1NyuchSQUtQ&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f5%2fProfile.png&ehk=Ouu2uMvvMPnkP1bdIY2BTAzbwhRoG9p03NUzbwGLhlg%3d&risl=&pid=ImgRaw&r=0'),                                      
                    ),
                    Positioned(bottom:0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          showModalBottomSheet(context: context, builder: (context) {
                            return SizedBox(
                              height: 120,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Gap(10),
                                    custom_button_widget(text: 'Up load from Camera', width: double.infinity, onPressed: (){
                                      setState(() {
                                        ImagePicker().pickImage(source: ImageSource.camera).then((value) {
                                          if(value!=null){
                                            path=value.path;
                                          }
                                        },);
                                      });
                                    }),
                                    
                                    custom_button_widget(text: 'Up load from Gallery', width: double.infinity, onPressed: (){
                                       setState(() {
                                        ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
                                          if(value!=null){
                                            path=value.path;
                                            LocalStorage.CacheData('image', path);
                                          }
                                        },);
                                      });
                                    })
                                  ],
                                ),
                              ),
                            );
                          },);
                        });
                      },
                      child: Container(
                        padding:EdgeInsets.all(10) ,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                        ),
                        child: Icon(Icons.camera_alt_rounded,color: Appcolors.blue,),
                      ),
                    )
                    )
                  ],
                  
                ),
                Gap(20),
                Divider(color: Appcolors.blue,),
                Gap(20),
                Row(
                  children: [
                    Text(name!,style: TextStyle(
                      fontSize: 30,
                      color: Appcolors.blue,
                      fontWeight: FontWeight.bold,
                    
                    ),),
                    Spacer(),
                    IconButton.outlined(onPressed: (){
                      setState(() {
                          showModalBottomSheet(context: context, builder: (context) {
                            return SizedBox(
                              height: 140,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Gap(10),
                                    TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                        editName=value;
                                                                              });
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Enter your name',
                                        border:OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                        )
                                      ),
                                    ),
                                    Gap(5),
                                    custom_button_widget(text: 'Edit your name', width: double.infinity, onPressed: (){
                                      setState(() {
                                        name=editName;
                                        LocalStorage.CacheData('name', name);
                                      });
                                    })
                                  ],
                                ),
                              ),
                            );
                          },);
                        });
                    }, icon: Icon(Icons.edit_sharp,color: Appcolors.blue,))
                  ],
                )
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}