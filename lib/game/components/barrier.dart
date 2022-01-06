import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  const Barrier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage("assets/images/barrier_pacman_500.png"),
    );
  }
}
