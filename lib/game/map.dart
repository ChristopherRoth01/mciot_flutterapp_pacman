import 'package:flutter/material.dart';
import 'package:mciot_flutterapp_pacman/constants.dart';
import 'package:mciot_flutterapp_pacman/game/map_options.dart';

import 'components/barrier.dart';
import 'components/food.dart';
import 'components/pacman.dart';
import 'direction.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  int _pacmanPosition = 15;
  Direction _direction = Direction.RIGHT;
  String currentDirection = "";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if(details.delta.dx > 0) {
          setState(() {
            _direction = Direction.RIGHT;
          });
        } else if(details.delta.dx < 0) {
          setState(() {
            _direction = Direction.LEFT;
          });
        }
      },

      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: crossAxisCountMap * mainAxisCountMap,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCountMap),
          itemBuilder: (BuildContext context, int index) {
            if (index % crossAxisCountMap == 0 ||
                index / crossAxisCountMap < 1 ||
                index / crossAxisCountMap >= mainAxisCountMap - 1 ||
                index % crossAxisCountMap == crossAxisCountMap - 1) {
              return Barrier();
            } else if (MapOptions.smallMap.contains(index)) {
              return Barrier();
            } else if (index == _pacmanPosition) {
              return Transform.rotate(angle: _direction.getAngle(),
              child:PacMan(angle:_direction.getAngle(),),
              );
            } else {
              return Food();
            }
          }),
    );
  }
}
