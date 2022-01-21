import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mciot_flutterapp_pacman/bluetooth_connection.dart';
import 'package:mciot_flutterapp_pacman/game/components/ghost.dart';
import 'package:mciot_flutterapp_pacman/game/end_screen.dart';
import 'package:mciot_flutterapp_pacman/game/logic/ghosts.dart';
import 'package:mciot_flutterapp_pacman/game/logic/player.dart';
import 'package:mciot_flutterapp_pacman/game/logic/position.dart';

import '../../settings.dart';
import '../logic/direction.dart';

class PacMap extends StatefulWidget {
  PacMap({Key? key}) : super(key: key);
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<PacMap> {
  BluetoothConnection bluetoothConnection = BluetoothConnection();
  Player player = Player(Position(x: 5, y: 5));
  List<GhostModel> ghostStartingPositions = [GhostModel(Position(x: 9, y:1)), GhostModel(Position(x: 1, y:13)),GhostModel(Position(x:9 , y:13)) ];
  Direction _direction = Direction.RIGHT;
  bool gameRunning = false;
  int score = 0;
  bool _pacVisible = false;
  double directionX = 0;
  double directionY = 0;
  double directionZ = 0;
  final Map<int, bool> _visible = {};

  void checkForGhostCollision() {
    if(ghostHasPosition(player.pos)) {
      end();
    }
  }
  void checkForEatableFood() {
    if (_visible[player.pos.y * Settings.currentlySelectedMap.crossAxisCount +
            player.pos.x] ==
        true) {
      setState(() {
        _visible[player.pos.y * Settings.currentlySelectedMap.crossAxisCount +
            player.pos.x] = false;
        score++;
      });
    }
  }
  void startListening() {
    Timer.periodic(const Duration(milliseconds: 150), (timer) {
      setState(() {
        directionX = bluetoothConnection.getAccX(bluetoothConnection.binning);
        directionY = bluetoothConnection.getAccY(bluetoothConnection.binning);
        directionZ = bluetoothConnection.getAccZ(bluetoothConnection.binning);
      });
    });

  }
  void start() {
    bluetoothConnection.connect();

    gameRunning = true;
    setFoodVisible();
    Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (!gameRunning) {
        timer.cancel();
      }
      setState(() {
        for (var element in ghostStartingPositions) {
          element.move(Direction.getRandomDirection());
        }
        checkForGhostCollision();
      });

        player.move(_direction);
        checkForEatableFood();
        if (score == Settings.currentlySelectedMap.getFoodNumber()) {
          timer.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return ScoreScreen(score: score, won: true);
            }),
          );
        }
      });
  }

  void end() {
    gameRunning = false;
    goToEndScreen(false);
  }

  void goToEndScreen(bool won) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return ScoreScreen(score: score, won: won);
      }),
    );
  }

  void setFoodVisible() {
    _pacVisible = true;
    for (int i = 0;
    i <
        Settings.currentlySelectedMap.crossAxisCount *
            Settings.currentlySelectedMap.mainAxisCount;
    i++) {
      _visible[i] = true;
    }
  }

  bool ghostHasPosition(Position position) {
    for(GhostModel ghost in ghostStartingPositions) {
      if(ghost.pos == position) {
        return true;
      }
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    bool testing = true; //TODO: remove when not needed anymore
    if (testing) {
      return Column(
        children: [
          TextButton(onPressed: startListening, child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.yellow,
            ),
            child: Text("Start"),
          )),
          Expanded(child: Text("X: " + directionX.toString())),
          Expanded(child: Text("Y: " + directionY.toString())),
          Expanded(child: Text("Z: " + directionZ.toString())),
        ],
      );
    } else {
      return Column(
        children: [
          Expanded(
            flex: 7,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0) {
                  setState(() {
                    _direction = Direction.RIGHT;
                  });
                } else if (details.delta.dx < 0) {
                  setState(() {
                    _direction = Direction.LEFT;
                  });
                }
              },
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 0) {
                  setState(() {
                    _direction = Direction.DOWN;
                  });
                } else if (details.delta.dy < 0) {
                  setState(() {
                    _direction = Direction.UP;
                  });
                }
              },
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: Settings.currentlySelectedMap.crossAxisCount,
                children: List<Widget>.generate(
                  Settings.currentlySelectedMap.crossAxisCount *
                      Settings.currentlySelectedMap.mainAxisCount,
                      (index) {
                    if (player.pos.y *
                        Settings.currentlySelectedMap.crossAxisCount +
                        player.pos.x ==
                        index) {
                      return Visibility(
                        visible: _pacVisible,
                        child: Transform.rotate(
                          angle: _direction.getAngle(),
                          child: player.getWidget(),
                        ),
                      );
                    } else if (ghostHasPosition(Position(
                        x: index % Settings.currentlySelectedMap.crossAxisCount,
                        y: (index / Settings.currentlySelectedMap
                            .crossAxisCount).floor()))) {
                      return Visibility(
                        child: Ghost(),
                        visible: _pacVisible,);
                    }
                    return Visibility(
                      visible: _visible[index] ?? false,
                      child: Settings.currentlySelectedMap.getElementWithIndex(
                          index),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Visibility(
                  visible: !gameRunning,
                  child: Center(
                    child: TextButton(
                      onPressed: start,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Start",
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow, width: 4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: end,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "End",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow, width: 4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Text(
                "Score: $score",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline3,
              )),
        ],
      );
    }
  }
  }

