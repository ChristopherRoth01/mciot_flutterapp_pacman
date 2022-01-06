import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  int counter = 0;
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  void incrementCount() {
    setState(() {
      widget.counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text("Score : " + widget.counter.toString(), style: Theme.of(context).textTheme.headline3)),
      ],
    );
  }
}
