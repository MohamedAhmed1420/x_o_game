import 'package:flutter/material.dart';

class WidgetPlay extends StatelessWidget {
  String play;
  int index;
  Function(int value) onTap;

  WidgetPlay({
    super.key,
    required this.play,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap(index);
      },
      child: play == "x"
          ? Image.asset("assets/images/x.png")
          : play == "o"
          ? Image.asset("assets/images/o.png")
          : SizedBox(height: 68, width: 68),
    );
  }
}
