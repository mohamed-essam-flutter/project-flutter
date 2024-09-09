
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/AppColors.dart';
import 'package:taskati/core/TaskModel.dart';
import 'package:taskati/core/cusstom_widget.dart';
import 'package:taskati/core/intro_add_task.dart';
import 'package:taskati/core/naviggator.dart';
import 'package:taskati/services/local_storage.dart';

class AddTask_screen extends StatefulWidget {
  const AddTask_screen({super.key});

  @override
  State<AddTask_screen> createState() => _AddTask_screenState();
}

class _AddTask_screenState extends State<AddTask_screen> {
  int ColorIndex=0;
  String TaskDate=DateFormat.yMd().format(DateTime.now());
  String StartTimeTask=DateFormat('hh:mm a').format(DateTime.now());
  String EndTimeTask=DateFormat('hh:mm a').format(DateTime.now().add(Duration(hours: 2)));
  var TitleController=TextEditingController();
  var NoteController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios_new),color: Appcolors.blue,),
        title: Text('Add Task',style: TextStyle(
          color: Appcolors.blue,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title',style: TextStyle(
                color: Appcolors.black,
                fontSize: 20,
                fontWeight: FontWeight.w800
              ),),
              TextFormField(
                controller:TitleController ,
                decoration: InputDecoration(
                  hintText: 'Enter title here'
                ),
              ),
              Gap(10),
              Text('Note',style: TextStyle(
                color: Appcolors.black,
                fontSize: 20,
                fontWeight: FontWeight.w800
              ),),
              TextFormField(
                controller:NoteController ,
                decoration: InputDecoration(
                  hintText: 'Enter note here'
                ),
              ),
               Gap(10),
              Text('Date',style: TextStyle(
                color: Appcolors.black,
                fontSize: 20,
                fontWeight: FontWeight.w800
              ),),
              TextFormField(
                onTap: () {
                  setState(() {
                    showDatePicker(context: context, firstDate:DateTime.now(), lastDate: DateTime(2044)).then((value) {
                      if(value!=null){
                        TaskDate=DateFormat.yMd().format(value);
                      }
                    },);
                  });
                },
                readOnly: true,
                decoration: InputDecoration(
                  hintText: TaskDate,
                  suffixIcon: Icon(Icons.date_range)
                ),
              ),
              Gap(10),
             Row(
              
              children: [
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Start Time',style: TextStyle(
                color: Appcolors.black,
                fontSize: 20,
                fontWeight: FontWeight.w800
              ),),
              TextFormField(
                onTap: () {
                  setState(() {
                    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                      if(value!=null){
                        StartTimeTask=value.format(context);
                      }
                    },);
                  });
                },
                readOnly: true,
                decoration: InputDecoration(
                  hintText: StartTimeTask,
                  suffixIcon: Icon(Icons.access_alarms)
                ),
              )
                  ],
                )
                ),
                Gap(10),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('End Time',style: TextStyle(
                color: Appcolors.black,
                fontSize: 20,
                fontWeight: FontWeight.w800
              ),),
              TextFormField(
                 onTap: () {
                  setState(() {
                    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                      if(value!=null){
                        EndTimeTask=value.format(context);
                      }
                    },);
                  });
                },
                readOnly: true,
                decoration: InputDecoration(
                  hintText: EndTimeTask,
                  suffixIcon: Icon(Icons.access_alarms)
                ),
              )
                  ],
                )
                )
              ],
             ),
             Gap(10),
             Text('Color',style: TextStyle(
                color: Appcolors.black,
                fontSize: 20,
                fontWeight: FontWeight.w800
              ),),
              Row(
                children: [
                  Expanded(child: Row(
                    children: 
                      List.generate(3, ( index) {
                        return  Padding(
                          padding: const EdgeInsets.all(6),
                          child: InkWell(
                            onTap: () {
                               setState(() {
                                ColorIndex=index;                           
                              });
                            },
                            child: CircleAvatar(
                              radius:20,
                              backgroundColor:(index==0)?
                              Appcolors.blue:
                              (index==1)?
                              Appcolors.red:
                              Appcolors.orange ,
                              child:(ColorIndex==index)? Icon(Icons.check,color: Colors.white,):null
                            ),
                          ),
                        );
                      },)
                    ,
                  )
                  ),
                  custom_button_widget(text: 'Create Task', width: 130, onPressed: (){
                    String id ='${TitleController.text}-${DateTime.now()}';
                    LocalStorage.TaskCacheData(id,Taskmodel(
                      id:id,
                      title: TitleController.text,
                      note: NoteController.text,
                      date: TaskDate,
                      StartTime: StartTimeTask,
                      EndTime: EndTimeTask,
                      color: ColorIndex,
                      IsComplete: false)); 
                      pub_replace(context: context, route: IntroAddTask())     ;    
                  }
                  )
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}