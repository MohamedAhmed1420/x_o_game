import 'package:flutter/material.dart';
import 'package:x_o_game/start_Screen/StartScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: StartScreen(),
    );
  }
}
