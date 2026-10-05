import 'package:flutter/material.dart';
import 'package:x_o_game/game_play/widgets/widgetPlay.dart';

import '../core/AppColors.dart';

class Gameplay extends StatelessWidget {
  const Gameplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.lightBlue, AppColors.blue],
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(44),
                  ),
                  child: Center(
                    child: Text(
                      "00:05",
                      style: TextStyle(
                        fontSize: 32,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  "Player 1’s Turn",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 24),
                Expanded(
                  child: Container(

                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(44),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child:
                          Row(
                            children: [
                              Expanded(child: SizedBox(height: 68,width: 68,child: WidgetPlay(play: ""))),
                              VerticalDivider(color: AppColors.black),
                              Expanded(child:   SizedBox(width: 68,height: 68,child:  WidgetPlay(play: ""))),
                              VerticalDivider(color: AppColors.black),
                              Expanded(child: SizedBox(width: 68,height: 68,child:  WidgetPlay(play: ""))),

                            ],
                          ),
                        ),
                        Divider(height: 0,color: AppColors.black
                          ,),
                        Expanded(
                          child:
                          Row(
                            children: [
                              Expanded(child: SizedBox(height: 68,width: 68,child: WidgetPlay(play: ""))),
                              VerticalDivider(color: AppColors.black),
                              Expanded(child:   SizedBox(width: 68,height: 68,child:  WidgetPlay(play: ""))),
                              VerticalDivider(color: AppColors.black),
                              Expanded(child: SizedBox(width: 68,height: 68,child:  WidgetPlay(play: ""))),

                            ],
                          ),
                        ),
                        Divider(height: 0,color: AppColors.black,),
                        Expanded(
                          child:
                          Row(
                            children: [
                              Expanded(child: SizedBox(height: 68,width: 68,child: WidgetPlay(play: ""))),
                              VerticalDivider(color: AppColors.black),
                              Expanded(child:   SizedBox(width: 68,height: 68,child:  WidgetPlay(play: ""))),
                              VerticalDivider(color: AppColors.black),
                              Expanded(child: SizedBox(width: 68,height: 68,child:  WidgetPlay(play: ""))),

                            ],
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
