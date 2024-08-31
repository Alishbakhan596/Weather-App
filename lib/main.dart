import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/home.dart';
import 'package:weather_app/theme.dart';
import 'package:weather_app/theme_provider.dart';
import 'package:weather_app/weather.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Weather(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
