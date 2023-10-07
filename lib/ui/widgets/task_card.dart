import 'package:flutter/material.dart';
import 'package:hive_todo_app/gen/assets.gen.dart';
import 'package:hive_todo_app/models/task.dart';
import 'package:hive_todo_app/ui/constant/colors.dart';
import 'package:hive_todo_app/ui/constant/strings.dart';

class TaskCard extends StatefulWidget {
  TaskCard({
    super.key,
    required this.size,
    required this.theme,
    required this.task,
  });

  final Size size;
  final ThemeData theme;
  Task task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isDone = false;
  @override
  void initState() {
    super.initState();
    isDone = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.size.height * 0.03),
      width: widget.size.width,
      height: widget.size.height * 0.20,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widget.size.width * 0.03,
            vertical: widget.size.height * 0.02),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Assets.images.banking.image(),
            ),
            SizedBox(width: widget.size.width * 0.02),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.task.title,
                        style: widget.theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        activeColor: greenColor,
                        value: isDone,
                        onChanged: (value) {
                          setState(() {
                            isDone = value!;
                            widget.task.isDone = isDone;
                            widget.task.save();
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: widget.size.height * 0.01),
                  Text(
                    widget.task.description,
                    overflow: TextOverflow.ellipsis,
                    style: widget.theme.textTheme.bodySmall?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: widget.size.width * 0.20,
                        height: widget.size.height * 0.04,
                        decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Assets.images.iconEdit.image(
                              color: whiteColor,
                            ),
                            Text(
                              HomeScreenStrings.modify,
                              style: widget.theme.textTheme.bodySmall?.copyWith(
                                  color: whiteColor,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: widget.size.width * 0.03),
                      Container(
                        width: widget.size.width * 0.20,
                        height: widget.size.height * 0.04,
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Assets.images.iconTime.image(
                              color: whiteColor,
                              height: widget.size.height * 0.02,
                            ),
                            Text(
                              HomeScreenStrings.sampleTime,
                              style: widget.theme.textTheme.bodySmall?.copyWith(
                                  color: whiteColor,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
