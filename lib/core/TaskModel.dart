import 'package:hive/hive.dart';
part 'TaskModel.g.dart';
@HiveType(typeId: 1)
class Taskmodel{
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String note;
  @HiveField(3)
  String date;
  @HiveField(4)
  String StartTime;
  @HiveField(5)
  String EndTime;
  @HiveField(6)
  int color;
  @HiveField(7)
  bool IsComplete;
  Taskmodel({
    required this.id,
    required this.title,
    required this.note,
    required this.date,
    required this.StartTime,
    required this.EndTime,
    required this.color,
    required this.IsComplete
  });
}