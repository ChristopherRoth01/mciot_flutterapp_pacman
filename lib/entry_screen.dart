import 'package:flutter/material.dart';

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
              flex: 4,
              child: Center(
                child: Text(
                  "PACMAN",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 70,
                    fontFamily: 'Crack Man',
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {},
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
                        style: TextStyle(
                          fontFamily: 'Crack Man',
                          fontSize: 30,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
                child: SizedBox(
            ),
            ),
          ],
        ),
      ),
    );
  }
}
