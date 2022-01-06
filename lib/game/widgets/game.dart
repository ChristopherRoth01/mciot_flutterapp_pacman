import 'package:flutter/material.dart';
import 'package:mciot_flutterapp_pacman/game/widgets/score.dart';
import 'package:mciot_flutterapp_pacman/game/widgets/pacmap.dart';
import '../components/pacman.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PacMap(),
    );
  }
}
