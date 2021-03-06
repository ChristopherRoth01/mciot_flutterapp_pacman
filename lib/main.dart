import 'package:flutter/material.dart';
import 'package:mciot_flutterapp_pacman/bluetooth_connection.dart';
import 'package:mciot_flutterapp_pacman/entry_screen.dart';
import 'package:flutter_blue/flutter_blue.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(

        colorScheme:
        const ColorScheme.light(
            primary: Color(0xFF0A0E21),
            secondary: Colors.yellow,
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        textTheme: const TextTheme (
            headline1: TextStyle(
              color: Colors.yellow,
              fontSize: 70,
              fontFamily: 'Crack Man',
            ),
            headline2: TextStyle(
              color: Colors.yellow,
              fontSize: 50,
              fontFamily: 'Crack Man',
            ),
            headline3: TextStyle(
              color: Colors.yellow,
              fontSize: 40,
              fontFamily: 'Crack Man',
            ),
            bodyText1: TextStyle(
              color: Colors.yellow,
              fontSize: 20,
              fontFamily: 'Pac Man',
              fontWeight: FontWeight.w200,
            ),
            bodyText2: TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          caption: TextStyle(
            color: Colors.white,
          ),
        )
    ),
    home: EntryScreen(),
  ));
}

