import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mciot_flutterapp_pacman/game/components/ghost.dart';
import 'package:mciot_flutterapp_pacman/game/end_screen.dart';
import 'package:mciot_flutterapp_pacman/game/logic/player.dart';
import 'package:mciot_flutterapp_pacman/game/logic/map_options.dart';
import 'package:mciot_flutterapp_pacman/game/logic/position.dart';

import '../../settings.dart';
import '../logic/direction.dart';

class PacMap extends StatefulWidget {
  PacMap({Key? key}) : super(key: key);
  MapOptions options = MapOptions.smallMap_options;
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<PacMap> {
  Player player = Player(pos: Position(x: 5, y: 5));
  Map<Position, Ghost> ghosts = {Position(x: 1, y: 1): Ghost()};
  Direction _direction = Direction.RIGHT;
  bool gameRunning = true;
  int score = 0;
  bool _pacVisible = false;
  final Map<int, bool> _visible = {};

  void checkForEatableFood() {
    if (_visible[player.pos.y * Settings.currentlySelectedMap.crossAxisCount +
            player.pos.x] ==
        true) {
      setState(() {
        _visible[player.pos.y * Settings.currentlySelectedMap.crossAxisCount +
            player.pos.x] = false;
        score++;
      });
    }
  }

  void start() {
    setFoodVisible();
    Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (!gameRunning) {
        timer.cancel();
      }
      setState(() {
        if (_direction == Direction.RIGHT) {
          player.moveRight();
        } else if (_direction == Direction.LEFT) {
          player.moveLeft();
        } else if (_direction == Direction.DOWN) {
          player.moveDown();
        } else if (_direction == Direction.UP) {
          player.moveUp();
        }
        checkForEatableFood();
        if (score == Settings.currentlySelectedMap.getFoodNumber()) {
          timer.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return ScoreScreen(score: score, won: true);
            }),
          );
        }
      });
    });
    if (score == Settings.currentlySelectedMap.getFoodNumber()) {
      goToEndScreen(true);
    }
  }

  void end() {
    gameRunning = false;
    goToEndScreen(false);
  }

  void goToEndScreen(bool won) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return ScoreScreen(score: score, won: won);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              if (details.delta.dx > 0) {
                setState(() {
                  _direction = Direction.RIGHT;
                });
              } else if (details.delta.dx < 0) {
                setState(() {
                  _direction = Direction.LEFT;
                });
              }
            },
            onVerticalDragUpdate: (details) {
              if (details.delta.dy > 0) {
                setState(() {
                  _direction = Direction.DOWN;
                });
              } else if (details.delta.dy < 0) {
                setState(() {
                  _direction = Direction.UP;
                });
              }
            },
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: widget.options.crossAxisCount,
              children: List<Widget>.generate(
                widget.options.crossAxisCount * widget.options.mainAxisCount,
                (index) {
                  if (player.pos.y * widget.options.crossAxisCount +
                          player.pos.x ==
                      index) {
                    return Visibility(
                        visible: _pacVisible,
                        child: Transform.rotate(
                          angle: _direction.getAngle(),
                          child: player.getWidget(),
                        ));
                  } else if (ghosts.keys.first.y *
                              widget.options.crossAxisCount +
                          ghosts.keys.first.x ==
                      index) {
                    return Visibility(
                        child: Ghost(),
                    visible: _pacVisible,);
                  }
                  return Visibility(
                    visible: _visible[index] ?? false,
                    child: widget.options.getElementWithIndex(index),
                  );
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: TextButton(
                  onPressed: start,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Start",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow, width: 4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: end,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "End",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow, width: 4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Text(
          "Score: $score",
          style: Theme.of(context).textTheme.headline3,
        )),
      ],
    );
  }

  void setFoodVisible() {
    _pacVisible = true;
    for (int i = 0;
        i <
            Settings.currentlySelectedMap.crossAxisCount *
                Settings.currentlySelectedMap.mainAxisCount;
        i++) {
      _visible[i] = true;
    }
  }
}
