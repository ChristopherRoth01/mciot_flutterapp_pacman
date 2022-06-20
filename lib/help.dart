import 'package:flutter/material.dart';
import 'package:mciot_flutterapp_pacman/constants.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.all(iconPadding),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HelpScreen()));
            },
            child: const Icon(
              Icons.help_outline_outlined,
              color: Colors.yellow,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                child: Text(
                  "Help",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            const Expanded(
              flex: 4,
                child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text("Welcome to PacMan - The Earable Version. "
                        "Basically this is PacMan, but you can control your PacMan with the help of "
                        "earables, in this special case, the cosinuss one. \n Before you start playing, "
                        "make sure to connect your earables in the Settings page. You can find it through clicking "
                        "on the icon in the left upper corner of the starting screen.",),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
