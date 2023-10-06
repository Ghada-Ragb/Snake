import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Snake extends StatefulWidget {
  Snake({super.key});

  @override
  State<Snake> createState() => _SnakeState();
}

class _SnakeState extends State<Snake> {
  Timer? timer;
  List<int> snake = [65, 85, 105, 125, 145, 165];

  int food = 465;
  String dir = 'down';

  void StartGame() {
    const duration = Duration(milliseconds: 300);
    timer = Timer.periodic(duration, (timer) {
      setState(() {
        if (dir == 'down') {
          snake.add(snake.last + 20);

          if (snake.last != food) {
            snake.remove(snake.first);
          } else {
            food = Random().nextInt(610);
          }
        } else if (dir == 'up') {
          snake.add(snake.last - 20);

          if (snake.last != food) {
            snake.remove(snake.first);
          } else {
            food = Random().nextInt(610);
          }
        } else if (dir == 'left') {
          snake.add(snake.last - 1);

          if (snake.last != food) {
            snake.remove(snake.first);
          } else {
            food = Random().nextInt(610);
          }
        } else if (dir == 'right') {
          snake.add(snake.last + 1);

          if (snake.last != food) {
            snake.remove(snake.first);
          } else {
            food = Random().nextInt(610);
          }
        }
      });
      GameOver();
    });
  }

  void GameOver() {
    for (int i = 0; i < snake.length - 1; i++) {
      if (snake.last == snake[i]) {
        timer!.cancel();
        snake = [65, 85, 105, 125, 145, 165];
        food = 465;
        dir = 'down';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 610,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 20,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    if (snake.contains(index)) {
                      return Container(
                        color: Color.fromARGB(255, 141, 231, 125),
                      );
                    } else if (index == food) {
                      return Container(
                        color: Color.fromARGB(255, 169, 242, 156),
                      );
                    } else {
                      return Container(
                        color: Color.fromARGB(255, 236, 233, 233),
                      );
                    }
                  }),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Column(
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          if (timer != null) {
                            timer!.cancel();
                          }
                          dir = 'up';
                          StartGame();
                        },
                        child: Icon(
                          Icons.arrow_upward,
                          size: 40,
                        ),
                        backgroundColor: Color.fromARGB(255, 141, 231, 125),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          if (timer != null) {
                            timer!.cancel();
                          }
                          dir = 'down';
                          StartGame();
                        },
                        child: Icon(
                          Icons.arrow_downward,
                          size: 40,
                        ),
                        backgroundColor: Color.fromARGB(255, 141, 231, 125),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: FloatingActionButton(
                    onPressed: () {
                      if (timer != null) {
                        timer!.cancel();
                      }
                      dir = 'left';
                      StartGame();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
                    backgroundColor: Color.fromARGB(255, 141, 231, 125),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: FloatingActionButton(
                    onPressed: () {
                      if (timer != null) {
                        timer!.cancel();
                      }
                      dir = 'right';
                      StartGame();
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      size: 40,
                    ),
                    backgroundColor: Color.fromARGB(255, 141, 231, 125),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
