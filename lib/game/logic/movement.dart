import 'dart:typed_data';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:mciot_flutterapp_pacman/game/logic/direction.dart';
import 'package:mciot_flutterapp_pacman/game/logic/position.dart';

import '../../settings.dart';

class Movement {
  String _connectionStatus = "Disconnected";
  String _heartRate = "- bpm";
  String _bodyTemperature = '- °C';

  String _accX = "-";
  String _accY = "-";
  String _accZ = "-";

  String _ppgGreen = "-";
  String _ppgRed = "-";
  String _ppgAmbient = "-";

  bool _isConnected = false;

  bool earConnectFound = false;
  Position currentpos;

  Movement({required this.currentpos}) {
    _connect();
  }

  Position move(Direction direction) {
    if (direction == Direction.RIGHT) {
      return _moveRight();
    } else if (direction == Direction.LEFT) {
      return _moveLeft();
    } else if (direction == Direction.DOWN) {
      return _moveDown();
    } else if (direction == Direction.UP) {
      return _moveUp();
    }
    throw ArgumentError("You shall not move in this direction!");
  }
  void _connect() {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    // start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));

    // listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) async {

      // do something with scan results
      for (ScanResult r in results) {
        if (r.device.name == "earconnect" && !earConnectFound) {
          earConnectFound = true; // avoid multiple connects attempts to same device

          await flutterBlue.stopScan();

          r.device.state.listen((state) { // listen for connection state changes
              _isConnected = state == BluetoothDeviceState.connected;
              _connectionStatus = (_isConnected) ? "Connected" : "Disconnected";

          });

          await r.device.connect();

          var services = await r.device.discoverServices();

          for (var service in services) { // iterate over services
            for (var characteristic in service.characteristics) { // iterate over characterstics
              switch (characteristic.uuid.toString()) {
                case "0000a001-1212-efde-1523-785feabcd123":
                  print("Starting sampling ...");
                  await characteristic.write([0x32, 0x31, 0x39, 0x32, 0x37, 0x34, 0x31, 0x30, 0x35, 0x39, 0x35, 0x35, 0x30, 0x32, 0x34, 0x35]);
                  await Future.delayed(Duration(seconds: 2)); // short delay before next bluetooth operation otherwise BLE crashes
                  characteristic.value.listen((rawData) => {
                    updateAccelerometer(rawData),

                  });
                  await characteristic.setNotifyValue(true);
                  await Future.delayed(Duration(seconds: 2));
                  break;
              }
            };
          };
        }

      }
    });
  }

  void updateAccelerometer(rawData) {
    Int8List bytes = Int8List.fromList(rawData);

    // description based on placing the earable into your right ear canal
    int acc_x = bytes[14];
    int acc_y = bytes[16];
    int acc_z = bytes[18];
    _accX = acc_x.toString() + " (unknown unit)";
    _accY = acc_y.toString() + " (unknown unit)";
    _accZ = acc_z.toString() + " (unknown unit)";
    print(_accX);
    print(_accY);
    print(_accZ);
  }

  Position _moveLeft() {
    Position newpos = Position(x: currentpos.x - 1, y: currentpos.y);
    if (Settings.currentlySelectedMap.positionExistsAndMoveable(newpos)) {
      currentpos = newpos;
      return newpos;
    }
    return currentpos;
  }

  Position _moveRight() {
    Position newpos = Position(x: currentpos.x + 1, y: currentpos.y);
    if (Settings.currentlySelectedMap.positionExistsAndMoveable(newpos)) {
      currentpos = newpos;
      return newpos;
    }
    return currentpos;
  }

  Position _moveDown() {
    Position newpos = Position(x: currentpos.x, y: currentpos.y + 1);
    if (Settings.currentlySelectedMap.positionExistsAndMoveable(newpos)) {
      currentpos = newpos;
      return newpos;
    }
    return currentpos;
  }

  Position _moveUp() {
    Position newpos = Position(x: currentpos.x, y: currentpos.y - 1);
    if (Settings.currentlySelectedMap.positionExistsAndMoveable(newpos)) {
      currentpos = newpos;
      return newpos;
    }
    return currentpos;
  }
}
