import 'package:flutter/material.dart';

class PacMan extends StatelessWidget {
  const PacMan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(2.0),
        child: Image(
          image: AssetImage("assets/images/1200px-Pacman.svg.png"),
        ),
    );
  }
}

