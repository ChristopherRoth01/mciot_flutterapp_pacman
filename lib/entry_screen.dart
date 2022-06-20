
import 'package:flutter/material.dart';
import 'package:mciot_flutterapp_pacman/constants.dart';
import 'package:mciot_flutterapp_pacman/settings.dart';
import 'game/widgets/game.dart';
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
            const Expanded(
              flex: 1,
              child: SizedBox(

              ),
            ),
            Expanded(
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Settings(),
                  const Help(),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      gameName_caps,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Center(
                    child: Text(
                      "the Earable version",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: TextButton(
                onPressed: () {
                  if(Settings.connection.isConnected) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const Game();
                      }),
                    );
                  } else {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Earable connection'),
                        content: const Text('You need to connect your earables before playing! \n Visit the Settings Page!'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Dismiss'),
                          ),

                        ],
                      ),
                    );
                  }
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
