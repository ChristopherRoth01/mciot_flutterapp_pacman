import "dart:math" show pi;

class Direction {
  static Direction LEFT = Direction("left");
  static Direction RIGHT = Direction("right");
  static Direction DOWN = Direction("down");
  static Direction UP = Direction("up");

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
      _angle = -pi/2;
    }
  }

  getAngle() {
    return _angle;
  }


}