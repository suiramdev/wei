import 'package:flutter/material.dart';
import 'package:wei/pages/homePage.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
        fontFamily: "Futura Light",
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.w800,
                color: Colors.black87),
            headline2: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w300,
              color: Colors.black38
            )),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xfff70c36)),
      ),
      home: const HomePage(),
    );
  }
}
