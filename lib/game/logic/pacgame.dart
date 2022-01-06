import 'dart:async';

import 'package:mciot_flutterapp_pacman/game/logic/position.dart';

import 'player.dart';
import 'direction.dart';

//TODO: eventually delete

class PacGame {
  Player player = Player(pos: Position(x: 5, y: 5));
  Direction _direction = Direction.RIGHT;
  bool gameRunning = true;
  int numberOfGhosts = 0;
  PacGame({required this.player});

  setDirection(Direction direction) {
    _direction = direction;
  }

  start() {
    Timer.periodic(const Duration(milliseconds: 150), (timer) {
      print("Getting called");
      if (!gameRunning) {
        timer.cancel();
      }
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
  }

  end() {
    gameRunning = false;
  }

  }
