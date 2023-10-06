import 'package:flutter/material.dart';
import 'package:hive_todo_app/gen/assets.gen.dart';
import 'package:hive_todo_app/ui/constant/colors.dart';
import 'package:hive_todo_app/ui/constant/strings.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const screenId = 'home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Center(
            child: Container(
              width: size.width,
              height: size.height * 0.20,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.02),
                child: Row(
                  children: [
                    Assets.images.banking.image(),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              HomeScreenStrings.sampleTitle,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: size.width * 0.03),
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              activeColor: greenColor,
                              value: true,
                              onChanged: (value) {},
                            )
                          ],
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          HomeScreenStrings.sampleSubTitle,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
