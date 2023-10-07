import 'package:flutter/material.dart';
import 'package:hive_todo_app/gen/assets.gen.dart';
import 'package:hive_todo_app/models/task.dart';
import 'package:hive_todo_app/ui/constant/colors.dart';
import 'package:hive_todo_app/ui/constant/strings.dart';

class TaskCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.03),
      width: size.width,
      height: size.height * 0.20,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.02),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Assets.images.banking.image(),
            ),
            SizedBox(width: size.width * 0.02),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        task.title,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      //SizedBox(width: size.width * 0.10),
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        activeColor: greenColor,
                        value: true,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    task.description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width * 0.20,
                        height: size.height * 0.04,
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
                              style: theme.textTheme.bodySmall?.copyWith(
                                  color: whiteColor,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: size.width * 0.03),
                      Container(
                        width: size.width * 0.20,
                        height: size.height * 0.04,
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Assets.images.iconTime.image(
                              color: whiteColor,
                              height: size.height * 0.02,
                            ),
                            Text(
                              HomeScreenStrings.sampleTime,
                              style: theme.textTheme.bodySmall?.copyWith(
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
