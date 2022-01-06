import 'package:flutter/cupertino.dart';
import 'package:mciot_flutterapp_pacman/game/components/barrier.dart';
import 'package:mciot_flutterapp_pacman/game/components/food.dart';
import 'package:mciot_flutterapp_pacman/game/logic/position.dart';

/// Contains possible Maps with barriers.
/// TODO: create your own Map
class MapOptions {
  static List<Position> smallMapBarrier = [
    Position(x: 0, y: 0),
    Position(x: 1, y: 0),
    Position(x: 2, y: 0),
    Position(x: 3, y: 0),
    Position(x: 4, y: 0),
    Position(x: 5, y: 0),
    Position(x: 6, y: 0),
    Position(x: 7, y: 0),
    Position(x: 8, y: 0),
    Position(x: 9, y: 0),
    Position(x: 10, y: 0),
    Position(x: 0, y: 1),
    Position(x: 0, y: 2),
    Position(x: 0, y: 3),
    Position(x: 0, y: 4),
    Position(x: 0, y: 5),
    Position(x: 0, y: 6),
    Position(x: 0, y: 7),
    Position(x: 0, y: 8),
    Position(x: 0, y: 9),
    Position(x: 0, y: 10),
    Position(x: 0, y: 11),
    Position(x: 0, y: 12),
    Position(x: 0, y: 13),
    Position(x: 0, y: 14),
    Position(x: 10, y: 1),
    Position(x: 10, y: 2),
    Position(x: 10, y: 3),
    Position(x: 10, y: 4),
    Position(x: 10, y: 5),
    Position(x: 10, y: 6),
    Position(x: 10, y: 7),
    Position(x: 10, y: 8),
    Position(x: 10, y: 9),
    Position(x: 10, y: 10),
    Position(x: 10, y: 11),
    Position(x: 10, y: 12),
    Position(x: 10, y: 13),
    Position(x: 10, y: 14),
    Position(x: 1, y: 14),
    Position(x: 2, y: 14),
    Position(x: 3, y: 14),
    Position(x: 4, y: 14),
    Position(x: 5, y: 14),
    Position(x: 6, y: 14),
    Position(x: 7, y: 14),
    Position(x: 8, y: 14),
    Position(x: 9, y: 14),
    Position(x: 1, y : 2),
    Position(x: 2, y : 2),
    Position(x: 3, y : 2),
    Position(x: 7, y : 2),
    Position(x: 8, y : 2),
    Position(x: 9, y : 2),
    Position(x: 1, y : 12),
    Position(x: 2, y : 12),
    Position(x: 3, y : 12),
    Position(x: 7, y : 12),
    Position(x: 8, y : 12),
    Position(x: 9, y : 12),
    Position(x: 2, y : 4),
    Position(x: 3, y : 4),
    Position(x: 4, y : 4),
    Position(x: 6, y : 4),
    Position(x: 7, y : 4),
    Position(x: 8, y : 4),
    Position(x: 2, y : 10),
    Position(x: 3, y : 10),
    Position(x: 4, y : 10),
    Position(x: 6, y : 10),
    Position(x: 7, y : 10),
    Position(x: 8, y : 10),
    Position(x: 3, y: 5),
    Position(x: 3, y: 6),
    Position(x: 3, y: 7),
    Position(x: 3, y: 8),
    Position(x: 3, y: 9),
    Position(x: 7, y: 5),
    Position(x: 7, y: 6),
    Position(x: 7, y: 7),
    Position(x: 7, y: 8),
    Position(x: 7, y: 9),
  ];
  static MapOptions smallMap_options = MapOptions(11, 15, smallMapBarrier);

  List<Position> barriers;
  int crossAxisCount = 0;
  int mainAxisCount = 0;
  Food food = Food();
  final Map<Position, Food> _food = {};
  final Map<Position, Barrier> _barrier = {};

  ///For map with no barriers you need to provide an empty barriers list. For use call init() method.
  MapOptions(this.crossAxisCount, this.mainAxisCount, this.barriers) {
    init();
  }

  void init() {
    for (int i = 0; i < crossAxisCount; i++) {
      for (int j = 0; j < mainAxisCount; j++) {
        Position pos = Position(x: i, y: j);
        if (barriers.contains(pos)) {
          _barrier[pos] = Barrier();
        } else {
          _food[pos] = Food();
        }
      }
    }
  }
  int getFoodNumber() {
    return _food.keys.length;
  }
  bool positionExistsAndMoveable(Position pos) {
    return _food.keys.contains(pos);
  }

  bool barrierAt(Position pos) {
    return _barrier.keys.contains(pos);
  }
  Food? getFoodAt(Position pos) {
    return _food[pos];
  }
  Widget getElementWithIndex(int index) {
    Position pos = Position(
        x: index % crossAxisCount, y: (index / crossAxisCount).floor());
    if (_food.keys.contains(pos)) {
      return food;
    } else if (_barrier.keys.contains(pos)) {
      return const Barrier();
    } else {
      return const Text("This should never be called!");
    }
  }
}
