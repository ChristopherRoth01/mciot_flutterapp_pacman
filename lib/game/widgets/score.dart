import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  const Score({Key? key}) : super(key: key);

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text("Score :", style: Theme.of(context).textTheme.headline3)),

        Expanded(
          child: Text("HighScore:",style: Theme.of(context).textTheme.headline3)),
      ],
    );
  }
}
