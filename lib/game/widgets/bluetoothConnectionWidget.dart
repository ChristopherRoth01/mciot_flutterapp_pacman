import 'package:flutter/material.dart';

class BluetoothConnectionWidget extends StatefulWidget {
  Widget child;
  BluetoothConnectionWidget({Key? key, required this.child}) : super(key: key);

  @override
  _BluetoothConnectionWidgetState createState() => _BluetoothConnectionWidgetState();
}

class _BluetoothConnectionWidgetState extends State<BluetoothConnectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }
}
