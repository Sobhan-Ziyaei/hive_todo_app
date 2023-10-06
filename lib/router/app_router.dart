import 'package:flutter/material.dart';
import 'package:hive_todo_app/ui/screens/add_task_screen.dart';
import 'package:hive_todo_app/ui/screens/home_screen.dart';
import 'package:hive_todo_app/ui/screens/splash_screen.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      case HomeScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case AddTaskScreen.screenId:
        return MaterialPageRoute(
          builder: (context) => AddTaskScreen(),
        );
      default:
        return null;
    }
  }
}
