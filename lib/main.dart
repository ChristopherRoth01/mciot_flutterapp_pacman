import 'package:flutter/material.dart';
import 'package:mciot_flutterapp_pacman/entry_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(

        colorScheme:
        const ColorScheme.light(
            primary: Color(0xFF0A0E21),
            secondary: Colors.purple),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        textTheme: const TextTheme (
            headline1: TextStyle(
              color: Colors.white,
            ),
            headline2: TextStyle(
              color: Colors.white,
            ),
            headline3: TextStyle(
              color: Colors.white,
            ),
            headline4: TextStyle(
              color: Colors.white,
            ),
            headline5: TextStyle(
              color: Colors.white,
            ),
            headline6: TextStyle(
              color: Colors.white,
            ),
            bodyText1: TextStyle(
              color: Colors.white,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
            ),
          caption: TextStyle(
            color: Colors.white,
          ),
          button: TextStyle(
            color: Colors.white,
          ),
          overline: TextStyle(
            color: Colors.white,
          ),
        )
    ),
    home: EntryScreen(),
  ));
}

