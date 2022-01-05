import 'package:flutter/material.dart';

class PacMan extends StatefulWidget {
  const PacMan({Key? key}) : super(key: key);

  @override
  _PacManState createState() => _PacManState();
}

class _PacManState extends State<PacMan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(image: AssetImage("pacman_closed.png")),
    );
  }
}
