import 'package:flutter/material.dart';
import 'package:mciot_flutterapp_pacman/game/score.dart';
import 'package:mciot_flutterapp_pacman/game/map.dart';
import 'components/pacman.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 4,child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(child: Map()),
              ),
          ),
          Expanded(child: Score()),
        ],
      ),
    );
  }
}
