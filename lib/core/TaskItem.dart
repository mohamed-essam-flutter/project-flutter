  import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/AppColors.dart';
import 'package:taskati/core/TaskModel.dart';

@override
class task_item_widget extends StatelessWidget {
   const task_item_widget({
    super.key, required this.model,
  });
  final Taskmodel model;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: model.color==0?
        Appcolors.blue:
         model.color==1?
        Appcolors.red:
        model.color==2?
        Appcolors.orange:
        Colors.green
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(model.title,style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),
                Gap(10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Icon(Icons.alarm_add_outlined,color: Colors.white,),
                    Gap(8),
                    Text('${model.StartTime}-${model.EndTime} ',style: TextStyle(
                      color: Colors.white,
    
                    ),)
                  ],
                ),
                Gap(10),
                Text(model.note,style: TextStyle(
                  color: Colors.white
                ),)
              ],
            ),
            Spacer(),
            Container(
              height: 80,
              width: 1,
              color: Colors.white,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(model.IsComplete?'COMPLETE':'TODO',style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}