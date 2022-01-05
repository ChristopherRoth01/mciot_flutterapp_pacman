import 'package:flutter/cupertino.dart';
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
            onPressed:() {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => HelpScreen()));
            },
            child: const Icon(
              Icons.help_outline_outlined,
              color: Colors.yellow,
              size: 50,
            ),
          ),
        )
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
              color: Colors.yellow,
              width: 5,
            ),
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Expanded(
                child:Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("This is the heading, and it's so long, it's going out of the boundaries if flutter makes now brake."),
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                }, child:
                const Icon(
                  Icons.arrow_back,
                  color: Colors.yellow,
                ),
                ),
              ],
            )
          ],
        )
        ),
    );
  }
}

