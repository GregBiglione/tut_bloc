import 'package:flutter/material.dart';
import 'package:tut_bloc/presentation/home_screen.dart';
import 'package:tut_bloc/presentation/second_screen.dart';
import 'package:tut_bloc/presentation/third_screen.dart';

class AppRoute {
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
              title: "HomeScreen",
              color: Colors.blueAccent,
          ),
        );
      case "/second":
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
              title: "SecondScreen",
              color: Colors.redAccent,
          ),
        );
      case "/third":
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
              title: "ThirdScreen",
              color: Colors.greenAccent,
          ),
        );
      default:
        return null;
    }
  }
}