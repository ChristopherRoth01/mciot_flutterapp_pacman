import 'package:flutter/material.dart';
import 'package:mciot_flutterapp_pacman/game/components/ghost.dart';
import 'package:mciot_flutterapp_pacman/game/logic/movement.dart';
import 'package:mciot_flutterapp_pacman/game/logic/position.dart';

import 'direction.dart';


class GhostModel {

  Ghost _ghost = Ghost();
  Position pos;
  late Movement _movement;

  GhostModel(this.pos) {
    _movement = Movement(currentpos: this.pos);
  }

  Ghost getWidget() {
    return _ghost;
  }

  void move(Direction direction) {
    pos = _movement.move(direction);
  }
}