import 'package:hive/hive.dart';
import 'package:taskati/core/TaskModel.dart';

class LocalStorage{
  static late Box UserBox ;
  static late Box TaskBox ;
  static init(){
   UserBox=Hive.box('UserBox');
   TaskBox=Hive.box<Taskmodel>('TaskBox');

  }
  static CacheData(String key, value){
    UserBox.put(key, value);
  }
  static GetCacheData(String key){
    return UserBox.get(key);
  }
  static  TaskCacheData(String key, Taskmodel value){
    TaskBox.put(key, value);
  }
  static Taskmodel TaskGetCacheData(String key){
    return TaskBox.get(key);
  }
}