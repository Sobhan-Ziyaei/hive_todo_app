import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_todo_app/gen/assets.gen.dart';
import 'package:hive_todo_app/ui/constant/colors.dart';
import 'package:hive_todo_app/ui/constant/strings.dart';
import 'package:hive_todo_app/ui/screens/home_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  static const screenId = '/splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateScreen() ;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(Assets.lottie.todoAnim),
              Text(SplashScreenStrings.appTitle,
                  style: theme.textTheme.titleMedium),
              SizedBox(height: size.height * 0.05),
              const SpinKitFoldingCube(
                color: blackColor,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> navigateScreen() async {
    Future.delayed(
      const Duration(seconds: 5),
    ).then(
      (value) {
        Navigator.pushReplacementNamed(context, HomeScreen.screenId);
      },
    );
  }
}
