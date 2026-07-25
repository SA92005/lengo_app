import 'package:flutter/material.dart';
import 'package:lenguo_app/home_screen.dart';

void main() {
  runApp(const LenguoApp());
}

class LenguoApp extends StatelessWidget {
  const LenguoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: HomeScreen(),
    );
  }
}
