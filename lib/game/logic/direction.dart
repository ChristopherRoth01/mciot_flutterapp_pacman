import "dart:math" show pi;
import 'dart:math';

class Direction {
  static Direction LEFT = Direction("left");
  static Direction RIGHT = Direction("right");
  static Direction DOWN = Direction("down");
  static Direction UP = Direction("up");
  static Direction ERROR = Direction("error");

  String direction;
  double _angle = 0.0;

  Direction(this.direction) {
    if(direction == "left") {
      _angle = pi;
    } else if(direction == "right") {
      _angle = 0;
    } else if(direction == "down") {
      _angle = pi/2;
    } else if(direction == "up") {
      _angle = pi/2 + pi;
    }
  }

  getAngle() {
    return _angle;
  }

  static Direction getRandomDirection() {
    int rand = Random().nextInt(4);
    if(rand == 0) {
      return Direction.RIGHT;
    } else if(rand == 1) {
      return Direction.LEFT;
    } else if(rand == 2) {
      return Direction.DOWN;
    } else {
      return Direction.UP;
    }

  }


}