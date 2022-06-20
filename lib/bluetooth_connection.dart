import 'dart:typed_data';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:mciot_flutterapp_pacman/game/logic/direction.dart';

///Movement UP -> X Variable increases
///Movement Down -> X Variable decreases
///Movement left -> Z Variable
///Movement right -> Z Variable

class BluetoothConnection {
  int acc_x = 0;
  int acc_y = 0;
  int acc_z = 0;
  /**
   * Binning => bin 5 points together and get their mean to reduce noise,
   */
  List<int> accXValues = [];
  List<int> accYValues = [];
  List<int> accZValues = [];
  String _connectionStatus = "Disconnected";
  int binning = 2;
  bool isConnected = false;
  bool earConnectFound = false;
  
  double getAccX(int binningsize) {
    return acc_x + 0.0;
    int sum = 0;
    if(accXValues.length < binningsize) {
      return 0;
    }
    for(int i = accXValues.length - 1;  i > accXValues.length - binningsize; i--) {
      sum+= accXValues[i];
    }
    return sum/binningsize;
  }

  double getAccY(int binningsize) {
    return acc_y+0.0;
    int sum = 0;
    if(accYValues.length < binningsize) {
      return 0;
    }
    for(int i = accYValues.length - 1;  i > accYValues.length - binningsize; i--) {
      sum+= accYValues[i];
    }
    return sum/binningsize;
  }

  double getAccZ(int binningsize) {
    return acc_z +0.0;
    int sum = 0;
    if(accZValues.length < binningsize) {
      return 0;
    }
    for(int i = accZValues.length - 1;  i > accZValues.length - binningsize; i--) {
      sum+= accZValues[i];
    }
    return sum/binningsize;
  }

  void connect() {
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
            isConnected = state == BluetoothDeviceState.connected;
            _connectionStatus = (isConnected) ? "Connected" : "Disconnected";
          });
          await r.device.connect();

          //Service Discovery
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
            }
          }
        }
      }
    });
  }

  void updateAccelerometer(rawData) {
    Int8List bytes = Int8List.fromList(rawData);
    // description based on placing the earable into your right ear canal
    acc_x = bytes[14];
    acc_y = bytes[16];
    acc_z = bytes[18];
    accXValues.add(acc_x);
    accYValues.add(acc_y);
    accZValues.add(acc_z);
    print("X: " + getAccX(binning).toString());
    print("Y: " + getAccY(binning).toString());
    print("Z: " + getAccZ(binning).toString());
    print("_______________________________________________________");
  }

  Direction getDirection() {
    if(getAccY(5) > 18) {
      return Direction.UP;
    } else if(getAccY(5) < 0) {
      return Direction.DOWN;
    } else if(getAccZ(5) < -10) {
      return Direction.RIGHT;
    } else if(getAccZ(5) > 10) {
      return Direction.LEFT;
    }
    return Direction.ERROR;
  }

}