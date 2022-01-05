import 'package:flutter/material.dart';

class Food extends StatefulWidget {
  const Food ({Key? key}) : super(key: key);

  @override
  _StateFood createState() => _StateFood();
}

class _StateFood extends State<Food> {
  bool isEaten = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Image(image: AssetImage(
        "assets/images/food.png"
      ),
      ),
    );
  }
}
