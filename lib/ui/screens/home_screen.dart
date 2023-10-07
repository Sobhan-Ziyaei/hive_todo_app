import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo_app/gen/assets.gen.dart';
import 'package:hive_todo_app/models/task.dart';
import 'package:hive_todo_app/ui/constant/colors.dart';
import 'package:hive_todo_app/ui/screens/add_task_screen.dart';
import 'package:hive_todo_app/ui/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const screenId = 'home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final taskBox = Hive.box<Task>('taskBox');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: greenColor,
          onPressed: () {
            Navigator.pushNamed(context, AddTaskScreen.screenId);
          },
          child: Assets.images.iconAdd.image(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Center(
            child: ListView.builder(
              itemCount: taskBox.values.length,
              itemBuilder: (context, index) {
                var task = taskBox.values.toList()[index];
                return TaskCard(size: size, theme: theme, task: task);
              },
            ),
          ),
        ),
      ),
    );
  }
}
