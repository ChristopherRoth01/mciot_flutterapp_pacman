import 'package:flutter/material.dart';

class Ghost extends StatelessWidget {
  const Ghost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(0),
      child: Image(
        image: AssetImage("assets/images/ghost1.png"),
      ),
    );
  }
}

