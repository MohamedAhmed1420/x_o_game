import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:x_o_game/game_play/widgets/widgetPlay.dart';

import '../core/AppColors.dart';

class Gameplay extends StatefulWidget {
  bool isXPlay;

  Gameplay({super.key, required this.isXPlay});

  @override
  State<Gameplay> createState() => _GameplayState();
}

class _GameplayState extends State<Gameplay> {
  List<String> gameBoard = ["", "", "", "", "", "", "", "", ""];
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
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
                    child: StreamBuilder(
                      stream: _stopWatchTimer.rawTime,
                      builder: (context, snapshot) {
                        var value=snapshot.data;
                        var disPlayTime=StopWatchTimer.getDisplayTime(value!);
                        return Text(
                          disPlayTime,
                          style: TextStyle(
                            fontSize: 32,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },

                    ),
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  "Player ${widget.isXPlay ? "X" : "O"}’s Turn",
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
                          child: Row(
                            children: [
                              Expanded(
                                child: WidgetPlay(
                                  onTap: onTapPlay,
                                  index: 0,
                                  play: gameBoard[0],
                                ),
                              ),
                              VerticalDivider(color: AppColors.black),
                              Expanded(
                                child: WidgetPlay(
                                  onTap: onTapPlay,
                                  index: 1,
                                  play: gameBoard[1],
                                ),
                              ),
                              VerticalDivider(color: AppColors.black),
                              Expanded(
                                child: WidgetPlay(
                                  onTap: onTapPlay,
                                  index: 2,
                                  play: gameBoard[2],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 0, color: AppColors.black),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: WidgetPlay(
                                  onTap: onTapPlay,
                                  index: 3,
                                  play: gameBoard[3],
                                ),
                              ),
                              VerticalDivider(color: AppColors.black),
                              Expanded(
                                child: WidgetPlay(
                                  onTap: onTapPlay,
                                  index: 4,
                                  play: gameBoard[4],
                                ),
                              ),
                              VerticalDivider(color: AppColors.black),
                              Expanded(
                                child: WidgetPlay(
                                  onTap: onTapPlay,
                                  index: 5,
                                  play: gameBoard[5],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 0, color: AppColors.black),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: WidgetPlay(
                                  onTap: onTapPlay,
                                  index: 6,
                                  play: gameBoard[6],
                                ),
                              ),
                              VerticalDivider(color: AppColors.black),
                              Expanded(
                                child: WidgetPlay(
                                  onTap: onTapPlay,
                                  index: 7,
                                  play: gameBoard[7],
                                ),
                              ),
                              VerticalDivider(color: AppColors.black),
                              Expanded(
                                child: WidgetPlay(
                                  onTap: onTapPlay,
                                  index: 8,
                                  play: gameBoard[8],
                                ),
                              ),
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

  String winner = "";
  int count = 0;

  void onTapPlay(int index) {
    if (gameBoard[index].isNotEmpty) {
      return;
    }
    count++;
    if(count==1){
      _stopWatchTimer.onStartTimer();
    }
    if (widget.isXPlay) {
      gameBoard[index] = "x";
      widget.isXPlay = false;
    } else {
      gameBoard[index] = "o";
      widget.isXPlay = true;
    }

    setState(() {});
    checkWinner();

    if (count == 9 && winner.isEmpty) {
      gameBoard = ["", "", "", "", "", "", "", "", ""];
      winner = "";
      count = 0;
      _stopWatchTimer.onResetTimer();
      setState(() {});
    }
    if (winner.isNotEmpty) {
      _stopWatchTimer.onStopTimer();
      showModalBottomSheet(
        showDragHandle: true,
        context: context,
        builder: (context) {
          return Column(
            children: [
              Center(
                child: WidgetPlay(
                  play: winner,
                  index: index,
                  onTap: (value) {},
                ),
              ),
            ],
          );
        },
      ).then((value) {
        gameBoard = ["", "", "", "", "", "", "", "", ""];
        winner = "";
        count = 0;

        _stopWatchTimer.onResetTimer();
        setState(() {});
      });
    }
  }

  void checkWinner() {
    for (int i = 0; i < 9; i += 3) {
      if (gameBoard[i] == "x" &&
          gameBoard[i + 1] == "x" &&
          gameBoard[i + 2] == "x") {
        winner = "x";
        return;
      }
      if (gameBoard[i] == "o" &&
          gameBoard[i + 1] == "o" &&
          gameBoard[i + 2] == "o") {
        winner = "o";
        return;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (gameBoard[i] == "x" &&
          gameBoard[i + 3] == "x" &&
          gameBoard[i + 6] == "x") {
        winner = "x";
        return;
      }
      if (gameBoard[i] == "o" &&
          gameBoard[i + 3] == "o" &&
          gameBoard[i + 6] == "o") {
        winner = "o";
        return;
      }
    }
    if (gameBoard[0] == "x" && gameBoard[4] == "x" && gameBoard[8] == "x") {
      winner = "x";
      return;
    }
    if (gameBoard[0] == "o" && gameBoard[4] == "o" && gameBoard[8] == "o") {
      winner = "o";
      return;
    }
    if (gameBoard[2] == "x" && gameBoard[4] == "x" && gameBoard[6] == "x") {
      winner = "x";
      return;
    }
    if (gameBoard[2] == "o" && gameBoard[4] == "o" && gameBoard[6] == "o") {
      winner = "o";
      return;
    }
  }
}
