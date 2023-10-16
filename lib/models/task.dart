import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
// to manage easily objects from this class for example save and delete method , this class extends to HiveObjcet
class Task extends HiveObject{
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  bool isDone;

  @HiveField(3)
  TimeOfDay time ;

  Task({
    required this.title,
    required this.description,
    this.isDone = false,
    required this.time
  });
}
