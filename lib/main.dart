import 'package:flutter/material.dart';
import 'package:portfolio/theme.dart';
import 'package:portfolio/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magnus Freidenfelt',
      debugShowCheckedModeBanner: false,
      theme: customDarkTheme,
      // ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      // )
      home: Home(),
    );
  }
}
