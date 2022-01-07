import 'package:mciot_flutterapp_pacman/game/logic/direction.dart';
import 'package:mciot_flutterapp_pacman/game/logic/position.dart';

import '../../settings.dart';

class Movement {

  Position currentpos;

  Movement({required this.currentpos});

  Position move(Direction direction) {
    if (direction == Direction.RIGHT) {
      return _moveRight();
    } else if (direction == Direction.LEFT) {
      return _moveLeft();
    } else if (direction == Direction.DOWN) {
      return _moveDown();
    } else if (direction == Direction.UP) {
      return _moveUp();
    }
    throw ArgumentError("You shall not move in this direction!");
  }

  Position _moveLeft() {
    Position newpos = Position(x: currentpos.x - 1, y: currentpos.y);
    if (Settings.currentlySelectedMap.positionExistsAndMoveable(newpos)) {
      currentpos = newpos;
      return newpos;
    }
    return currentpos;
  }

  Position _moveRight() {
    Position newpos = Position(x: currentpos.x + 1, y: currentpos.y);
    if (Settings.currentlySelectedMap.positionExistsAndMoveable(newpos)) {
      currentpos = newpos;
      return newpos;
    }
    return currentpos;
  }

  Position _moveDown() {
    Position newpos = Position(x: currentpos.x, y: currentpos.y + 1);
    if (Settings.currentlySelectedMap.positionExistsAndMoveable(newpos)) {
      currentpos = newpos;
      return newpos;
    }
    return currentpos;
  }

  Position _moveUp() {
    Position newpos = Position(x: currentpos.x, y: currentpos.y - 1);
    if (Settings.currentlySelectedMap.positionExistsAndMoveable(newpos)) {
      currentpos = newpos;
      return newpos;
    }
    return currentpos;
  }
}
