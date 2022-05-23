import 'package:chat_bf322/views/main_screen.dart';
import 'package:flutter/material.dart';

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
        fontFamily: "Baloo2",
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white
      ),
      home: MainScreen(),
    );
  }
}

