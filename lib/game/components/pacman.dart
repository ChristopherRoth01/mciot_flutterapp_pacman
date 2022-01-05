import 'package:flutter/material.dart';

class PacMan extends StatefulWidget {
  double angle;
  PacMan({this.angle = 0});

  getAngle() {
    return angle;
  }
  @override
  _PacManState createState() => _PacManState();
}

class _PacManState extends State<PacMan> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Transform(
        transform: Matrix4.rotationY(widget.angle),
        child: Image(
          image: AssetImage("assets/images/1200px-Pacman.svg.png"),
        ),
    ),
    );
  }
}
