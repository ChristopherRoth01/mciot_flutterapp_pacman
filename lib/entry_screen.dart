import 'package:flutter/material.dart';
import 'package:mciot_flutterapp_pacman/constants.dart';
import 'package:mciot_flutterapp_pacman/settings.dart';
import 'game/game.dart';
import 'help.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Settings(),
                  const Help(),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  gameName_caps,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const Game();
                    }),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.yellow,
                        width: 5.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Start",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
