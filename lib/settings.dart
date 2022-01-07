import 'package:flutter/material.dart';
import 'package:mciot_flutterapp_pacman/game/logic/map_options.dart';

import 'constants.dart';

class Settings extends StatelessWidget {
  static MapOptions currentlySelectedMap = MapOptions.smallMap_options;
  static int numberOfGhosts = 4;
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(iconPadding),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SettingsPage()));
        },
        child: const Icon(
          Icons.settings,
          color: Colors.yellow,
          size: 50.0,
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
                  child: Text(
                    "Settings",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex:1,
                            child: Text(
                              "Map:",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                        ),
                        Expanded(
                          flex: 3,
                          child: DropdownButton(
                          items: <MapOptions>[MapOptions.smallMap_options].map((MapOptions value) {
                                return DropdownMenuItem<MapOptions>(
                                value: value,
                                child: Text(value.toString(), style: Theme.of(context).textTheme.bodyText2,),
                                );
                                }).toList(),
                                onChanged: (_) {},

                          ),

                        ),
                      ],
                    ),
                  ],
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
              )
            ],
          )),
    );
  }
}
