import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mciot_flutterapp_pacman/bluetooth_connection.dart';
import 'package:mciot_flutterapp_pacman/game/logic/map_options.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'constants.dart';

class Settings extends StatelessWidget {
  static MapOptions currentlySelectedMap = MapOptions.smallMap_options;
  static BluetoothConnection connection = BluetoothConnection();
  static int numberOfGhosts = 1;
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


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}


class _SettingsPageState extends State<SettingsPage> {
  bool _connecting = false;
  bool connected = false;
  void connect() {
    Settings.connection.connect();
    setState(() {
      _connecting = true;
    });
    Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if(Settings.connection.isConnected) {
        setState(() {
          _connecting = false;
          connected = true;
        });
      }
    });
  }
  Widget textButton() {
    if(connected) {
      return Text("Connected");
    } else {
      return TextButton (
        onPressed: () {
          connect();
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Connect".toUpperCase(), style: Theme.of(context).textTheme.bodyText2,),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow, width: 4),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text("Bluetooth", style: Theme.of(context).textTheme.bodyText2,),
                        ),
                        Expanded(
                          flex: 2,
                            child: textButton()
                        ),
                        Expanded(child: Visibility(
                          visible: _connecting,
                          child: SpinKitRotatingCircle(
                            color: Colors.yellow,
                            size: 50.0,
                          ),
                        ),),
                      ],
                    ),
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
        ),
      ),
    );
  }
}
