import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo_app/models/task.dart';
import 'package:hive_todo_app/ui/constant/colors.dart';
import 'package:hive_todo_app/ui/constant/strings.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({Key? key,required this.task}) : super(key: key);
  static const screenId = '/edit_task_screen';
  Task task ;
  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final taskBox = Hive.box<Task>('taskBox');
  TextEditingController? titleController ;
  TextEditingController? descriptionController ; 

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    descriptionController = TextEditingController(text: widget.task.description);
  }

  @override
  void dispose() {
    super.dispose();
    titleController!.dispose();
    descriptionController!.dispose();
  }

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
                  controller: titleController,
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
                  controller: descriptionController,
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
                  onPressed: () {
                    editTask(titleController!.text, descriptionController!.text);
                    Navigator.pop(context);
                  },
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

  void editTask(String title, String description) {
    widget.task.title = title ;
    widget.task.description = description ;
    widget.task.save() ;
  }
}
