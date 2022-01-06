import 'package:flutter/material.dart';

class Food extends StatelessWidget {
  bool _isEaten = false;

  void eat() {
    _isEaten = true;
  }
  bool isEaten() {
    return _isEaten;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_isEaten,
      child: const Padding(
        padding: EdgeInsets.all(13.0),
        child: Image(
          image: AssetImage("assets/images/food.png"),
        ),
      ),
    );
  }
}


