import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/result_screen.dart';

const HomeScreenRoute = '/';
const ResultScreenRoute = '/result';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "API Test App",
      onGenerateRoute: _routes(),
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case HomeScreenRoute:
          screen = HomeScreen();
          break;
        case ResultScreenRoute:
          screen = ResultScreen(arguments['input']);
          break;
        default:
          return null;
          break;
      }
      return MaterialPageRoute(
        builder: (BuildContext context) => screen,
      );
    };
  }

  ThemeData _theme() {
    return ThemeData(
        appBarTheme: AppBarTheme(
            // textTheme:
            ));
  }
}
