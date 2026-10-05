import 'package:flutter/material.dart';

class WidgetPlay extends StatelessWidget {
  String play;

  WidgetPlay({super.key, required this.play});

  @override
  Widget build(BuildContext context) {
    return play == "x" ? Image.asset("assets/images/x.png") : play == "o"
        ? Image.asset("assets/images/o.png"):SizedBox(height: 68,width: 68,);
  }
}
