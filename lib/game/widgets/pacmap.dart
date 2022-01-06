import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mciot_flutterapp_pacman/game/logic/player.dart';
import 'package:mciot_flutterapp_pacman/game/logic/map_options.dart';
import 'package:mciot_flutterapp_pacman/game/logic/position.dart';
import 'package:mciot_flutterapp_pacman/game/widgets/score.dart';

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
  Direction _direction = Direction.RIGHT;
  bool gameRunning = true;

  void checkForEatableFood() {
    if(!Settings.currentlySelectedMap.getFoodAt(player.pos)!.isEaten()) {
      Settings.currentlySelectedMap.getFoodAt(player.pos)!.eat();

    }
  }
  void start() {
    Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if(!gameRunning) {
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
      });
    });
  }
  void end() {
    gameRunning = false;
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
                    return Transform.rotate(
                      angle: _direction.getAngle(),
                      child: player.getWidget(),
                    );
                  }
                  return widget.options.getElementWithIndex(index);
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Center(
                child: TextButton(
                  onPressed: start,
                  child: Text(
                    "Start!",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: end,
                  child: Text(
                    "End!",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: const Score()),
      ],
    );
  }
}
