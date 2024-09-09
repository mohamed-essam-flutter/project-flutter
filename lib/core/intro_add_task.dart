import 'dart:developer';
import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/AddTask.dart';
import 'package:taskati/core/AppColors.dart';
import 'package:taskati/core/EditProfile.dart';
import 'package:taskati/core/TaskItem.dart';
import 'package:taskati/core/TaskModel.dart';
import 'package:taskati/core/cusstom_widget.dart';
import 'package:taskati/core/naviggator.dart';
import 'package:taskati/services/local_storage.dart';

class IntroAddTask extends StatefulWidget {
  const IntroAddTask({super.key});


  @override
  State<IntroAddTask> createState() => _IntroAddTaskState();
}

class _IntroAddTaskState extends State<IntroAddTask> {
  String initialSelectedDate=DateFormat.yMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text('Hello , ${LocalStorage.GetCacheData('name')}',style: TextStyle(
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
                  InkWell(
                    onTap: () {
                      pub(context: context, route: EditprofileScreen());
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage:(LocalStorage.GetCacheData('image')!=null)?FileImage(File(LocalStorage.GetCacheData('image')!))
                    : NetworkImage('https://th.bing.com/th/id/R.1871862d87bb8037d953317fb4497189?rik=MBf1NyuchSQUtQ&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f5%2fProfile.png&ehk=Ouu2uMvvMPnkP1bdIY2BTAzbwhRoG9p03NUzbwGLhlg%3d&risl=&pid=ImgRaw&r=0'),
                    ),
                  )
                ],
              ),
              Gap(15),
              Row(
                children: [
                  Text(DateFormat.yMMMMd().format(DateTime.now()),style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700
                  ),),
                  Spacer(),
                  custom_button_widget(text: '+ Add task', width: 120, onPressed: (){
                    pub(context: context, route: AddTask_screen());
                  })
                  
                ],
              ),
              Text('Today',style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700
                  ),),
              Gap(15),
              DatePicker(
                height: 95,
                width: 70,
                 DateTime.now().subtract(Duration(days: 2)),
                   initialSelectedDate: DateTime.now(),
                   selectionColor: Appcolors.blue,
                   selectedTextColor: Colors.white,
                   onDateChange: (date) {
                    setState(() {
                      initialSelectedDate=DateFormat.yMd().format(date);
                    });       
                  },
             ),
             Gap(10),
              Expanded(
                child:ValueListenableBuilder(
                  valueListenable: LocalStorage.TaskBox.listenable(),
                  builder: (context, taskbox, child) {
                    List<Taskmodel> tasks=[];
                    for (var Key in taskbox.keys) {
                    if(initialSelectedDate==LocalStorage.TaskGetCacheData(Key).date){
                    tasks.add(LocalStorage.TaskGetCacheData(Key));

                    }
                    }
                  
                  return tasks.isEmpty?
                   Center(child: 
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      Icon(Icons.check_circle_sharp,size: 100,color: Appcolors.blue,),
                       Gap(10),
                       Text('NO Tasks found',style: TextStyle(fontSize: 25),)
                     ],
                   )):
                   ListView.builder(
                    physics: BouncingScrollPhysics(),
                    // shrinkWrap: true,
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.green,
                      child: Row(
                        children: const [
                          Icon(Icons.check,color: Colors.white,),
                          Gap(5),
                          Text('Complete',style: TextStyle( 
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),)
                        ],
                      ),
                    ),
                    secondaryBackground: Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                      color: Appcolors.red,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(Icons.delete,color: Colors.white,),
                          Gap(5),
                          Text('Delete',style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),)
                        ],
                      ),
                    ),
                    onDismissed: (direction) {
                      if(direction==DismissDirection.endToStart){
                        taskbox.delete(tasks[index].id);
                      }else{
                        taskbox.put(tasks[index].id, Taskmodel(
                          id: tasks[index].id,
                          title:  tasks[index].title,
                          note: tasks[index].note,
                          date: tasks[index].date, 
                          StartTime: tasks[index].StartTime,
                          EndTime: tasks[index].EndTime,
                          color: 3, 
                          IsComplete:true));
                      }
                    },
                    child: task_item_widget(
                      model: tasks[index],
                    ),
                  );
                                });
                  }
                
                ) 
              )

            ],
          ),
        ),
      ),
    );
  }
}


