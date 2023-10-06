import 'package:flutter/material.dart';
import 'package:hive_todo_app/ui/constant/colors.dart';
import 'package:hive_todo_app/ui/constant/strings.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({Key? key}) : super(key: key);
  static const screenId = '/add_task_screen';
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),
                TextField(
                  style: theme.textTheme.bodySmall,
                  decoration: InputDecoration(
                    labelText: AddTaskScreenStrings.taskTitle,
                    labelStyle: theme.textTheme.bodySmall
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: redColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 2,
                        color: greenColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                TextField(
                  maxLines: 2,
                  style: theme.textTheme.bodySmall,
                  decoration: InputDecoration(
                    labelText: AddTaskScreenStrings.taskDescription,
                    labelStyle: theme.textTheme.bodySmall
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: redColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 2,
                        color: greenColor,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(size.width * 0.10, size.height * 0.05),
                    backgroundColor: greenColor,
                  ),
                  onPressed: () {},
                  child: Text(
                    AddTaskScreenStrings.addTask,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: whiteColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
