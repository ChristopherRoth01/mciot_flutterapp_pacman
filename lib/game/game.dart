import 'package:flutter/material.dart';
import 'package:mciot_flutterapp_pacman/game/score.dart';

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
              flex: 4,child: Center(child: Text("HI!"))),
          Expanded(child: Score()),
        ],
      ),
    );
  }
}
