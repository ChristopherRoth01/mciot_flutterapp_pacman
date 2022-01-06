import 'package:flutter/material.dart';
import 'package:mciot_flutterapp_pacman/entry_screen.dart';

class ScoreScreen extends StatelessWidget {
  int score;
  bool won;

  ScoreScreen({required this.score, required this.won});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Visibility(
                visible: won,
                child: Text(
                  "You won!",
                  style: Theme.of(context).textTheme.headline3,
                ),
                replacement: Text(
                  "You lost!",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Score: " + score.toString(),
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Expanded(
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EntryScreen();
                  }));
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Restart", style: Theme.of(context).textTheme.bodyText1,),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow, width: 4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
