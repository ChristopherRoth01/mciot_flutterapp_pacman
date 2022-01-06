import 'package:mciot_flutterapp_pacman/game/components/pacman.dart';
import 'package:mciot_flutterapp_pacman/game/logic/position.dart';

import '../../settings.dart';

class Player {
  PacMan pacman = PacMan();
  Position pos;
  Player({required this.pos});

  PacMan getWidget() {
    return pacman;
  }

  void moveLeft() {
    Position newpos = Position(x: pos.x - 1, y: pos.y);
    if(Settings.currentlySelectedMap.positionExistsAndMoveable(newpos)) {
      pos = Position(x: pos.x - 1, y: pos.y);
    }
  }
  void moveRight() {
    Position newpos = Position(x: pos.x + 1, y: pos.y);
    if(Settings.currentlySelectedMap.positionExistsAndMoveable(newpos)) {
      pos = newpos;
    }
  }
  void moveDown() {
    Position newpos = Position(x: pos.x, y: pos.y + 1);
    if(Settings.currentlySelectedMap.positionExistsAndMoveable(newpos)){
      pos = newpos;
    }
  }
  void moveUp() {
    Position newpos = Position(x: pos.x, y: pos.y - 1);
    if(Settings.currentlySelectedMap.positionExistsAndMoveable(newpos))  {
      pos = newpos;
    }
  }
}