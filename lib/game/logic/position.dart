/*
Declares Position on the map.
 */
class Position {
  int x;
  int y;

  Position({required this.x, required this.y});

  @override
  String toString(){
    return "x: " + x.toString() + "   " + "y: " + y.toString();
  }

  @override
  bool operator ==(Object other) =>
      other is Position && x == other.x && y == other.y;
}