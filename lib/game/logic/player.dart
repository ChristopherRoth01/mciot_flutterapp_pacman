import 'package:mciot_flutterapp_pacman/game/components/pacman.dart';
import 'package:mciot_flutterapp_pacman/game/logic/direction.dart';
import 'package:mciot_flutterapp_pacman/game/logic/position.dart';
import 'movement.dart';

class Player {
  PacMan pacman = PacMan();
  Position pos;
  late Movement _movement;

  Player(this.pos) {
    _movement = Movement(currentpos: this.pos);
  }

  PacMan getWidget() {
    return pacman;
  }


  void move(Direction direction) {
    pos = _movement.move(direction);
  }
}