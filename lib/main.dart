import 'package:flutter/material.dart';
import 'package:tmdb_movie/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
    ),
    home: HomePage(),
    );
  }
}
